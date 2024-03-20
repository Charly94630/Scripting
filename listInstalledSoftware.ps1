function Get-InstalledSoftware {
    <#
    .SYNOPSIS
        Retrieves a list of all software installed
    .EXAMPLE
        Get-InstalledSoftware
        
        This example retrieves all software installed on the local computer
    .PARAMETER Name
        The software title you'd like to limit the query to.
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    $UninstallKeys = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    $null = New-PSDrive -Name HKU -PSProvider Registry -Root Registry::HKEY_USERS
    $UninstallKeys += Get-ChildItem HKU: -ErrorAction SilentlyContinue | Where-Object { $_.Name -match 'S-\d-\d+-(\d+-){1,14}\d+$' } | ForEach-Object { "HKU:\$($_.PSChildName)\Software\Microsoft\Windows\CurrentVersion\Uninstall" }
    if (-not $UninstallKeys) {
        Write-Verbose -Message 'No software registry keys found'
    } else {
        foreach ($UninstallKey in $UninstallKeys) {
            if ($PSBoundParameters.ContainsKey('Name')) {
                $WhereBlock = { ($_.PSChildName -match '^*$') -and ($_.GetValue('DisplayName') -like "*$Name*") }
            } else {
                $WhereBlock = { ($_.PSChildName -match '^*$') -and ($_.GetValue('DisplayName')) }
            }
            $gciParams = @{
                Path        = $UninstallKey
                ErrorAction = 'SilentlyContinue'
            }
            $selectProperties = @(
                @{n='GUID'; e={$_.PSChildName}}, 
                @{n='Name'; e={$_.GetValue('DisplayName')}},
                @{n='Path'; e={$UninstallKey}},
                @{n='UninstallString'; e={$_.GetValue('UninstallString')}},
                @{n='QuietUninstallString'; e={$_.GetValue('QuietUninstallString')}}
            )
            Get-ChildItem @gciParams | Where $WhereBlock | Select-Object -Property $selectProperties
        }
    }
}

if ((Get-InstalledSoftware -Name "Firefox").GUID -ne "123.0") {
        if(Get-Process "firefox*"){
        Stop-Process "firefox*"}
     Start-Process ((Get-InstalledSoftware -Name "Firefox").UninstallString) -ArgumentList "/S" -Wait  
            if (Test-Path "c:\temp\firefoxx123.msi"){
                 Start-Process "c:\temp\firefoxx123.msi" -ArgumentList "/qn" -Wait
                 } else { Invoke-WebRequest -Uri "https://ftp.mozilla.org/pub/firefox/releases/123.0/win64/en-US/Firefox%20Setup%20123.0.msi" -OutFile "c:\temp\firefoxx123.msi"
                          Start-Process "c:\temp\firefoxx123.msi"  -ArgumentList "/qn" -Wait } 


}
