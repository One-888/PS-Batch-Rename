function batch-rename-files { param ([String] $Path)
    $i = 0
	cd $Path 
    
    $stat = gci -file
     
	gci -file | ` 
	ForEach-Object { `
        $i = $i + 1; $pct = [math]::Round(($i / $stat.Count)*100) ; `
		Write-Progress -Activity "Renaming..." -PercentComplete $pct; `
		$h = (hash-it $_.FullName);`
		$newname = $h + ($_.Extension).ToUpper(); ` 
		Rename-Item -Path $_.FullName -Newname $newname ; `
		return ( "`n" + $_.Name + " > " + $newname ); `` 
	}
}

# batch-rename-files -Path  "C:\iCloud Photos" 
