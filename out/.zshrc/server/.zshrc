

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore"
ffd() {
  old_dir=$(pwd)
  cd ~
  new_dir=$(find * -maxdepth 2 -type d | fzf)
  if [ -z "$new_dir" ]
  then
    cd $old_dir
  else
    cd $new_dir
  fi
}

fff() {
  file=$(rg --files --hidden | fzf)
  if [ -z "$file" ]
  then
  else
    vim $file
  fi
}

ffc() {
  file=$(rg --hidden . | fzf)
  if [ -z "$file" ]
  then
 else
    vim $(echo $file | sed 's/:.*//g')
  fi
}







# Exports
export EDITOR='vim'

alias l="ls -la --color"

alias ip="ifconfig | grep 192 | grep --color=never -E '[^ ]*$' -o"
alias pubip='dig +short txt ch whoami.cloudflare @1.0.0.1 | sed s/\"//g'
alias src="source ~/.zshrc"
alias c="clear"
alias o="open"
alias dev="cd ~/dev"
alias kc="kubectl"
alias dops="docker ps -a"
alias dopss='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'
alias doco="docker compose"







# vim: set filetype=bash.eruby:
