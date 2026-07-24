# Initialize Starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

bindkey -s ^f "~/.local/scripts/tmux-sessionizer.sh\n"

# Added by Antigravity
export PATH="/Users/applemacbookpro/.antigravity/antigravity/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.local/bin:$PATH"

# Go binaries installed via `go install`
export PATH="$HOME/go/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias sre-local="node /Users/applemacbookpro/Projects/SmythOS/sre/packages/cli/dist/index.cjs"

# pnpm
export PNPM_HOME="/Users/applemacbookpro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Run CocoaPods without RVM gem env leaking into Homebrew Ruby (fixes incompatible libruby LoadError)
alias pod='env -u GEM_HOME -u GEM_PATH pod'
