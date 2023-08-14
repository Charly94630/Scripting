$javaProducts = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like 'Java*' }
$installerPath = "c:\temp\DeployJava371\jre-8u371-windows-x64.exe"
$destinationPath = "C:\Program Files\Java\jre-1.8\lib\security\java.security"
$securityJava = "c:\temp\DeployJava371\java.security"
$JRE = $null
foreach ($javaProduct in $javaProducts) {
    if ($javaProduct.Name -like "Java(TM) SE Development Kit *") {
       $JDK = $javaProduct
        continue 
    }

    if ($javaProduct.version -ne "8.0.3710.11" -and (-not($javaProduct.Name -like "Java Auto Updater*"))) {
        $JRE = $javaProduct 
                            
    }
     
}


if ($JRE -ne $null){
   $uninstallCommand = "msiexec.exe /x $($JRE.IdentifyingNumber) /qn"
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $uninstallCommand" -NoNewWindow -Wait
    Start-Process -FilePath $installerPath -ArgumentList "/s" -Wait
    Copy-Item  -Path $securityJava -Destination $destinationPath -Recurse

}