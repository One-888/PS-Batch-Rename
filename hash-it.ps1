#Using Hash to make a Unique Name
function hash-it { param ([String] $Path)
	$h = (Get-filehash $Path -Algorithm SHA1 | select hash) 
    $h = $h -replace "@{Hash=","" ;
    $h = ($h -replace "}","").ToString().Substring(0,20);  # How many chars?
    return ($h)
}

# gci -file | ForEach-Object { hash-it ( $_.FullName) }
