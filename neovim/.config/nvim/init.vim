let mapleader = "\<Space>"
set list
set tabstop=2
set autoindent
set shiftwidth=2
set softtabstop=2
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
set ttimeoutlen=100
set splitright
set splitbelow
set undofile
set undodir=~/.config/nvim/undodir
call plug#begin('~/.config/nvim/plugged')
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'kthibodeaux/tig.vim'
Plug 'kthibodeaux/pull-review'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'thoughtbot/vim-rspec'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'FooSoft/vim-argwrap'
call plug#end()
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

command! -bang -nargs=* Find
      \ call fzf#vim#grep(
      \'rg --column  --no-heading --smart-case  --hidden --follow --glob  "!.git/*" --color "always" '.shellescape(<q-args>), 1
      \ )

let g:python3_host_prog = '/usr/bin/python3.6'
let g:deoplete#enable_at_startup = 1
let g:NERDTreeWinSize=30

au BufWritePost *.rb :call jobstart('ctags')

" Mappings
inoremap jj <Esc>
inoremap jq <Esc>:wq<cr>
inoremap jw <Esc>:w<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>/ :Files<CR>
nnoremap <leader>g :GFiles?<CR>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <leader>ff :Find<space>
nnoremap <leader>fs :Find<space><c-R><c-W><CR>
nnoremap <leader>ft :Find<space><c-R>"<CR>

"Rails file navigation
nnoremap <leader>c :Econtroller<CR>
nnoremap <leader>m :Emodel<CR>
nnoremap <leader>v :Eview<CR>
nnoremap <leader>u :Eunittest<CR>

" Close the buffer and reuse the window for an existing buffer
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"format entire file
nnoremap <leader><tab> mtgg=G`t

"tig and git mappings
nnoremap <leader>vc :silent !tmux split-window -h "tig --follow %"<CR>
nnoremap <leader>vb :silent !tmux split-window -h "tig blame %"<CR>
nnoremap <leader>vv :silent !tmux split-window -h "tig"<CR>

" RSpec.vim mappings
let g:rspec_command = 'call VimuxRunCommand("bes {spec}\n")'
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rr :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>

" Tig
" nmap <leader>c <Plug>TigFileHistory
nmap <leader>gb <Plug>TigBlame
nmap <leader>y <Plug>TigLatestCommitForLine
nmap <leader>. <Plug>RailsOpenAlt

map <C-n> :NERDTreeFind<CR>

" split line
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>$

" fzf
set rtp+=~/.fzf
set hidden

let g:NERDTreeIndicatorMapCustom = {
   \ "Modified"  : "✹",
   \ "Staged"    : "✚",
   \ "Untracked" : "✭",
   \ "Renamed"   : "➜",
   \ "Unmerged"  : "═",
   \ "Deleted"   : ":heavy_multiplication_x:",
   \ "Dirty"     : "✗",
   \ "Clean"     : "✔",
   \ "Unknown"   : "?"
   \ }

let g:ruby_indent_block_style= 'do'

" Argwrap {{{
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>a :ArgWrap<CR>
let g:argwrap_tail_comma = 1
" }}}

highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEWarning ctermbg=18 ctermfg=none

nmap <leader>lq <Plug>UseQwertyNavigation
nmap <leader>lc <Plug>UseColemakNavigation
