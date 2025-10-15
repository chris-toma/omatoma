# Omatoma

A standalone development environment setup application for installing and managing development tools.

## Quick Install

Install and run Omatoma with a single command:

```bash
wget -qO- https://raw.githubusercontent.com/chris-toma/omatoma/main/boot.sh | bash
```

This will download and execute the boot script directly, prompting you in the terminal for installation options.

## Manual Installation

If you prefer to clone the repository first:

```bash
git clone https://github.com/chris-toma/omatoma.git ~/.local/share/omatoma
cd ~/.local/share/omatoma
bash boot.sh
```

Or if you've already cloned it to `~/.local/share/omatoma`:

```bash
source ~/.local/share/omatoma/install.sh
```

## What Gets Installed

- **SSH Key**: RSA 4096-bit key for GitHub at `~/.ssh/github`
- **GoLand**: JetBrains Go IDE (via Snap)
- **Cursor**: AI-powered code editor
- **Zsh**: With oh-my-zsh and plugins:
  - git-history
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - zsh-vi-mode
  - zsh-easy-motion
- **Tmux**: Terminal multiplexer with custom configuration
- **Tmuxp**: Tmux session manager

## Post-Installation

After installation, you can use the `omatoma` command to:

- Update applications
- Install additional components
- Uninstall applications
- View the manual

## Structure

```
omatoma/
├── boot.sh              # Entry point
├── install.sh           # Main installer
├── version              # Version tracking
├── ascii.sh             # ASCII art banner
├── bin/                 # Command-line tools
├── install/             # Installation scripts
├── configs/             # Configuration templates
├── defaults/            # Default settings (zsh)
├── uninstall/           # Uninstall scripts
└── migrations/          # Version migrations
```

## Configuration

Configuration files are stored in:
- `~/.local/share/omatoma/`

User configurations are stored in:
- `~/.zshrc` (Zsh configuration)
- `~/.tmux.conf` (Tmux configuration)
- `~/.ssh/config` (SSH configuration)

## Requirements

- Ubuntu 24.04+ (or compatible Debian-based distribution)
- sudo access
- Internet connection

## Inspired By

This project follows the structure and patterns of [Omakub](https://github.com/basecamp/omakub).

