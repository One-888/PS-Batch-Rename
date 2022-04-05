#Using Hash to make a Unique Name
function hash-it { param ([String] $Path)
	return (Get-filehash $Path -Algorithm SHA1 | select hash) 
}

function batch-rename-files { param ([String] $Path, [String] $Prefix)
    $i = 0
	cd $Path 
 
	gci -file | ` 
	ForEach-Object { `
        $i = $i + 1; $pct = [math]::Round(($i / $stat.Count)*100) ; `
		Write-Progress -Activity "Renaming..." -PercentComplete $pct; `
		$h = (hash-it $_.FullName) -replace "@{Hash=","" ; `
		$h = ($h -replace "}","").ToString().Substring(0,8);`
		$newname = $_.LastAccessTime.ToString("yyyyMMdd") + '_' + $Prefix + '_'+ $h + ($_.Extension).ToUpper(); ` 
		Rename-Item -Path $_.FullName -Newname $newname ; `
		return ( "`n" + $_.Name + " > " + $newname ); `` 
	}
}

batch-rename-files -Path "C:\Scan"  -Prefix "Receipt"
