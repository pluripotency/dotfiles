# Dotfiles

A collection of dotfiles and configuration scripts, featuring multiple Neovim setups and an automated installer powered by `plur_dotfiles`.

## Overview

This repository contains configurations for Neovim, Tmux, Vim, WezTerm, and more. It uses a modular approach to Neovim configurations, allowing you to switch between different setups using aliases.

### Neovim Configurations

The repository includes several Neovim setups managed via `NVIM_APPNAME`:

- **`nvim`**: The primary, full-featured configuration.
- **`nmin`**: A minimal, lightweight configuration for quick edits.
- **`nlit`**: "nvim-lite" – an extremely minimal setup with essential plugins.
- **`nvks`**: A configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- **`nold`**: Legacy Neovim configuration.

### Other Configurations

- **Tmux**: Managed via `tmux.conf`.
- **Vim**: Traditional `vimrc` for non-neovim environments.
- **WezTerm**: Lua-based configuration in the `wezterm/` directory.
- **Linting**: Configurations for `ruff` and `pylint`.

## Installation & Setup

### Automated Setup (via `plur_dotfiles`)

The `plur_dotfiles` tool is a Python-powered automation suite (using the `plur` library) that handles more than just linking files:

- **Dependency Management**: Automatically installs platform-specific dependencies for AlmaLinux, CentOS, Fedora, Ubuntu, and Arch Linux.
- **Application Installation**: 
    - Downloads and installs the latest Neovim AppImage.
    - Installs the Tmux AppImage and sets up `tmux-logging`.
    - Installs `zoxide` and configures shell completions.
- **Toolchain Setup**: 
    - Installs `pynvim` and `ruff` via `uv`.
    - Installs `neovim` node package via `npm`.
- **Environment Configuration**: Configures `.bashrc` with necessary aliases and initializations for `uv` and `zoxide`.

To run the full automated setup:
```bash
bash setup_by_plur.sh
```

### Manual Setup Scripts

If you prefer to run the setup steps individually:

1. **General Dotfiles**:
   ```bash
   bash dotsetup.sh
   ```
   This symlinks `vimrc` and `tmux.conf` to your home directory.

2. **Neovim Configurations**:
   ```bash
   bash nvsetup.sh
   ```
   This symlinks all Neovim configurations to `~/.config/` and adds aliases (e.g., `nmin`, `nlit`) to your `.bashrc`.

## Directory Structure

- `plur_dotfiles/`: Python source for the automation tool.
- `nvim/`, `nmin/`, `nlit/`, `nvks/`, `nold/`: Various Neovim configurations.
- `wezterm/`: WezTerm terminal emulator configuration.
- `tmux.conf`: Tmux configuration.
- `vimrc`: Vim configuration.
- `ruff/`, `pylintrc`: Linting configurations.

## License

This project is licensed under the MIT License - see below for details.

```text
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
