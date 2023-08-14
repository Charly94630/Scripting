@echo off



cd  /D %userprofile%\AppData\LocalLow\Sun\Java\Deployment\security

@echo A continuacion se cargaran las excepciones en Java

@echo off

echo http://xx.xx.xx.xx:xx >> exception.sites
echo http://xx:xx >> exception.sites
echo http://xx-xx-xx:xx/ >> exception.sites
echo http://xx-xx-xx.xx.xx.xx.xx:/ >> exception.sites
echo http://xx-xx-xx:xx/ >> exception.sites
echo http://xx-xx-xx.or.xx.xx.xx: >> exception.sites
echo http://xx-xx-xx.or.xx.xx.xx: >> exception.sites


@echo Excepciones cargadas correctamente.


@echo off
Exit
