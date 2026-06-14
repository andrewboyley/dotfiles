# Redirect to PowerShell 7 profile
$pwshProfile = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path -LiteralPath $pwshProfile) {
    . $pwshProfile
}
