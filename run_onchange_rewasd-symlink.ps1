# Create the symlink for reWASD config
# ~/.local/share/chezmoi/run_onchange_rewasd-symlink.ps1

# Check if running as admin
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    # Re-run as admin
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}


$rewasdConfigDir = "C:\Users\Public\Documents\reWASD\Profiles\Handheld\Controller"
$chezmoi_managed = "$env:USERPROFILE\.config\rewasd\Desktop.rewasd"

# Ensure the chezmoi directory exists
if (-not (Test-Path (Split-Path $chezmoi_managed))) {
    New-Item -ItemType Directory -Path (Split-Path $chezmoi_managed) -Force | Out-Null
}

# Remove the original file if it exists (and isn't already a symlink)
if (Test-Path $rewasdConfigDir/Desktop.rewasd) {
    $item = Get-Item $rewasdConfigDir/Desktop.rewasd
    if ($item.LinkType -ne "SymbolicLink") {
        Move-Item -Path "$rewasdConfigDir/Desktop.rewasd" -Destination "$rewasdConfigDir/Desktop.rewasd.backup"
        Write-Host "Backed up original to Desktop.rewasd.backup"
    }
}

# Create the symlink
if (-not (Test-Path $rewasdConfigDir/Desktop.rewasd)) {
    New-Item -ItemType SymbolicLink `
        -Path "$rewasdConfigDir/Desktop.rewasd" `
        -Target $chezmoi_managed -Force | Out-Null
    Write-Host "Created symlink for reWASD config"
}
