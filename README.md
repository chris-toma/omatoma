# OmacTV

A standalone development environment setup application for installing and managing development tools.

## Installation

Run the boot script to start the installation:

```bash
bash applications/omactv/boot.sh
```

Or if you've already cloned it to `~/.local/share/omactv`:

```bash
source ~/.local/share/omactv/install.sh
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

After installation, you can use the `omactv` command to:

- Update applications
- Install additional components
- Uninstall applications
- View the manual

## Structure

```
applications/omactv/
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
- `~/.local/share/omactv/`

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

