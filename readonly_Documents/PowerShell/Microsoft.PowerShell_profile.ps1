# --- Starship Prompt ---
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

# --- PSReadLine ---
if ($Host.UI.RawUI) {
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
    Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine
    Set-PSReadLineKeyHandler -Key Ctrl+Backspace -Function BackwardKillWord
    Set-PSReadLineKeyHandler -Key Ctrl+w -Function BackwardKillWord
    Set-PSReadLineKeyHandler -Key Ctrl+LeftArrow -Function BackwardWord
    Set-PSReadLineKeyHandler -Key Ctrl+RightArrow -Function ForwardWord
}

# --- Aliases ---
Set-Alias -Name g -Value git
Set-Alias -Name np -Value nvim
Set-Alias -Name grep -Value rg
Set-Alias -Name ll -Value eza
Set-Alias -Name la -Value "eza -a"
Set-Alias -Name lt -Value "eza -T"
Set-Alias -Name cat -Value bat

# --- Heavy modules: load once after prompt (avoids startup delay) ---
$script:modulesLoaded = $false
$originalPrompt = $function:Prompt
function Prompt {
    if (-not $script:modulesLoaded) {
        Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue
        Import-Module -Name PSFzf -ErrorAction SilentlyContinue
        Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+t' -PSReadLineChordNavigator 'Alt+c' -ErrorAction SilentlyContinue
        $script:modulesLoaded = $true
    }
    & $originalPrompt
}

# --- zoxide ---
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    & zoxide init powershell --cmd j | Out-String | Invoke-Expression
}

# --- fnm (Node.js) ---
if (Get-Command fnm -ErrorAction SilentlyContinue) {
    $fnmEnv = & fnm env --use-on-cd --shell powershell 2>$null
    if ($fnmEnv) { $fnmEnv | Out-String | Invoke-Expression }
}

# --- Editor ---
$ENV:EDITOR = 'nvim'

# --- git helpers ---
function gs { git status }
function ga { git add @args }
function gc { git commit -m @args }
function gp { git push }
function gl { git log --oneline --graph --decorate -20 }
