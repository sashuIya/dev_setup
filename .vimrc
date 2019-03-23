set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim' 
Plugin 'Valloric/YouCompleteMe'
" Plugin 'rhysd/vim-clang-format'
Plugin 'craigemery/vim-autotag'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rdnetto/YCM-Generator'
Plugin 'jiangmiao/auto-pairs'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'gioele/vim-autoswap'
Plugin 'tmhedberg/SimpylFold'
Plugin 'brandonbloom/csearch.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader=","

set nowrap        " don't wrap lines
set tabstop=2     " a tab is four spaces
set expandtab     " replace tabs with spaces
" set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
" set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set mouse=a              " use mouse

:imap jj <Esc>
:nnoremap & :%s/\<<C-r><C-w>\>/

map <Leader>m :CtrlPMRU<CR>
map <Leader>M :CtrlPBranch<CR>
map <Leader>. :CtrlP<CR>
map <Leader>, :CtrlPBuffer<CR>
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
let g:ctrlp_match_window = 'min:4,max:72'
let g:ctrlp_mruf_max = 50
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_mruf_relative = 1
" Ignore binary and files specified in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Do not close buffers
set hidden

set colorcolumn=101

let g:gitgutter_diff_args = 'HEAD~'

" One space after start of comment
let g:NERDSpaceDelims = 1

set cscopeprg='/home/alexander/local/bin/cscope'

" Force indentation styles for this directory
" autocmd FileType python set shiftwidth=2
" autocmd FileType python set tabstop=2
" autocmd FileType python set softtabstop=2

" Avoid indent within namespace
" set cino=N-s

" To close buffers from CtrlP
call ctrlp_bdelete#init()

" Use silver search
let g:ackprg = '~/local/bin/ag --vimgrep'
" if executable('ag')
  " let g:ackprg = 'ag --vimgrep'
" endif

" Disable preview window for ycm
set completeopt-=preview
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl+C, Ctrl+V
smap <C-c> <C-g>y
imap <C-v> <Esc>pi
smap <C-v> <C-g>p

" Search by double click
noremap <2-LeftMouse> *#
inoremap <2-LeftMouse> *#


" Indent Python in the Google way.

" setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

"""

" autocmd FileType python nnoremap <leader>j :0,$!python3 ~/yapf/yapf<Cr>
" autocmd FileType cpp nnoremap <leader>r :ClangFormat<Cr>
noremap <F3> :Autoformat<CR>

" Spelllcheck
set spelllang=en
set spellfile=$HOME/.vim.en.utf-8.add

" Colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
hi Normal guibg=NONE ctermbg=NONE

" fzf
set rtp+=~/.fzf

set title titlestring=

set nobackup

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" To open vimrc.
map <leader>vimrc :tabe $MYVIMRC<cr>
" Apply vimrc when changed.
autocmd bufwritepost .vimrc source $MYVIMRC

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent
