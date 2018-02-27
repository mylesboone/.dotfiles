alias n='nvim'
alias bw='cd /home/myles/Documents/baldwin-web/'
alias dot='cd /home/myles/dotfiles/'
alias vu="nvim +PlugInstall"
alias vrc="nvim ~/dotfiles/neovim/.config/nvim/init.vim"
alias t="tmux"
alias drmi='docker rmi $(docker images --quiet --filter "dangling=true")'
alias drmc='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'
alias dc="drmc; drmi"
alias dbackground="docker-compose run web bundle exec rake resque:work QUEUE=*"
alias dscheduler="docker-compose run web bundle exec rake resque:scheduler"
