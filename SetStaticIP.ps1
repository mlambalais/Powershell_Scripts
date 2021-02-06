$IP = "192.168.1.101"
$MaskBits = 24
$Gateway = "192.168.1.254"
$Dns = "1.1.1.1,8.8.8.8"
$adapter = "Wi-Fi" #name of your interface

# Remove any existing IP, gateway from our ipv4 adapter
Get-NetIPAddress -InterfaceAlias $adapter | Remove-NetRoute
Get-NetIPAddress -InterfaceAlias $adapter | Remove-NetIpAddress

# Disable IPv6
Disable-NetAdapterBinding -Name $adapter -ComponentID ms_tcpip6

# Configure the IP address and default gateway
New-NetIPAddress –InterfaceAlias $adapter -IPAddress $IP -PrefixLength $MaskBits -DefaultGateway $Gateway

# Configure the DNS client server IP addresses
Set-DnsClientServerAddress -InterfaceAlias $adapter -ServerAddresses $DNS
