# 2.2 - Testing Network Connectivity

# Run this on SRV2, after setting a static IP address
# Static IP address was set in 2.1

# 1. Verify SRV2 itself is up and that loopback is working
Test-Connection -Computername SRV2 -Count 1
Test-NetConnection -ComputerName SRV2 -CommonTCPPort WinRM 

# 2. Test basic Connectivity to DC1
Test-Connection -ComputerName DC1.Reskit.Org -Count 1

# 3. Check Connectivi8ty to SMP port and to LDAP port
Test-NetConnection -ComputerName DC1.Reskit.Org -CommonTCPPort SMB
Test-NetConnection -ComputerName DC1.Reskit.Org -Port 389

# 4. Examine path to a remote server on the Internet
$NCHT = @{
  ComputerName     = 'WWW.Wiley.Com'
  TraceRoute       = $true
  InformationLevel = 'Detailed'
}
Test-NetConnection @ncht    # Check our wonderful publisher

