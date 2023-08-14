Function menu {
    Clear-Host
    Write-Host "Seleccione la Unidad de Negocio deseada"
    Write-Host "1. CND"
    Write-Host "2. CDO"
    Write-Host "3. BAS"
    Write-Host "4. Frontoy"
    Write-Host "5. Locales"
    Write-Host "6. WooW"
}


DO {
write-host "Ingrese un nuevo nombre de host: Por defecto es $env:COMPUTERNAME"

$NuevoHostName = Read-Host }
While ($NuevoHostName -eq "" -or $NuevoHostName -eq $env:COMPUTERNAME)
$RenameHost = $true
 DO{
 menu

 $UnidadNegocio = Read-Host -Prompt "Seleccione la opcion deseada"

switch($UnidadNegocio) {
        1 {
          Clear-Host
          Write-Host "Presione '1'  para ADM y Finanzas. "
          Write-Host "Presione '2'  para Auditoria. "
          Write-Host "Presione '3'  para Comercial. "
          Write-Host "Presione '4'  para Gerencia. "
          Write-Host "Presione '5'  para Laptops. "
          Write-Host "Presione '6'  para Logistica. "
          Write-Host "Presione '7'  para Mantenimiento. "
          Write-Host "Presione '8'  para Marketing. "
          Write-Host "Presione '9'  para Operaciones. "
          Write-Host "Presione '10' para RRHH. "
          Write-Host "Presione '11' para Mantenimiento. "
          Write-Host "Presione '12' para Sistemas. "
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {$ou = "OU=Administración y Finanzas,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           2 {$ou = "OU=Auditoría,OU=Directorio,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           3 {$ou = "OU=Comercial,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           4 {$ou = "OU=Gerencia,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           5 {$ou = "OU=Laptops,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy";break; }
           6 {$ou = "OU=Logística,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           7 {$ou = "OU=Mantenimiento,OU=CND,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           8 {$ou = "OU=Marketing,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           9 {$ou = "OU=Operaciones,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          10 {$ou = "OU=Recursos Humanos,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          11 {$ou = "OU=Mantenimiento,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          12 {$ou = "OU=Sistemas,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           default {$ou = ''}
           
           }break;
           }
           2 { 

           Clear-Host
           Write-Host "Presione '1'  para Auditoria y Administracion. "
           Write-Host "Presione '2'  para Deposito. "
           Write-Host "Presione '3'  para Frescos. "
           Write-Host "Presione '4'  para Gerencia. "
           Write-Host "Presione '5'  para Laptops. "
           Write-Host "Presione '6'  para Logistica. "
           Write-Host "Presione '7'  para Mantenimiento. "
           Write-Host "Presione '8'  para OCT. "
           Write-Host "Presione '9'  para Performance. "
           Write-Host "Presione '10' para RRHH. "
           Write-Host "Presione '11' para Seguridad. "
           Write-Host "Presione '12' para Sistemas. "
           Write-Host "Presione '13' para Transporte. "
                 
                   $SubUnidadNegocio = Read-Host
           switch ($SubUnidadNegocio) {
           
           1 {$ou = "OU=Auditoría,OU=Directorio,OU=CND,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           2 {$ou = "OU=Auditoría y Administración,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           3 {$ou = "OU=Frescos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
           4 {$ou = "OU=Gerencia,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy";break;}
           5 {$ou = "OU=Laptops,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           6 {$ou = "OU=Logística,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           7 {$ou = "OU=Mantenimiento,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
           8 {$ou = "OU=Auditoría y Administración,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
           9 {$ou = "OU=Performance,OU=CDO,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          10 {$ou = "OU=Recursos Humanos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          11 {$ou = "OU=Seguridad,OU=Operaciones,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
          12 {$ou = "OU=Sistemas,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
          13 {$ou = "OU=Transporte,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy";break;}
           default {$ou = ''}
           
           }
           
           }
           3 {

          Clear-Host
          Write-Host "Presione '1'  para Locales. "
          Write-Host "Presione '2'  para Usuarios. "
          Write-Host "Presione '3'  para Equipos. "
          
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {$ou = "OU=Locales,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           2 {$ou = "OU=BAS,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           3 {$ou = "OU=BAS,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          
           default {$ou = ''}
           
           }
   
   }
   4 {
          Clear-Host
          Write-Host "Presione '1'  para Usuarios. "
          Write-Host "Presione '2'  para Equipos. "
          
          
          
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {$ou = "OU=FRONTOY,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           2 {$ou = "OU=FRONTOY,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          
           default {$ou = ''}
           
           
           }
           }


   5 { Clear-Host
          Write-Host "Presione '1'  para Ecommerce. "
          Write-Host "Presione '2'  para Frescos. "
          Write-Host "Presione '3'  para Encargados. "
          Write-Host "Presione '4'  para Gerentes. "
          Write-Host "Presione '5'  para Gestion. "
          Write-Host "Presione '6'  para Hogar. "
          Write-Host "Presione '7'  para Informes. "
          Write-Host "Presione '8'  para Otros. "
          Write-Host "Presione '9'  para Personal. "
          Write-Host "Presione '10' para Recepcion. "
          Write-Host "Presione '11' para Regionales. "
          Write-Host "Presione '12' para Tesoreria. "
                    
                     $SubUnidadNegocio = Read-Host
                     switch ($SubUnidadNegocio) {

           1 {$ou = "OU=Ecomerce,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           2 {$ou = "OU=Frescos,OU=CDO,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           3 {$ou = "OU=PC Encargados,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           4 {$ou = "OU=PC Gerentes,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           5 {$ou = "OU=PC Gestión,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           6 {$ou = "OU=PC Hogar,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           7 {$ou = "OU=PC Informes,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uyy"; break;}
           8 {$ou = "OU=PC Otros,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           9 {$ou = "OU=PC Personal,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          10 {$ou = "OU=PC Recepción,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          11 {$ou = "OU=PC Regionales,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
          12 {$ou = "OU=PC Tesorería,OU=Locales,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
           default {$ou = ''}
   }

           }
           6 {

                Clear-Host
                Write-Host "Presione '1'  para ATC. "
                Write-Host "Presione '2'  para Comercial. "
                Write-Host "Presione '3'  para ADM y Finanzas. "
                Write-Host "Presione '4'  para Logistica. "
                
                          
                           $SubUnidadNegocio = Read-Host
                           switch ($SubUnidadNegocio) {
      
                 1 {$ou = "OU=ATC,OU=WOOW,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
                 2 {$ou = "OU=Comercial,OU=WOOW,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
                 3 {$ou = "OU=Administracion y Finanzas,OU=WOOW,OU=Usuarios,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
                 4 {$ou = "OU=Logistica,OU=WOOW,OU=Equipos,OU=TATA,DC=tata,DC=com,DC=uy"; break;}
                 default {$ou = ''}
                 
                 }
      
           
           }


        }
            pause;
            break
              
        
        
        }while( $ou -eq'')
        

        $Creds = New-Object System.Management.Automation.PSCredential("xxx", (ConvertTo-SecureString "***" -AsPlainText -Force))
        Write-Host "Agregando $NuevoHostName al dominio" 
        Add-Computer -DomainName xxx.com.uy -Credential $Creds -OUPath $ou
        Read-Host "Presiona Enter para cambiar el nombre de Host"
        if ($RenameHost -eq $true )
        {Rename-Computer -NewName $NuevoHostName -DomainCredential $Creds} 
        Read-Host "Presionar ENTER para reiniciar el equipo" 
        Restart-Computer




 

 

