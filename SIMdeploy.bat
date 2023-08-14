@echo off

set /p ip=Ingrese una Ip?:
net use \\%ip%\c$ /user:administrador T4t4nk4m0n!2020
mkdir "\\%ip%\c$\SIM"
echo Copiando Archivos
robocopy "\\xxx.xx.xx.xx\xx\xx " "\\%ip%\c$\SIM " /E




wmic /user:xxx /password:xxx /node:%ip% process call create "cmd.exe /c start /WAIT C:\SIM\SIM.bat"
net use \\%ip%\c$ /d /y>nul 2>&1

pause
