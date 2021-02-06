# Enable IPv6
Enable-NetAdapterBinding -Name $adapter -ComponentID ms_tcpip6

# Remove any existing IP, gateway from our adapter
Get-NetIPAddress -InterfaceAlias $adapter | Remove-NetRoute
Get-NetIPAddress -InterfaceAlias $adapter | Remove-NetIpAddress

# Configure the IP address and default gateway in DHCP mode
Set-NetIPInterface -InterfaceAlias $adapter -Dhcp Enabled

# Reset the DNS client server IP addresses
Set-DnsClientServerAddress -InterfaceAlias $adapter -ResetServerAddresses
