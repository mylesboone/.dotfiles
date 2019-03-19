#nvim and dot file
alias n='nvim'
alias dot='cd ~/Documents/dotfiles/'
alias vu="nvim +PlugInstall"
alias vrc="nvim ~/dotfiles/neovim/.config/nvim/init.vim"
alias t="tmux"
alias copyssh="xclip -sel clip < ~/.ssh/id_rsa.pub"
alias opti='cd ~/Documents/rubyapplicationrepository'
alias pigouts='cd ~/Documents/pigouts'
alias quote4='cd ~/Documents/quote4'


#Docker
alias drmi='docker rmi $(docker images --quiet --filter "dangling=true")'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dc="drmc; drmi"
alias dbackground="docker-compose run web bundle exec rake resque:work QUEUE=*"
alias dscheduler="docker-compose run web bundle exec rake resque:scheduler"


#l aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
