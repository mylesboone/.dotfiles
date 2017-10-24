alias n='nvim'
alias bw='cd /home/myles/Documents/baldwin-web/'
alias dot='cd /home/myles/dotfiles/'
alias vu="nvim +PlugInstall"
alias vrc="nvim ~/dotfiles/neovim/.config/nvim/init.vim"
alias t="tmux"
alias clean_devdb="RAILS_ENV=development bundle exec rake db:drop db:setup"
alias clean_testdb="RAILS_ENV=test bundle exec rake db:drop db:setup"
alias pclean_testdb="bundle exec rake parallel:drop[8] parallel:setup[8]"
alias bep="SKIP_SIMPLECOV=true bundle exec rake parallel:spec[8]"
