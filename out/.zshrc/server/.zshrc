





# Exports
export EDITOR='vim'



alias l="ls -la --color=always"


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
