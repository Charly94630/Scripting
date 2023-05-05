function ouMenu {


    Write-Host -ForegroundColor Green "Seleccione la Unidad de Negocio deseada"
    Write-Host -ForegroundColor Green "1. CND"
    Write-Host -ForegroundColor Green "2. CDO"
    Write-Host -ForegroundColor Green "3. BAS"
    Write-Host -ForegroundColor Green "4. Frontoy"
    Write-Host -ForegroundColor Green "5. Locales"
    Write-Host -ForegroundColor Green "6. WooW"
    }



 function reasig_equipos {

  $CurrentPC = Get-ADComputer $env:COMPUTERNAME | Select-Object 'DistinguishedName'
  $computer = Get-ADComputer -Identity $env:COMPUTERNAME
  $NewHostName = Read-Host 'Ingrese un nuevo nombre de Host'
  Rename-Computer -NewName $NewHostName -DomainCredential $user -Confirm:$false
  Start-Sleep -Seconds 30
  $newPC = Get-ADComputer $NewHostName | Select-Object 'DistinguishedName'
  
  
  




While ($true) {
ouMenu
$UnidadNegocio = Read-Host

switch($UnidadNegocio) {
        1 {
          Clear-Host
          Write-Host -ForegroundColor DarkCyan "Presione ' 1'  para ADM y Finanzas. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 2'  para Auditoria. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 3'  para Comercial. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 4'  para Gerencia. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 5'  para Laptops. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 6'  para Logistica. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 7'  para Mantenimiento. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 8'  para Marketing. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 9'  para Operaciones. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 10' para RRHH. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 11' para Mantenimiento. "
          Write-Host -ForegroundColor DarkCyan "Presione ' 12' para Sistemas. "
          Write-Host -ForegroundColor Red "Presione '0 ' Para volver. "
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Administración y Finanzas,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"
              Remove-ADComputer $computer -Confirm:$false }
           2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Auditoría,OU=Directorio,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$falsebreak;}
           3 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Comercial,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           4 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Gerencia,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           5 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Laptops,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break; }
           6 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Logística,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           7 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Mantenimiento,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           8 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Marketing,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           9 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Operaciones,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          10 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Recursos Humanos,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          11 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Mantenimiento,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          12 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Sistemas,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          0 {break;}
           default {Write-Host 'Opcion Invalida'}
           
           }break;
           }
           2 { 

           Clear-Host
           Write-Host -ForegroundColor DarkGreen "Presione ' 1'  para Auditoria y Administracion. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 2'  para Deposito. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 3'  para Frescos. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 4'  para Gerencia. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 5'  para Laptops. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 6'  para Logistica. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 7'  para Mantenimiento. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 8'  para OCT. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 9'  para Performance. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 10' para RRHH. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 11' para Seguridad. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 12' para Sistemas. "
           Write-Host -ForegroundColor DarkGreen "Presione ' 13' para Transporte. "
           Write-Host -ForegroundColor Red "Presione ' 0 ' Para volver. "
                 
                   $SubUnidadNegocio = Read-Host
           switch ($SubUnidadNegocio) {
           
           1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Auditoría,OU=Directorio,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Auditoría y Administración,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           3 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Frescos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           4 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Gerencia,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           5 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Laptops,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           6 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Logística,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           7 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Mantenimiento,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           8 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Auditoría y Administración,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           9 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Performance,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          10 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Recursos Humanos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          11 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Seguridad,OU=Operaciones,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          12 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Sistemas,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          13 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Transporte,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           0 {break;}
           default {Write-Host 'Ingrese una opcion valida'}
           
           }
           
           }
           3 {

          Clear-Host
          Write-Host -ForegroundColor DarkMagenta "Presione '1' para Locales. " 
          Write-Host -ForegroundColor DarkMagenta "Presione '2'  para Usuarios. "
          Write-Host -ForegroundColor DarkMagenta "Presione '3'  para Equipos. "
          Write-Host -ForegroundColor Red "Presione ' 0 ' Para volver." 
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Locales,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=BAS,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           3 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=BAS,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           0 {break;}
          
           default {Write-Host 'Ingrese una opcion valida'}
           
           }
   
   }
   4 {
          Clear-Host
          Write-Host -ForegroundColor DarkMagenta "Presione '1'  para Usuarios. "
          Write-Host -ForegroundColor DarkMagenta "Presione '2'  para Equipos. "
          Write-Host -ForegroundColor Red "Presione '0' Para volver". 
          
          
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=FRONTOY,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=FRONTOY,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           0 {break;}
          
           default {Write-Host 'Opcion invalida'}
           
           
           }
           }


   5 { Clear-Host
          Write-Host -ForegroundColor Yellow "Presione ' 1'  para Ecommerce. "
          Write-Host -ForegroundColor Yellow "Presione ' 2'  para Frescos. "
          Write-Host -ForegroundColor Yellow "Presione ' 3'  para Encargados. "
          Write-Host -ForegroundColor Yellow "Presione ' 4'  para Gerentes. "
          Write-Host -ForegroundColor Yellow "Presione ' 5'  para Gestion. "
          Write-Host -ForegroundColor Yellow "Presione ' 6'  para Hogar. "
          Write-Host -ForegroundColor Yellow "Presione ' 7'  para Informes. "
          Write-Host -ForegroundColor Yellow "Presione ' 8'  para Otros. "
          Write-Host -ForegroundColor Yellow "Presione ' 9'  para Personal. "
          Write-Host -ForegroundColor Yellow "Presione ' 10' para Recepcion. "
          Write-Host -ForegroundColor Yellow "Presione ' 11' para Regionales. "
          Write-Host -ForegroundColor Yellow "Presione ' 12' para Tesoreria. "
          Write-Host -ForegroundColor Red "   Presione ' 0 ' Para volver. "
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Ecomerce,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Frescos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           3 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Encargados,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           4 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Gerentes,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           5 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Gestión,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           6 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Hogar,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           7 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Informes,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uyy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           8 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Otros,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
           9 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Personal,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          10 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Recepción,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          11 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Regionales,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          12 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=PC Tesorería,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
              Remove-ADComputer -Identity $computer -Confirm:$false break;}
          0 {break;}
           default {write-host 'Opcion invalida'}
   }

           }
           
           6 {

                Clear-Host
                Write-Host -ForegroundColor DarkGreen "Presione '1'  para ATC. "
                Write-Host -ForegroundColor DarkGreen "Presione '2'  para Comercial. "
                Write-Host -ForegroundColor DarkGreen "Presione '3'  para ADM y Finanzas. "
                Write-Host -ForegroundColor DarkGreen "Presione '4'  para Logistica. "
                
                          
                           $SubUnidadNegocio = Read-Host
                           switch ($SubUnidadNegocio) {
      
                 1 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=ATC,OU=WOOW,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
                    Remove-ADComputer -Identity $computer -Confirm:$false break;}
                 2 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Comercial,OU=WOOW,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
                    Remove-ADComputer -Identity $computer -Confirm:$false break;}
                 3 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Administracion y Finanzas,OU=WOOW,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; 
                    Remove-ADComputer -Identity $computer -Confirm:$false break;}
                 4 {Move-ADObject -Identity $newPC.DistinguishedName -TargetPath "OU=Logistica,OU=WOOW,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; 
                    Remove-ADComputer -Identity $computer -Confirm:$false break;}
                 0 {break;}
                 default {Write-Host 'Opcion Invalida'}
                 
                 }
      
           }

           }
           }
           


        
           
           

 
 
 
 }
 