
"
set term=screen-256color

" Purge previous auto commands (in case vimrc is run twice)
autocmd!

set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'marik/vundle'
Bundle 'jnwhiteh/vim-golang'
Bundle 'corntrace/bufexplorer'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/syntastic'
Bundle 'gregsexton/gitv'
Bundle 'majutsushi/tagbar'
Bundle 'vim-php/tagbar-phpctags.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'SirVer/ultisnips'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'edkolev/tmuxline.vim'
Bundle 'othree/html5.vim'
Bundle 'wdalmut/vim-relatedtest'
Bundle 'joonty/vdebug'
Bundle 'StanAngeloff/php.vim'
Bundle 'godlygeek/tabular'

" Enable loading filetype and indentation plugins
filetype plugin indent on

" Turn syntax highlighting on
syntax on

colorscheme wolokai

" See 120 char line
set colorcolumn=120
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=234

set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" enable 256 colors in screen
set t_Co=256

" make sure that mouse is disabled
set mouse=""

"
" GLOBAL SETTINGS
"

" Make sure that unrecognized files are still indented
set autoindent

" Allow buffer to go into background - w/o losing the undo history and
" w/o prior saving
set hidden

" Allow backspacing over everything
set backspace=indent,eol,start

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Insert mode completion options
set completeopt=menuone

" Allow smarter completion by infering the case
set infercase

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Highlight results of a search
set hlsearch

" Ignore case when searching
set ignorecase

" Ignore case only if seach string is all lowercase
set smartcase

" Make sure that tabline is always present
set showtabline=2

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F4 to toggle 'paste' mode
"
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode


" Show line, column number, and relative position within a file in the status line
set ruler
set relativenumber

" Scroll when cursor gets within 10 characters of top/bottom edge
set scrolloff=999

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Expand tabs to spaces
set expandtab

" do not wrap lines by default
set nowrap

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" Make sure cursor is not blinking
set guicursor=a:blinkon0

" Do not fold by default
set foldlevelstart=20

"
" Plugins tuning
"

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"

"
" PHP
"
au FileType php set omnifunc=phpcomplete#CompletePHP
" LESS
au BufNewFile,BufRead *.less set filetype=less
" WSGI
au BufNewFile,BufRead *wsgi set filetype=python
" HTML
au BufRead,BufNewFile *.twig set filetype=html

" Enable folds for cucumber (behat)
au FileType cucumber set foldmethod=indent

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing spaces
au FileType vim,php,c,python,html,twig,yml,xml,js,md,go au BufWritePre *.* :%s/\s\+$//e

"
" MAPPINGS
"

" Unmap arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" Exit insert mode with jk
:inoremap jk <esc>

" Set the <Leader> for combo commands
let mapleader = ","

" IT keyboards
nmap ò :
vmap ò :

" Prepare tags
set tags=./tags;

" Large file
let g:LargeFile = 2

" git
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>ge :Gedit<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>ga :Gcommit -a<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gl :Gitv<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>h :split <C-R>=expand("%:p:h") . '/'<CR>

" format table
noremap <Leader>tab :Tabularize /\|<CR>

" Open todo notes
map <Leader>todo :vs ~/projects.todo.txt<CR>

au FileType php noremap <Leader>tau <ESC>:!phpunit --configuration tests/ <CR>
au FileType php noremap <Leader>tu <ESC>:!phpunit --configuration tests/ %<CR>
au FileType php noremap <Leader>ts <ESC>:!bin/phpspec run %<CR>
au FileType php noremap <Leader>tas <ESC>:!bin/phpspec run<CR>
au FileType cucumber noremap <Leader>te <ESC>:exec g:runBehatScenario()<CR>
au FileType cucumber noremap <Leader>tae <ESC>:!bin/behat -fprogress<CR>

func! g:runBehatScenario()
    return ":!bin/behat %:".line(".")
endfunc

map <Leader>l :BufExplorer<CR>

" vimdiff
map ]] ]c
map [[ [c

" save changes
map <Leader>s :w<CR>
imap <Leader>s <ESC>:w<CR>
vmap <Leader>s <ESC><ESC>:w<CR>

" close buffer using bclose plugin (window is not closed)
map <Leader>w :Bclose<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" turn off search highlighting
nmap <silent> <Leader>n :silent :nohlsearch<CR>

" Apache PIG syntax
augroup filetypedetect
    au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

nmap <Leader>x :TagbarToggle<CR>

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](report|bin|cache|vendor)$',
    \ }

" Syntastic check
let g:syntastic_html_checkers=['jshint']

" Supertab config
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:ctrlp_match_window = 'max:30'

"statusline setup
set statusline =%#StatusLineFilename#
set statusline+=[%f]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

