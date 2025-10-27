# brew
export PATH="$PATH:/opt/homebrew/bin"

# nvim with version manager named bob
export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PATH:$PNPM_HOME" ;;
esac

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$PATH:$JAVA_HOME/bin"

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"
