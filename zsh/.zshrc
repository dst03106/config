# colortheme
eval "$(starship init zsh)"

# alias
alias v='nvim .'
alias nv='nvim'
alias cs='
  colima delete -f &&
  colima start --dns 8.8.8.8 &&
  sudo ln -sf $HOME/.colima/default/docker.sock /var/run/docker.sock
' # docker for MacOS

