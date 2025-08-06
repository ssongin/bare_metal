# powershell-winrm.ps1
# Enable and configure WinRM for Ansible remote management

Write-Host "Starting WinRM setup..."

# Enable WinRM service and set startup type to automatic
Set-Service -Name WinRM -StartupType Automatic
Start-Service WinRM

# Enable WinRM listener on all IP addresses
winrm quickconfig -q
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

# Configure TrustedHosts to allow the specific IP address of your Linux machine
$trustedLinuxIP = '192.168.1.*'

$trustedHosts = (Get-Item WSMan:\localhost\Client\TrustedHosts).Value
if ($trustedHosts -ne $trustedLinuxIP) {
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value $trustedLinuxIP
}

# Enable firewall rule for WinRM (HTTP 5985)
Enable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"

Write-Host "WinRM setup complete. You can now connect from your Ansible control node at $trustedLinuxIP."

