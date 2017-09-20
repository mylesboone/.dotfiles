map <F2> :NERDTreeToggle<CR>
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
syntax on
set backspace=indent,eol,start
set colorcolumn=80
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2
set nowrap
set nrformats-=octal
set number
set relativenumber
set ruler
set scrolloff=1
set showcmd
set showmatch
set timeout
set timeoutlen=1000
set timeoutlen=100
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
call plug#end()
set background=dark
let base16colorspace=256
colorscheme base16-default-dark
" Strip trailing whitespace before saving
au BufWritePre * :call <SID>StripWhite()
fun! <SID>StripWhite()
  norm md
  %s/[ \t]\+$//ge
  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
  norm `d
endfun
