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
set backupcopy=yes
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-vinegar'
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'kthibodeaux/tig.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'thoughtbot/vim-rspec'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'jelera/vim-javascript-syntax'
Plug 'slim-template/vim-slim'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-endwise'
Plug 'FooSoft/vim-argwrap'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'digitaltoad/vim-pug'
Plug 'unblevable/quick-scope'
call plug#end()
set background=dark
let base16colorspace=256
colorscheme base16-default-dark
set termguicolors

command! -bang -nargs=* Find
      \ call fzf#vim#grep(
      \'rg --column  --no-heading --smart-case  --hidden --follow --glob  "!.git/*" --color "always" '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview('up:30%')
      \ )

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:NERDTreeWinSize=30

" Mappings
inoremap jj <Esc>
inoremap jq <Esc>:wq<cr>
inoremap jw <Esc>:w<cr>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <leader>b :Buffer<CR>
nnoremap <leader>k :Files<CR>
nnoremap <leader>g :GFiles?<CR>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <leader>ff :Find<space>
nnoremap <leader>fs :Find<space><c-R><c-W><CR>
nnoremap <leader>ft :Find<space><c-R>"<CR>
nnoremap <CR> :noh<CR><CR> " cancel search by pressing return
nnoremap <leader>q :wq<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>vs :vs<cr>

"Find recenter
nnoremap n nzz
nnoremap N Nzz

"Rails file navigation
nnoremap <leader>c :Econtroller<CR>
nnoremap <leader>m :Emodel<CR>
nnoremap <leader>v :Eview<CR>
nnoremap <leader>u :Eunittest<CR>

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

let g:NERDTreeGitStatusIndicatorMapCustom = {
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

"COC
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = [
      \'coc-css',
      \'coc-eslint',
      \'coc-html',
      \'coc-json',
      \'coc-snippets',
      \'coc-solargraph',
      \'coc-tsserver',
      \'@yaegassy/coc-volar',
      \'coc-pairs',
      \'coc-yaml',
      \]
" }}}
" }}}

set statusline=
set statusline+=\ %t
set statusline+=\ %m
set statusline+=\ %{coc#status()}
set statusline+=%r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set updatetime=300


" Vue `gf` for components
function! Dashcase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  let word = substitute(word,'_','-','g')
  return word
endfunction
set suffixesadd=.vue
set includeexpr=Dashcase(v:fname)
set path=.,app/javascript/**,frontend/src/**

" command! -nargs=0 FixRailsDBStructure :normal G?><CR>dd?=<CR>dd?|<CR>dd?<CR>jVG?;<CR>:s/;/,/g<CR>?<CR>jVG?,<CR>:sort u<CR>G?,<CR>r;?<CR>dd:wq<CR>
command! -nargs=0 FixRailsDBStructure :normal G?HEAD<CR>maG?><CR>V`a:s/;/,/g<CR>`ajGVG?>><CR>:g!/^[(]/d<CR>`addVG?,<CR>:sort u<CR>G?,<CR>r;:wq<CR>
