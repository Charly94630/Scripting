$Intro = @' 

    ***********************                               ***********************


                                 AD Object Eraser  
   
    ***********************                               ***********************
'@
  
  
write-host -ForegroundColor Magenta $Intro

$pc = ""
while (!$computer) {
    try {
        $pcs = Read-Host -Prompt 'Equipo a borrar'
        $computer = Get-ADComputer -Identity $pc
        Remove-ADComputer -Identity $pc -Confirm:$false
        Write-Host "Equipo $pc eliminado correctamente"
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)"
        Write-Host "El equipo ingresado no es válido"
        $computer = $null
    }
}