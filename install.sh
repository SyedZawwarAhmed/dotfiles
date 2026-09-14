#!/usr/bin/env bash
# Symlink every package into $HOME with GNU Stow.
#   ./install.sh            stow everything
#   ./install.sh zsh nvim   stow just those packages
#   ./install.sh -D         unstow everything
set -euo pipefail

cd "$(dirname "$0")"

PACKAGES=(
  zsh tmux nvim starship ghostty     # shell, editor, terminal
  git gh                             # version control
  bin                                # ~/.local/bin scripts
  claude codex gemini cursor         # AI tooling
  vscode cursor-app                  # GUI editor settings (~/Library)
  brew                               # ~/.Brewfile
)

ACTION=(-S)
if [[ "${1:-}" == "-D" || "${1:-}" == "--delete" ]]; then
  ACTION=(-D); shift
fi

TARGETS=("$@")
[[ ${#TARGETS[@]} -eq 0 ]] && TARGETS=("${PACKAGES[@]}")

command -v stow >/dev/null || { echo "GNU Stow not installed: brew install stow" >&2; exit 1; }

stow -v "${ACTION[@]}" -t "$HOME" "${TARGETS[@]}"
echo "done: ${TARGETS[*]}"
