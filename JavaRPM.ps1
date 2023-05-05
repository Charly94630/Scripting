$File = "C:\temp\JavaRPM\JavaSetup8u341.exe"
$java = Get-WmiObject -Class win32_product | Where-Object {$_.name -like '*Java 8*'} | Select-Object -First 1 
$currentVersion = [version]$app.Version

if ($java -and ($java.version -ne "8.0.3410.10"))  {

$java.uninstall()
Start-Process -FilePath $File -ArgumentList "/s" -Wait
 } 


elseif (-not($java)) {
Start-Process -FilePath $File -ArgumentList "/s" -Wait

}

else {$java.version -ge "8.0.3410.10" 

Exit

}

