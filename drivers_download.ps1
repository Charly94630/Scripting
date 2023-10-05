Function GithubAPI() {$githubUsername = "carloslopez-tata"
$githubRepo = "PriterDrivers"
$pat = "ghp_vjbR0MDdqNkPba2MStKnQsGXO****"
$outputPath = "C:\temp\drivers.zip"
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($githubUsername):$($pat)"))
$archiveUrl = "https://api.github.com/repos/$githubUsername/$githubRepo/zipball/main"
}

GithubAPI
if (-not(Test-Path -Path "C:\Windows\System32\DriverStore\FileRepository\oemsetup.inf_amd64_c7674953e75f1cca")){
Invoke-RestMethod -Uri $archiveUrl -Headers @{ Authorization = "Basic $base64AuthInfo" } -OutFile $outputPath
Expand-Archive -Path $outputPath -DestinationPath "c:\temp"

}





