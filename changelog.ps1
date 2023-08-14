$localFile = "C:\temp\DNS_changelog.txt"
$remoteFile = "\\xx.xx.xx\xx\xx\DNS_changelog.txt"
$word = "$env:computerName DNS changed"


$fileContent = Get-Content $localFile


if ($fileContent -notcontains $word) {
   
    $fileContent += "`r`n$word"

   
    $fileContent | Set-Content $localFile

    
    $remoteContent = Get-Content $remoteFile -ErrorAction SilentlyContinue
    if ($remoteContent -notcontains $word) {
        
        Add-Content -Path $remoteFile -Value $fileContent
    }
}
