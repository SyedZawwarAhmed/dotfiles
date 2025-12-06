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

### Recommended: Using GNU Stow

[GNU Stow](https://www.gnu.org/software/stow/) is a symlink farm manager that makes managing dotfiles easier. It automatically creates the necessary directory structure and symlinks. This is the recommended installation method.

#### Install GNU Stow

**Using Homebrew (macOS):**
```bash
brew install stow
```

**Using package manager (Linux):**
```bash
# Debian/Ubuntu
sudo apt-get install stow

# Fedora/RHEL
sudo dnf install stow

# Arch Linux
sudo pacman -S stow
```

#### Setup with Stow

1. Clone this repository:
   ```bash
   git clone git@github.com:SyedZawwarAhmed/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Reorganize files for stow (one-time setup):
   ```bash
   # Create package directories
   mkdir -p zsh tmux nvim/.config
   
   # Move files to package directories
   mv .zshrc zsh/
   mv .tmux.conf tmux/
   mv .config/nvim nvim/.config/
   ```

3. Use stow to create symlinks:
   ```bash
   # Stow all packages at once
   stow -t ~ zsh tmux nvim
   
   # Or stow individually
   stow -t ~ zsh
   stow -t ~ tmux
   stow -t ~ nvim
   ```

4. Reload your shell:
   ```bash
   source ~/.zshrc
   ```

#### Stow Commands

- **Install all packages:**
  ```bash
  stow -t ~ zsh tmux nvim
  ```

- **Uninstall a package:**
  ```bash
  stow -D -t ~ zsh
  ```

- **Restow (recreate symlinks):**
  ```bash
  stow -R -t ~ zsh
  ```

- **Check what stow would do (dry run):**
  ```bash
  stow -n -t ~ zsh
  ```

**Note:** If you prefer to keep the current repository structure, you can use stow with the `-d` flag to specify the directory:
```bash
# From the dotfiles directory
stow -d . -t ~ -S zsh -S tmux -S nvim
```
However, reorganizing into package directories is the recommended approach for cleaner management.

### Alternative: Manual Symlinks

If you prefer not to use GNU Stow, you can manually create symlinks:

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
- GNU Stow (recommended for installation)

## License

This repository is for personal use. Feel free to take inspiration from it for your own dotfiles.

## Author

Syed Zawwar Ahmed

