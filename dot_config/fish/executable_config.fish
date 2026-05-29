# Fish shell configuration
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.npm-global/bin $PATH
set -gx PATH $HOME/.yarn/bin $PATH
set -gx PATH $HOME/.opam/default/bin $PATH

# Hyprland
source ~/.config/fish/auto-Hypr.fish

# NVM
source ~/.config/fish/conf.d/nvm.fish

# Theme
fisher install jorgebucaran/nvm.fish
fisher install jorgebucaran/autopair.fish
fisher install oh-my-fish/theme-bobthefish

# Starship prompt
starship init fish | source
