
function batch-rename-files { param ([String] $Path, [String] $Prefix)
    $i = 0
    cd $Path 
   
    $stat = gci -file
     
	gci -file | ` 
	ForEach-Object { `
        $i = $i + 1; $pct = [math]::Round(($i / $stat.Count)*100) ; `
		Write-Progress -Activity "Renaming..." -PercentComplete $pct; `
		$h = (hash-it $_.FullName); `
		$newname = $_.LastAccessTime.ToString("yyyyMMdd") + '_' + $Prefix + '_'+ $h + ($_.Extension).ToUpper(); ` 
		Rename-Item -Path $_.FullName -Newname $newname ; `
		return ( "`n" + $_.Name + " > " + $newname ); `` 
	}
}

# batch-rename-files -Path "C:\Scan"  -Prefix "Receipt"
