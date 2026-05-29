# dotfiles

Managed with [chezmoi](https://chezmoi.io).

## Machines

| Machine | OS | Role |
|---------|----|------|
| Work laptop | Windows + WSL Ubuntu | Daily work |
| Personal laptop | Windows + Arch (Hyprland) | Personal |
| Desktop | Windows + Arch (Hyprland) | Desktop |

## First-time setup

### Windows

```powershell
# Install chezmoi
scoop install chezmoi

# Clone and apply dotfiles
chezmoi init --apply andrewboyley

# Fix remote to use SSH
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

### WSL Ubuntu

```bash
# Install chezmoi
sudo apt update && sudo apt install chezmoi

# Clone and apply dotfiles
chezmoi init --apply andrewboyley

# Fix remote to use SSH
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

### Arch Linux

```bash
# Install chezmoi
sudo pacman -S chezmoi

# Clone and apply dotfiles
chezmoi init --apply andrewboyley

# Fix remote to use SSH
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

## Per-machine config

Machine-specific values (e.g., git user name/email) are set via `~/.config/chezmoi/chezmoi.toml`:

```toml
[data]
    name = "Andrew Boyley"      # work: "Andrew Boyley", personal: "AndrewB"
    email = "andrewb@tfg.co.za" # use your per-machine email
```

Run `chezmoi data` to see all available template variables.

## Daily workflow

```bash
# Add a new file to track
chezmoi add ~/.someconfig

# Preview what would change
chezmoi diff

# Apply pending changes
chezmoi apply

# Commit and push updates
chezmoi git add .
chezmoi git commit -- -m "Add someconfig"
chezmoi git -- push
```

## File naming

| Prefix | Destination |
|--------|-------------|
| `dot_` | `~/.` (e.g. `dot_gitconfig` → `~/.gitconfig`) |
| `dot_config/` | `~/.config/` (e.g. `dot_config/hypr/` → `~/.config/hypr/`) |
| `run_onchange_` | Script run on each `chezmoi apply` when changed |
| `.tmpl` suffix | File is a Go template (processed per-machine) |
