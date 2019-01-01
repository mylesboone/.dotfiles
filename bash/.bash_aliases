#nvim and dot file
alias n='nvim'
alias dot='cd ~/Documents/dotfiles/'
alias vu="nvim +PlugInstall"
alias vrc="nvim ~/dotfiles/neovim/.config/nvim/init.vim"
alias t="tmux"
alias copyssh="xclip -sel clip < ~/.ssh/id_rsa.pub"
alias opti='cd ~/Documents/rubyapplicationrepository'
alias pigouts='cd ~/Documents/pigouts'
alias quote='cd ~/Documents/quote4'


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

#Simplero aliases
alias rst='touch ~/.pow/restart.txt'
alias deploy='ssh -t aws "./Simplero/script/deploy-from-bastion.sh $*"'
alias fdeploy='ssh -t aws "./Simplero/script/deploy-from-bastion.sh --skip-tags assets $*"'
alias cal='tail -f ~/Documents/Simplero/log/development.log|grep CALVIN'
alias log='less ~/Documents/Simplero/log/development.log'
alias e2up='aws ec2 start-instances --instance-id i-092b332344579fcb0'
alias e2down='aws ec2 stop-instances --instance-id i-092b332344579fcb0'
alias ddi='git difftool $(ssh w5 "cd app/current; git rev-parse HEAD")'
alias simplero='cd ~/Documents/Simplero/'
