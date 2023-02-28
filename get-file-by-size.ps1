gci -Filter *.MOV | where {  $_.Length -gt 100kb -and $_.Length -lt 10mb } | cp -Destination ""
