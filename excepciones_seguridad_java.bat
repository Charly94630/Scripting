@echo off



cd  /D %userprofile%\AppData\LocalLow\Sun\Java\Deployment\security

@echo A continuacion se cargaran las excepciones en Java

@echo off

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

@echo Excepciones cargadas correctamente.


@echo off
Exit