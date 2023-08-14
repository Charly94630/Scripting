$Intro = @' 

    ***********************                               ***********************


                                IT Support Tool   
   
    ***********************                               ***********************
'@

  
  
write-host -ForegroundColor Red $Intro





$username2 = "Admin"
$password2 = ConvertTo-SecureString "***" -AsPlainText -Force
$credential2 = New-Object System.Management.Automation.PSCredential ($username2, $password2)
New-PSDrive -Name Y -PSProvider FileSystem -Root \\xx.xx.xx.xx\insight -Credential $credential2 -ErrorAction SilentlyContinue

$USERPATH = 'C:\Autoinst'
$UNCPATH = '\\xx.xx.xx.xx\xx\xx\xx\xx'
$UNCINFPATH = '\\xx.xx.xx.xx\xx\xx\xx\xx'
$PUTTYPATH = '\\xx.xx.xx.xx\xx\xx\xx'
$UNCDRIVERS = '\\xx.xx.xx.xx\xx\xx\xx\xx'
$publicdsktp = 'c:\users\public\desktop'





function menu {

write-host -ForegroundColor Magenta 'Ingrese opcion deseada'
Write-Host -ForegroundColor Magenta '  0 - Multi '
write-host -ForegroundColor Magenta '  1 - Informes'
write-host -ForegroundColor Magenta '  2 - Gerencia'
Write-Host -ForegroundColor Magenta '  3 - Gestion'
Write-Host -ForegroundColor Magenta '  4 - Tesoreria / Personal'
Write-Host -ForegroundColor Magenta '  5 - Recepcion'
Write-Host -ForegroundColor Magenta '  6 - Ingresos'
Write-Host -ForegroundColor Magenta '  7 - Cargar usuario' 
Write-Host -ForegroundColor Magenta '  8 - SIM Tool'
Write-Host -ForegroundColor Magenta '  9 - VPN'
Write-Host -ForegroundColor Magenta ' 10 - Inventario'
Write-Host -ForegroundColor Magenta ' 11 - Habilitar Admin'
Write-Host -ForegroundColor Magenta ' 12 - VNC'
Write-Host -ForegroundColor Red     ' 13 - Salir'


}

while ($true){
menu
$opciones = Read-Host

function instalacion_suc {

 Copy-Item -Path "\\xx.xx.xx\xx\xx" -Destination "c:\" -Force
 Copy-Item -Path $UNCPATH -Destination $USERPATH -Recurse -Force
 Copy-Item -Path $PUTTYPATH -Destination 'C:\' -Recurse -Force
 Copy-Item -Path $UNCDRIVERS -Destination 'C:\' -Recurse -Force
 Start-Process "C:\Autoinst\7zip.exe" -wait -ArgumentList "/S" -PassThru
 Start-Process "C:\Autoinst\adobe.exe" -wait -ArgumentList "/sAll /rs /msi EULA_ACCEPT=YESS" -PassThru
 Start-Process "C:\Autoinst\aio.exe" -wait -ArgumentList "/S" -PassThru
 Start-Process "C:\Autoinst\ChromeSetup.exe" -Wait -ArgumentList "/silent /install" -PassThru
 Start-Process "C:\Autoinst\flash.exe" -Wait -ArgumentList "/passive" -PassThru
 Start-Process "C:\Autoinst\inicio.exe" -Wait -ArgumentList "/passive" -PassThru
 Start-Process "C:\Autoinst\LibreOffice_7.4.2_Win_x64.msi" -Wait -ArgumentList "/passive" -PassThru
 #Start-Process "C:\Autoinst\OcsPackage64.exe" -Wait  -ArgumentList "/S" -PassThru
 Start-Process "C:\Autoinst\Xming.exe" -wait -ArgumentList "/silent" -PassThru}

                            
function Insight {
    $columns = "Computer Name", "Marca", "Numero de serie", "Ubicacion", "Modelo", "Nombre y apellido", "Cedula", "Dominio", "Sistema operativo", "Arquitectura so", "Cpu", "Cantidad de Memorias", "Memorias", "Capacidad de memorias", "Velocidad de memorias", "Tamaño de discos"
    $destinationPath = "\\xx.xx.xx.xx\xx\xx.csv"
    $computerInfo = Get-ComputerInfo | Select-Object 'CsName', 'CsManufacturer', 'OsName', 'OsArchitecture', 'CsSystemFamily', 'CsProcessors'
    $diskDriveModel = (Get-WmiObject -Class Win32_DiskDrive).Model
    $biosSerialNumber = (Get-WmiObject -Class Win32_BIOS).SerialNumber
    $processorNames = $computerInfo.CsProcessors | ForEach-Object { $_.Name }
    $computerDomain =  [String]($computerSystem | Select Domain -ExpandProperty Domain)
    $computerName = $env:ComputerName
    $userDomain = $env:UserDomain
    $MemorySpeed = (Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Speed).Speed -join ';'
    $AmountMemory = (Get-WmiObject -Class Win32_PhysicalMemory).Count
    $memoryInfo = (Get-CimInstance -Class Win32_PhysicalMemory | Select-Object Manufacturer, PartNumber)
    $memoryManufacturer = $memoryInfo.Manufacturer -join ';'
    $memoryPartNumber = $memoryInfo.PartNumber -join ';'
    $MemoriesCapacity = (Get-WmiObject -Class Win32_PhysicalMemory).capacity -join ';'
    $DiskDriveSize = (Get-WmiObject -Class Win32_DiskDrive).size -join ';'
    $computerSystem = Get-CimInstance -Class Win32_ComputerSystem
    $username = $computerSystem.UserName

    $ci = ''
    $location = ''
          
    $object = New-Object PSObject
foreach ($column in $columns) {
    Add-Member -InputObject $object -MemberType NoteProperty -Name $column -Value $null
}
$object."Computer Name" = $computerInfo.CsName
$object.Marca = $computerInfo.CsManufacturer
$object."Numero de serie" = $biosSerialNumber
$object.Ubicacion = $location
$object.Modelo = $computerInfo.CsSystemFamily
$object."Nombre y apellido" = $username
$object.Cedula = $ci
$object.Dominio = $userDomain
$object."Sistema operativo" = $computerInfo.OsName
$object."Arquitectura so" = $computerInfo.OsArchitecture
$object.Cpu = $processorNames -join ';  '
$object."Cantidad de Memorias" = $AmountMemory
$object.Memorias = $memoryManufacturer + $memoryPartNumber
$object."Capacidad de memorias" = $MemoriesCapacity
$object."Velocidad de memorias" = $MemorySpeed
$object."Tamaño de discos" = $DiskDriveSize

if (!(Test-Path $destinationPath)) {
    $object | Export-Csv -Path $destinationPath -Encoding UTF8 -NoTypeInformation -Delimiter ';' -Force
}
else {
    $object | Export-Csv -Path $destinationPath -Encoding UTF8 -NoTypeInformation -Delimiter ';' -Append -Force
}

}








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
    $lines = "http://xx-xx-xx.xx.xx.xxxx", "http://xx-xx-xx.xx"
    Add-Content -Path $fullFilePath -Value $lines
  }
}


}

function Disable_Java_Update {

$registryPath = "HKLM:\SOFTWARE\Wow6432Node\JavaSoft\Java Update\Policy"

New-Item -Path $registryPath -Force | Out-Null
Set-ItemProperty -Path $registryPath -Name "EnableJavaUpdate" -Type DWORD -Value 0

}
function SIM {

$Java = Get-WmiObject -class win32_product | where {$_.name -match 'Java'}


if ($Java -ne $null) {

$Java.uninstall()
Start-Process "C:\SIM\jre-8u333-windows-x64.exe" -Wait -ArgumentList "/s" -PassThru

} else {

Start-Process "C:\SIM\jre-8u333-windows-x64.exe" -Wait -ArgumentList "/s" -PassThru

}

}


function Informes {

Copy-Item -Path $UNCINFPATH -Destination 'c:\' -Recurse -Force
Copy-Item -Path 'C:\encomiendafacil\Encomienda Fácil.url' -Destination $publicdsktp -Force
Copy-Item -Path 'c:\PuTTY\Servidor_Pazos.lnk' -Destination $publicdsktp -Force




}

function Gerencia {

Copy-Item -Path 'c:\PuTTY\Servidor_Pazos.lnk' -Destination $publicdsktp -Force
Copy-Item -Path '\\xx.xx.xx.xx\xx\xx\xx\xx'-Recurse -Destination 'C:\' -Force
Start-Process 'c:\instaladoresger\ivms.exe' -Wait -ArgumentList '/S'
Start-Process 'c:\instaladoresger\Ocularis1.exe' -Wait -ArgumentList '/S'
Start-Process 'c:\instaladoresger\Ocularis2' -Wait -ArgumentList '/S'



}


function Gestion {


Copy-Item -Path 'c:\PuTTY\Servidor_Pazos.lnk' -Destination $publicdsktp -Force
Copy-Item -Path 'c:\PuTTY\CONEXION TATA1.exe.lnk' -Destination $publicdsktp -Force

}


function VNC {

copy-item -Path '\\xx.xx.xx\xx\xx\xx\VNC' -Destination 'c:\temp' -Recurse -Force 
Start-Process "C:\temp\VNC\VNC.exe" -Wait -ArgumentList "/silent" -PassThru
 cd 'c:\Program Files\RealVNC\VNC Server'
  .\vnclicense.exe -add xxxxxx
$password = 'pepe'
$passwdPath = "${env:ProgramFiles}\RealVNC\VNC Server\vncconfig.exe.config"
Add-Content -Path $passwdPath -Value "<configuration><useDefaultVncServerProperties><vncServer><user><password>$password</password></user></vncServer></useDefaultVncServerProperties></configuration>"
 netsh advFirewall Firewall add rule name="Habilitar ICMP en IPv4" protocol=icmpv4:8,any dir=in action=allow
 netsh advfirewall firewall add rule name="TCP Port 5900" dir=in action=allow protocol=TCP localport=5900
 }
 



function Ingresos {


 Copy-Item -Path $UNCPATH -Destination $USERPATH -Recurse -Force
 Copy-Item -Path $PUTTYPATH -Destination 'C:\' -Recurse -Force
 Copy-Item -Path '\\xx.xx.xx.xx\xx\xx\xx' -Destination 'c:\' -Recurse -Force
 Start-Process "C:\Autoinst\7zip.exe" -wait -ArgumentList "/S" -PassThru
 Start-Process "C:\Autoinst\adobe.exe" -wait -ArgumentList "/sAll /rs /msi EULA_ACCEPT=YESS" -PassThru
  Start-Process "C:\Autoinst\ChromeSetup.exe" -Wait -ArgumentList "/silent /install" -PassThru
 Start-Process "C:\Autoinst\flash.exe" -Wait -ArgumentList "/passive" -PassThru
 Start-Process "C:\Autoinst\inicio.exe" -Wait -ArgumentList "/passive" -PassThru
 Start-Process "C:\Autoinst\LibreOffice_7.4.2_Win_x64.msi" -Wait -ArgumentList "/passive" -PassThru
 #Start-Process "C:\Autoinst\OcsPackage64.exe" -Wait -ArgumentList "/S" -PassThru

 
 }


 function vpn {
 
 Copy-Item -Path '\\xx.xx.xx.xx\xx\xx\xx' -Destination 'c:\' -Recurse -Force

 $app = Get-WmiObject -Class win32_product |?{$_.name -match 'cisco'}

 if ($app) {


 $app.uninstall()
 }
 
 Start-Process 'c:\VPN\Cisco AnyConnect 4.10.0595\1 - anyconnect-win-4.10.05095-core-vpn-predeploy-k9.msi' -Wait  -ArgumentList '/q'
 Start-Process 'c:\VPN\Cisco AnyConnect 4.10.0595\2 - anyconnect-win-4.10.05095-iseposture-predeploy-k9.msi' -Wait  -ArgumentList '/q'
 Start-Process 'c:\VPN\Cisco AnyConnect 4.10.0595\3 - anyconnect-win-4.10.05095-posture-predeploy-k9.msi' -Wait  -ArgumentList '/q'
 Start-Process 'c:\VPN\Cisco AnyConnect 4.10.0595\4 - cisco-secure-client-win-4.3.3030.6145-isecompliance-predeploy-k9.msi' -Wait  -ArgumentList '/q'
 }
 
 
 function add_user {


$userName = Read-Host 'Ingrese el usuario deseado'
$regPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI'
$regValue = 'LastLoggedOnUser'
$regData = $userName

if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

Set-ItemProperty -Path $regPath -Name $regValue -Value $regData -Force

Write-Host "Usuario $userName cargado correctamente"

}
 

 function BuiltinAdmin {
 
 Enable-LocalUser -Name "xxx"
Set-LocalUser -Name "xxx" -Password (ConvertTo-SecureString "xxx" -AsPlainText -Force)

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

            $DefaultApps = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice")
$DefaultApps.Progid = "MicrosoftEdgeHTML"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" -Name "Progid" -Value $DefaultApps.Progid

$DefaultApps = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice")
$DefaultApps.Progid = "MicrosoftEdgeHTML"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" -Name "Progid" -Value $DefaultApps.Progid


}




switch ($opciones) {

0 {
   Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
  instalacion_suc
  VNC
  Copy-Item -Path '\\xx.xx.xx.xx\xx\xx\xx\xx' -Destination $publicdsktp -Force
   
}

1 { 
     Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
       instalacion_suc
       VNC
       Informes
        
    
    }


2 {


 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'    instalacion_suc
    Gerencia
    instalacion_suc
    VNC
    SIM
    Disable_Java_Update
    SIM-security
     
}


3 {

 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
   instalacion_suc
   VNC
   Gestion
   SIM
   Disable_Java_Update
   SIM-security
    

}

4 {
 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
  instalacion_suc
  VNC
  SIM
  Disable_Java_Update
  SIM-security
  Copy-Item -Path 'c:\PuTTY\Servidor_Pazos.lnk' -Destination $publicdsktp -Force
  Copy-Item -Path 'c:\PuTTY\CONEXION TATA1.exe.lnk' -Destination $publicdsktp -Force
   
}    

5 {

 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
  instalacion_suc
  VNC
  SIM
  Disable_Java_Update
  SIM-security
  Copy-Item -Path 'c:\PuTTY\Servidor_Pazos.lnk' -Destination $publicdsktp -Force
  Copy-Item -Path 'c:\PuTTY\CONEXION TATA1.exe.lnk' -Destination $publicdsktp -Force
   
}

6 {

 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
  Ingresos
  VNC
  vpn  
  
}

7 {add_user}

8 {

 Write-Host -ForegroundColor Red 'A continuacion se cargara la configuracion de la opcion seleccionada, por favor AGUARDE PACIENTEMENTE...'
  Copy-Item -Path "\\xx.xx.xx.xx\xx\xx"  -Destination "c:\" -Recurse -Force
   Write-Host -ForegroundColor DarkGray ' 1- Error de Seguridad'
   Write-Host -ForegroundColor DarkGray ' 2 - Borrar Cache'
   Write-Host -ForegroundColor DarkGray ' 3 - Instalar / Reinstalar' 
   Write-Host -ForegroundColor DarkGray ' 4 - Tirilla Recepcion'
   Write-Host -ForegroundColor Red ' 0 - Atras'

   $options = Read-Host
   
   switch ($options){
   
   1 {SIM-security}  
   2 {javaws -clearcache
      javaws -uninstall}
   3 {
   SIM
   Disable_Java_Update
   SIM-security
   Copy-Item -Path 'C:\SIM\SIM-PROD.jnlp' -Destination $publicdsktp
   Copy-Item -Path 'C:\SIM\SIM_CAPACITACION.jnlp' -Destination $publicdsktp

   }

   4 {
   TirillaRecep
   javaws -clearcache
   javaws -uninstall
   }

   0 { break;}
   default {Write-Host 'Opcion invalida'}
 }
     }

9 {vpn}

10 {Insight}

11 {BuiltinAdmin}

12 {VNC}

13 {Exit}




}

}
