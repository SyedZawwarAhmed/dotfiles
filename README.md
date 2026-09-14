# Dotfiles

Personal macOS/Linux configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a **stow package** whose internal layout mirrors `$HOME`.
Stowing `zsh` creates `~/.zshrc -> dotfiles/zsh/.zshrc`.

## Install

```bash
git clone git@github.com:SyedZawwarAhmed/dotfiles.git ~/dotfiles
cd ~/dotfiles
brew install stow
./install.sh                 # all packages
./install.sh zsh nvim        # just some
./install.sh -D              # unstow everything
```

Then `brew bundle install --global` to install the recorded packages (it reads `~/.Brewfile`),
and `source ~/.zshrc`.

## Packages

| Package | Links to | Contents |
|---|---|---|
| `zsh` | `~/.zshrc` | shell config, aliases, PATH |
| `tmux` | `~/.tmux.conf` | tmux + tpm plugin config |
| `nvim` | `~/.config/nvim/` | Neovim (lazy.nvim, LSP, Telescope, Neo-tree) |
| `starship` | `~/.config/starship.toml` | prompt |
| `ghostty` | `~/.config/ghostty/` | terminal |
| `git` | `~/.gitconfig`, `~/.config/git/ignore` | identity + global ignore |
| `gh` | `~/.config/gh/config.yml` | GitHub CLI prefs and aliases |
| `bin` | `~/.local/bin/` | `transcribe`, `transcribe-mcp`, `cursor` |
| `claude` | `~/.claude/` | `CLAUDE.md` + hand-written skills |
| `codex` | `~/.codex/AGENTS.md` | symlink to `CLAUDE.md` |
| `gemini` | `~/.gemini/GEMINI.md` | symlink to `CLAUDE.md` |
| `cursor` | `~/.cursor/mcp.json` | Cursor CLI MCP servers |
| `vscode` | `~/Library/.../Code/User/` | VS Code settings |
| `cursor-app` | `~/Library/.../Cursor/User/` | Cursor GUI settings + keybindings |
| `brew` | `~/.Brewfile` | `brew bundle` manifest |

### Agent instructions are shared

`claude/.claude/CLAUDE.md` is the single source of truth. `codex/.codex/AGENTS.md` and
`gemini/.gemini/GEMINI.md` are symlinks to it, so all three assistants stay in sync.
Edit the Claude one.

### Hand-written Claude skills

`claude/.claude/skills/` tracks only the four skills written by hand — `owasp`,
`tmux-window-name`, `transcribe-audio`, `unslop`. The rest of `~/.claude/skills/` are
symlinks into `~/.agents/skills/` (installed from elsewhere) and are not tracked here.

## Deliberately not tracked

This repository is **public**, so two configs stay machine-local. Sanitised copies live in
`templates/` for reference, and `.gitignore` blocks the real ones:

- **`~/.claude/settings.json`** — its `autoMode.environment` block records work-specific
  infrastructure. `templates/claude-settings.json` has that block stripped and keeps the
  prefs and tmux hooks.
- **`~/.codex/config.toml`** — contains an API key and ~28 per-project history blocks.
  `templates/codex-config.toml` is redacted.

Also excluded: `~/.config/gh/hosts.yml`, `~/.codex/auth.json` (auth tokens),
`~/.tmux/plugins/` (tpm-managed), and the RVM-generated `.bashrc` / `.profile` / `.mkshrc`
/ `.zlogin` stubs.

## Requirements

macOS or Linux · GNU Stow · Zsh · Neovim v0.8+ · Tmux · Starship (optional)

## Author

Syed Zawwar Ahmed
