
@echo off > nul 2>&1

set /p usuario=Ingrese usuario con permisos para acceder a xx.xx.xx.xx:

net use \\xx.xx.xx.xxx * /user:xx\%usuario% 


cls

cd c:\

mkdir Java

mkdir RPM


robocopy "\\xx.xx.xx.xx\xx\xx " "C:\Java " /E
robocopy "\\xx.xx.xx.xx\xx\xx\xx " "C:\RPM " /E
cd c:\Java

@echo Actualizando Java

Java8.exe INSTALL_SILENT=1


set /p usuario=User:

cd c:\users\%usuario%\AppData\LocalLow\Sun\Java\Deployment\security

echo http://xx.xx.xx.xx:xx >> exception.sites
echo http://xxx:xxx >> exception.sites
echo http://xxx-xxx-xxx:xxx/ >> exception.sites
echo http://xxx-rpm-xxx.or.xxx.xxx.xx:xxx/ >> exception.sites
echo http://xxx-xxx-xxx:xxx/ >> exception.sites
echo http://xxx-xxx-xxx.xxx.xxx.xxx:xxx >> exception.sites


@echo Excepciones agregadas correctamente

@echo off

cd C:\Windows\System32\drivers\etc

@echo Modificando correspondencia entre IP y DNS

@echo off

echo xx.xx.xx.xx              orm1601 >> hosts
echo #SIT1R3 >> hosts
echo xx.xx.xx.xx  sit1r3-xx-xxx >> hosts
echo xx.xx.xx.xx  sit1r3-xx-xxx  sit1r3-xxx-xxx.xxx.xxx.xxx.xxx  xxx-xxx-xxx.xxx.xxx.xxx.xxx >> hosts
echo xx.xx.xx.xx  sit1r3-xx-xxx >> hosts
echo xxx.xx.xx.xx  xxx-xxx-xxx  xxx-xxx-xxx.xx.xx.xx.xx >> hosts


@echo Se modificó el arhivo correctamente.

@echo off


@echo Instalando Firefox

@echo off

cd c:\RPM

firefox setup 70.0 64b.exe /S


@echo off

@echo Configuracion Finalizada

@echo Descargando RPM


@echo off

"%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe" " https://xx-xx-xx.or.xx.xx.xx:xxx/rpm-client/launch?template=rpm_jnlp_template.vm"

Exit





