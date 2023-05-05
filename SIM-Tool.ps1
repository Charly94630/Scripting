$Intro = @' 

    ***********************                               ***********************


                                 SIM Fix Tool   
   
    ***********************                               ***********************
'@
  
  
write-host -ForegroundColor Magenta $Intro

$SIMPATH = 'c:\SIM'
$UNCPATH = '\\tata.com.uy\archivos\publicas\OPRTIT\SIM'
$USERS = Get-ChildItem c:\users


DO {

write-host -ForegroundColor Magenta '1 - Error de seguridad'
write-host -ForegroundColor Magenta '2 - Error de ejecución'
write-host -ForegroundColor Magenta '3 - Limpiar cache'
write-host -ForegroundColor Magenta '4 - Reinstalacion limpia'
Write-Host -ForegroundColor Magenta '5 - Error de credenciales'
Write-Host -ForegroundColor Magenta '6 - Tirilla recepcion'
Write-host -ForegroundColor Magenta  'Q - Salir'

$opciones = Read-Host





function SIM-security {

$users = Get-ChildItem -Path 'C:\Users'
$securityDirectory = 'AppData\LocalLow\Sun\Java\Deployment\security'
$filePath = 'exception.sites'

foreach ($user in $users) {
  if ($user.PsIsContainer) {
    $userDirectory = $user.FullName
    $fullDirectory = Join-Path $userDirectory $securityDirectory
    $fullFilePath = Join-Path $fullDirectory $filePath

    if (!(Test-Path $fullDirectory)) {
      New-Item -ItemType Directory -Path $fullDirectory
    }

    New-Item -ItemType File -Path $fullFilePath -Force
    Add-Content -Path $fullFilePath -Value "http://prd-sim-app01.or.tata.com.uy:7003"
  }
}


}

function SIM {

$Java = Get-WmiObject -class win32_product | where {$_.name -match 'Java'}


if ($Java -ne $null) {

$Java.uninstall() 

Start-Process "C:\SIM\JavaSetup8u341.exe" -Wait -NoNewWindow -ArgumentList "/s" -PassThru

} else {

Start-Process "C:\SIM\JavaSetup8u341.exe" -Wait -NoNewWindow -ArgumentList "/s" -PassThru

}

}
                     
 
 
 



function ClearCache {

 javaws -clearcache
 javaws -uninstall


}


function CredsError {

 if (Test-Path c:\SIM) { 
    Remove-Item C:\SIM -Recurse }  
    Copy-Item $UNCPATH C:\ -Recurse

    foreach ($env:USERPROFILE in $USERS){
      Remove-Item $env:USERPROFILE\desktop\*SIM* -Recurse
      Copy-Item C:\SIM\SIM-PROD.jnlp c:\users\$env:USERPROFILE\desktop
      }
}


function TirillaRecep {


    $FirefoxVer = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\', 'HKLM:\SOFTWARE\WOW6432Node\\Microsoft\Windows\CurrentVersion\Uninstall\' | 
            Get-ItemProperty | Where-Object {$_.DisplayName -match "Firefox"} |
            Select-Object -Property DisplayName, UninstallString

            foreach ($ver in $FirefoxVer) {
            
            if ($ver.UninstallString) {
            
            $uninstall = $ver.UninstallString
            & cmd /c $uninstall /s /quiet /norestart

            }
            }

}


            



switch ($opciones) {

1 {


SIM-security
Start-Process C:\SIM\SIM-PROD.jnlp; break
 


}


2 {

 
 SIM
 SIM-security
 clearcache
 Start-Process C:\SIM\SIM-PROD.jnlp; break
 


}

3 {


 ClearCache
 Start-Process C:\SIM\SIM-PROD.jnlp; break


}

4 {


SIM
clearcache
Start-Process C:\SIM\SIM-PROD.jnlp; break


}

5 {


CredsError
Start-Process C:\SIM\SIM-PROD.jnlp; break


}

6 {


TirillaRecep
Start-Process C:\SIM\SIM-PROD.jnlp; break


}

default {

; break

}
}
}
 
 while ($opciones -ne 'q')