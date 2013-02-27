set nocompatible
set backspace=indent,eol,start

set number
set mouse=a
set vb
set t_Co=256
set guifont=Terminus\ Medium:h12
set noantialias
set guioptions-=T
"let g:solarized_termcolors=256
let g:solarized_italic=0
let g:Powerline_symbols='fancy'
colorscheme solarized
set background=dark

set cryptmethod=blowfish

syntax on
set hlsearch

set wildmenu
set cursorline
set laststatus=2

set spell spelllang=pt,en

set history=10000
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set linebreak

set foldenable
set foldmethod=syntax
set foldlevel=0

set autoindent
set smartindent

set showmatch
set incsearch
set ignorecase

filetype on
filetype plugin on
filetype indent on

" let g:perl_compiler_force_warnings = 0
let perl_fold=1
let perl_nofold_packages=1
let perl_extended_vars=1
let perl_include_pod=1
autocmd FileType perl :call SetupPerl()
function! SetupPerl()
    compiler perl
    setlocal makeprg=perl\ -I.\ -I..\ -I../..\ -I../../..\ -Ilib\ -Mstrict\ -wc\ %
    setlocal iskeyword=48-57,_,A-Z,a-z,192-255,:
    setlocal path+=.,..,../..,../../..,lib

    map <F6> :%!perltidy<CR>
    vmap <F6> :!perltidy<CR>
endfunction

set backup
set backupdir=/tmp
set dir=/tmp

"set grepprg=ack\ -a

" dont use Q for Ex mode
map Q :q

" edit/write/quit alias
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Q w

" kill'em all!!!
nnoremap    <Up> <NOP>
nnoremap    <Down> <NOP>
nnoremap    <Left> <NOP>
nnoremap    <Right> <NOP>
noremap     <Insert> ""
noremap!    <Insert> <NOP>
noremap     <Delete> ""
noremap!    <Delete> <NOP>
noremap     <Home> ""
noremap!    <Home> <NOP>
noremap     <End> ""
noremap!    <End> <NOP>
noremap     <PageUp> ""
noremap!    <PageUp> <NOP>
noremap     <PageDown> ""
noremap!    <PageDown> <NOP>

" now all operations work with the OS clipboard
"set clipboard=unnamed

" make tab in v mode ident code
vmap <Tab> >gv
vmap <S-Tab> <gv

" make tab in normal mode ident code
"nmap <Tab> I<tab><esc>
"nmap <S-Tab> ^i<bs><esc>

"let g:SuperTabDefaultCompletionType = "context"
let g:manpageview_multimanpage = 0

" Ctrl-r searches for selected text
vnoremap <C-r> "zy:/<C-r>z

" eregex
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? /

map <F5> :make<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
"let Tlist_Auto_Open=1
let Tlist_Use_Right_Window=1

set autochdir
set tags=tags,./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags

"nnoremap <C-down> :BufExplorer<CR>
"noremap <C-left> :bprev<CR>
"noremap <C-right> :bnext<CR>
"let g:buftabs_only_basename=1

" tmux-alike splits
map <C-w>- <C-w>s
map <C-w>\| <C-w>v

highlight clear SpellBad
highlight SpellBad gui=undercurl guisp=#bc6c4c
highlight clear SpellCap
highlight SpellCap gui=undercurl guisp=#bc6c4c
highlight clear SpellLocal
highlight SpellLocal gui=undercurl guisp=#bc6c4c
highlight clear SpellRare
highlight SpellRare gui=undercurl guisp=#bc6c4c

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
