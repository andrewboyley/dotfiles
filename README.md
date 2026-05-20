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
scoop install chezmoi
chezmoi init --apply andrewboyley
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

### WSL Ubuntu

```bash
sudo apt update && sudo apt install chezmoi
chezmoi init --apply andrewboyley
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

### Arch Linux

```bash
sudo pacman -S chezmoi
chezmoi init --apply andrewboyley
chezmoi cd
git remote set-url origin git@github.com:andrewboyley/dotfiles.git
```

## Per-machine config

Create `~/.config/chezmoi/chezmoi.toml` on each machine:

```toml
[data]
    name = "Your Name"          # work vs personal
    email = "user@domain.com"   # per-machine email
```

Run `chezmoi data` to see all available template variables.

## Daily workflow

```bash
chezmoi add ~/.someconfig       # add new file
chezmoi diff                    # preview changes
chezmoi apply                   # apply pending changes
chezmoi git add .               # stage all
chezmoi git commit -- -m "msg"  # commit
chezmoi git -- push             # push
```

## File naming

| Prefix | Destination |
|--------|-------------|
| `dot_` | `~/.` (e.g. `dot_gitconfig` → `~/.gitconfig`) |
| `dot_config/` | `~/.config/` (e.g. `dot_config/hypr/` → `~/.config/hypr/`) |
| `run_onchange_` | Script run on each `chezmoi apply` when changed |
| `.tmpl` suffix | File is a Go template (processed per-machine) |
