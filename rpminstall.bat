
@echo off > nul 2>&1

set /p usuario=Ingrese usuario con permisos para acceder a 172.19.19.191:

net use \\172.19.19.191 * /user:tata\%usuario% 


cls

cd c:\

mkdir Java

mkdir RPM


robocopy "\\172.19.19.191\ShareRusso\Java " "C:\Java " /E
robocopy "\\172.19.19.191\ShareRusso\Programas\RPM " "C:\RPM " /E
cd c:\Java

@echo Actualizando Java

Java8.exe INSTALL_SILENT=1


set /p usuario=User:

cd c:\users\%usuario%\AppData\LocalLow\Sun\Java\Deployment\security

echo http://10.197.48.184:16003 >> exception.sites
echo http://orm1601:16003 >> exception.sites
echo http://sit1r3-mom-app01:11003/ >> exception.sites
echo http://sit1r3-rpm-app01.or.tata.com.uy:11003/ >> exception.sites
echo http://sit1r3-rpm-app01:11003/ >> exception.sites
echo http://sit1r3-sim-app01.or.tata.com.uy:7003 >> exception.sites
echo http://uatata-mom-app01:11003 >> exception.sites
echo http://uatata-rpm-app01.or.tata.com.uy >> exception.sites
echo http://uatata-rpm-app01.or.tata.com.uy:11003/ >> exception.sites
echo http://uatata-rpm-app01:11003 >> exception.sites
echo https://prd-rpm-app01.or.tata.com.uy:11003 >> exception.sites
echo https://prd-rpm-app01.or.tata.com.uy:11004 >> exception.sites
echo http://uatata-rpm-app01:11003 >> exception.sites
echo http://uatata-mom-app01:11003 >> exception.sites
echo https://prd-rpm-app01.or.tata.com.uy:11004 >> exception.sites
echo http://prd-rpm-app01.or.tata.com.uy:11003 >> exception.sites
echo https://prd-rms-app01.or.tata.com.uy:7004 >> exception.sites
echo http://prd-rms-app01.or.tata.com.uy:7003 >> exception.sites

@echo Excepciones agregadas correctamente

@echo off

cd C:\Windows\System32\drivers\etc

@echo Modificando correspondencia entre IP y DNS

@echo off

echo 10.197.48.184              orm1601 >> hosts
echo #SIT1R3 >> hosts
echo 172.19.130.46  sit1r3-mom-db01 >> hosts
echo 172.19.130.42  sit1r3-mom-app01  sit1r3-mom-app01.or.tata.com.uy  sit1r3-rpm-app01.or.tata.com.uy >> hosts
echo 172.19.130.21  sit1r3-sim-db01 >> hosts
echo 172.19.130.19  sit1r3-sim-app01  sit1r3-sim-app01.or.tata.com.uy >> hosts
echo 172.19.130.22  sit1r3-sim-app02  sit1r3-sim-app02.or.tata.com.uy >> hosts
echo 172.19.130.44  sit1r3-rib-app01  sit1r3-rib-app01.or.tata.com.uy >> hosts
echo 172.19.130.45  sit1r3-batch01    sit1r3-batch01.or.tata.com.uy >> hosts
echo 172.19.130.20  sit1r3-bip-app01  sit1r3-bip-app01.or.tata.com.uy >> hosts
echo 172.19.130.23  sit1r3-bip-app01  sit1r3-bip-app01.or.tata.com.uy >> hosts

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

"%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe" " https://prd-rpm-app01.or.tata.com.uy:11004/rpm-client/launch?template=rpm_jnlp_template.vm"

Exit





