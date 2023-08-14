Function Set-DNS 
{
    $currentDNSservers = (Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'").DNSServerSearchOrder
    $DNSservers = "xxx.xx.xx.xx", "xxx.xx.xx.xx"
    if ((Compare-Object -ReferenceObject $currentDNSservers -DifferenceObject $DNSservers).Length -eq 0) 
    {
     exit
    }
    else 
    {
      $adapter = Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'"
      $adapter.SetDNSServerSearchOrder($DNSservers) 
      Add-Content -Path "C:\temp\DNS_changelog.txt" -Value "$env:computerName DNS changed"
    }
}

Set-DNS
