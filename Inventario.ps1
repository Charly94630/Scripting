                            
function Insight {
    $columns = "Computer Name", "Marca", "Numero de serie", "Ubicacion", "Modelo", "Nombre y apellido", "Cedula", "Dominio", "Sistema operativo", "Arquitectura so", "Cpu", "Cantidad de Memorias", "Memorias", "Capacidad de memorias", "Velocidad de memorias", "Tamaño de discos"
    $destinationPath = "\\xxx.xx.xx.xx\insight\insight.csv"
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

# Export the PSObject to the CSV file
if (!(Test-Path $destinationPath)) {
    $object | Export-Csv -Path $destinationPath -Encoding UTF8 -NoTypeInformation -Delimiter ';' -Force
}
else {
    $object | Export-Csv -Path $destinationPath -Encoding UTF8 -NoTypeInformation -Delimiter ';' -Append -Force
}

}



Insight
