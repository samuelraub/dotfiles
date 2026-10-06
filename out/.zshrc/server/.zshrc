





# PROMPT
# zsh builtins only, nothing to install on the server
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{242}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{242}%b|%a%f'
add-zsh-hook precmd vcs_info
setopt prompt_subst
# host is red for root; the prompt char turns red after a failed command
PROMPT=$'\n%(!.%F{red}.%F{yellow})%n@%m%f %F{blue}%~%f${vcs_info_msg_0_}\n%(?.%F{magenta}.%F{red})%#%f '


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
