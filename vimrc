" --- LEADER  -------------------------------------------------------------- "

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" --- PLUGINS -------------------------------------------------------------- "

" Vundle (plugin manager) stuff
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'vim-scripts/Conque-GDB'
Plugin 'git@github.com:vim-scripts/localrc.vim.git'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'aperezdc/vim-template'
Plugin 'godlygeek/tabular'
Plugin 'git@github.com:plasticboy/vim-markdown.git'
Plugin 'git@github.com:altercation/vim-colors-solarized.git'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"ConqueGdb options
let g:ConqueGdb_SrcSplit = 'left'
"let g:ConqueGdb_Leader = ';'

"vim-template options
let g:username = 'Austin Glaser'
let g:email = 'austin@boulderes.com'
let g:templates_no_builtin_templates = 1
let g:templates_directory = '~/.vim/templates'
let g:templates_global_name_prefix = 'vim-template:'
let g:templates_fuzzy_start = 0
let g:templates_user_variables = [
    \   ['CLASSUNDERTEST',      'ClassUnderTest'],
    \   ['MACROCLASSUNDERTEST', 'MacroClassUnderTest'],
    \   ['CAMELCLASSUNDERTEST', 'CamelClassUnderTest'],
    \ ]

function! FileBaseName()
    return expand('%:t:r')
endfunction

function! ClassUnderTest()
    return substitute(FileBaseName(),'^test_','','')
endfunction

function! CamelClassUnderTest()
    return substitute(substitute(ClassUnderTest(),
                                 \ '\([a-zA-Z]\+\)', '\u\1', 'g'),
                      \ '_', '', 'g')
endfunction

function! MacroClassUnderTest()
    return toupper(ClassUnderTest())
endfunction

" --- INDENTATION ---------------------------------------------------------- "

set cindent "Auto indent for me when I open .c files.
set smartindent
set autoindent

set expandtab "Insert spaces, not a tabstop when I hit the tab key

"Set all tabs to be 4 wide
set tabstop=4
set softtabstop=4
set shiftwidth=4

" insert a literal tab character with Shift+Tab
inoremap <S-Tab> <C-V><Tab>

" list trailing whitespace
set listchars=tab:>-,trail:.,extends:>,precedes:<
set list

"Align case: inside switch()
" :help cinoptions-values
set cinoptions=:0

hi NonText ctermfg=8 guifg=gray
hi SpecialKey ctermfg=8 guifg=gray

" --- CUSTOM MAPPINGS ------------------------------------------------------ "

" <c-u> makes the current word uppercase in insert and normal modes
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" --- FILETYPES ------------------------------------------------------------ "

"treat .ino and .pde files as .cpp (for arduino and zapuino)
autocmd BufNewFile,BufReadPost *.ino,*.pde setlocal filetype=cpp

"treat gmsl as makefiles (cause they are)
autocmd BufNewFile,BufReadPost gmsl,__gmsl setlocal filetype=make

"treat gmsl as makefiles (cause they are)
autocmd BufNewFile,BufReadPost Makefile,*.mk setlocal tabstop=4
autocmd BufNewFile,BufReadPost Makefile,*.mk setlocal softtabstop=4
autocmd BufNewFile,BufReadPost Makefile,*.mk setlocal shiftwidth=4
autocmd BufNewFile,BufReadPost Makefile,*.mk setlocal expandtab

" Spell Check
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.markdown setlocal spell spelllang=en_us

" --- APPEARANCE ----------------------------------------------------------- "

syntax enable "Turn on syntax highlighting

"Colorscheme
let g:solarized_termtrans=1
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized

set number "Show line numbers all the time

"save temp files in tmp!
set backupdir=/tmp/
set directory=/tmp/

" Auto line wrapping
autocmd BufRead,BufNewFile *.txt setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.tex setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.md setlocal wm=2 tw=80
autocmd BufRead,BufNewFile *.markdown setlocal wm=2 tw=80

"Wrap comments, and keep a comment open within insert mode (:help fo-table)
set fo+=cr
set fo-=t
autocmd BufRead,BufNewFile *.c setlocal fo+=o
autocmd BufRead,BufNewFile *.h setlocal fo+=o

" --- COMMANDS ------------------------------------------------------------- "

command WrapToggle call WrapToggle()
function! WrapToggle()
  if &formatoptions =~ 't'
    set fo-=t
    echom "auto wrap off"
  else
    set fo+=t
    echom "auto wrap on"
  endif
endfunction

"auto load changed files, read every 5 seconds
source ~/.vim/WatchForChanges.vim
silent WatchForChanges
