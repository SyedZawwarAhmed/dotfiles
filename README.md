# Dotfiles

My personal dotfiles configuration for macOS. This repository contains configuration files for various tools and applications I use in my development workflow.

## Contents

### Neovim Configuration
- **Location**: `.config/nvim/`
- Modern Neovim setup with Lua configuration
- Includes plugins for:
  - LSP (Language Server Protocol) support
  - Auto-completion (nvim-cmp)
  - File navigation (Telescope, Neo-tree)
  - Formatting and linting
  - Git integration (gitsigns)
  - Session management (auto-sessions)
  - And more...

### Zsh Configuration
- **Location**: `.zshrc`
- Custom shell configuration and aliases

### Tmux Configuration
- **Location**: `.tmux.conf`
- Terminal multiplexer configuration

## Installation

### Quick Setup

1. Clone this repository:
   ```bash
   git clone git@github.com:SyedZawwarAhmed/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Create symlinks to your home directory:
   ```bash
   # Zsh
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   
   # Tmux
   ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
   
   # Neovim
   mkdir -p ~/.config
   ln -s ~/dotfiles/.config/nvim ~/.config/nvim
   ```

3. Reload your shell:
   ```bash
   source ~/.zshrc
   ```

### Neovim Setup

After symlinking the Neovim config, start Neovim and it will automatically install the plugins:
```bash
nvim
```

## Requirements

- macOS (tested on macOS)
- Neovim (v0.8+)
- Zsh
- Tmux

## License

This repository is for personal use. Feel free to take inspiration from it for your own dotfiles.

## Author

Syed Zawwar Ahmed

