@echo off

set /p ip=Ingrese una Ip?:
net use \\%ip%\c$ /user:administrador T4t4nk4m0n!2020
mkdir "\\%ip%\c$\SIM"
echo Copiando Archivos
robocopy "\\172.19.92.133\share\SIM " "\\%ip%\c$\SIM " /E




wmic /user:administrador /password:T4t4nk4m0n!2020 /node:%ip% process call create "cmd.exe /c start /WAIT C:\SIM\SIM.bat"
net use \\%ip%\c$ /d /y>nul 2>&1

pause