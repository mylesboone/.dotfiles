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
Plug 'FooSoft/vim-argwrap'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'digitaltoad/vim-pug'
Plug 'unblevable/quick-scope'
call plug#end()
set background=dark
let base16colorspace=256
colorscheme base16-default-dark

command! -bang -nargs=* Find
      \ call fzf#vim#grep(
      \'rg --column  --no-heading --smart-case  --hidden --follow --glob  "!.git/*" --color "always" '.shellescape(<q-args>), 1
      \ )

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
nnoremap <CR> :noh<CR><CR> " cancel search by pressing return

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

" {{{ coc.vim
" {{{ functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}
" {{{ mappings
inoremap <silent><expr> <c-n> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" :coc#refresh()
inoremap <expr><S-c-n> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" Use <c-n> to trigger completion.
inoremap <silent><expr> <c-n> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" }}}
" {{{ commands
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}}
" {{{ snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_prev = '<c-p>'
let g:coc_snippet_next = '<c-n>'
" }}}
" {{{ extensions
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-eslint',
      \'coc-html',
      \'coc-json',
      \'coc-snippets',
      \'coc-solargraph',
      \'coc-tsserver',
      \'coc-vetur',
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
