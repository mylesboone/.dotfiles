let mapleader = "\<Space>"
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
set splitright
set splitbelow
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

"Boiler configuration
function BoilerBuilder()
  if filereadable("boiler") == 1
    if filereadable(@%) == 0
      read !bundle exec ruby boiler %
      norm ggdd
    elseif line('$') == 1 && col('$') == 1
      read !bundle exec ruby boiler %
      norm ggdd
    endif
  endif
endfunction

"Rails open associated spec files or vice versa
au BufNewFile,BufReadPost *.rb silent! :call BoilerBuilder()
function! RailsOpenAltCommand(path, vim_command)
  if a:path =~ "spec/"
    let l:alternate = substitute(a:path, "spec/", "app/", "")
    let l:alternate = substitute(l:alternate, "_spec", "", "")
  elseif a:path =~ "app/"
    let l:alternate = substitute(a:path, "app/", "spec/", "")
    let l:alternate = substitute(l:alternate, ".rb", "_spec.rb", "")
  endif

  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Mappings
inoremap jj <Esc>
inoremap jq <Esc>:wq<cr>
inoremap jw <Esc>:w<cr>
nnoremap <Leader>. :call RailsOpenAltCommand(expand('%'), ':vsplit')<cr>
