Function Set-DNS 
{
    $currentDNSservers = (Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'").DNSServerSearchOrder
    $DNSservers = "172.21.10.52", "172.18.10.51"
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
