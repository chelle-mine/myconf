# Prompt
PS1="[\t]\W :. "
export PS1

# Default editor vim
export EDITOR=vim

# Add RVM to PATH
# export PATH="$PATH:$HOME/.rvm/bin"

# Enable colors
export CLICOLOR=1

# Aliases
alias top='top -o mem -O cpu -S -stats pid,command,mem,cpu'
alias restart-chunkwm="brew services restart chunkwm"
alias la="ls -a"
alias ll="ls -l"
alias config="/usr/bin/git --git-dir=/Users/michelle/.myconf/ --work-tree=/Users/michelle"
