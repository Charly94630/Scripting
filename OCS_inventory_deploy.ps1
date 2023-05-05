$USER_PATH = "C:\temp"
$UNC_PATH = "\\tata.com.uy\archivos\publicas\OPRTIT\OCS"



function Check_OCS {

return (Get-ChildItem "HKLM:Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall") |
  
Where-Object { $_."Name" -like "*$OCS*" } 



}

if($null = (Check_OCS)) {

   
  
  copy-item -path $UNC_PATH -Destination $USER_PATH -Recurse
  Start-Process "C:\temp\OCS\OcsPackage64.exe"  -Wait -ArgumentList "/S /silent /quiet" -PassThru



}
