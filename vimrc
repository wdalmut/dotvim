
"
set term=screen-256color

" Purge previous auto commands (in case vimrc is run twice)
autocmd!

set nocompatible              " be iMproved
filetype off                  " required!

"Install vundle
let shouldInstallBundles = 0
if !filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
    echo "~≥ Installing Vundle \n"
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle $HOME/.vim/bundle/Vundle.vim
    silent !mkdir -p $HOME/.tmp
    let shouldInstallBundles = 1
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'godlygeek/tabular'
Plugin 'wdalmut/vim-relatedtest'
Plugin 'w0ng/vim-hybrid'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'

if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif

" Enable loading filetype and indentation plugins
filetype plugin indent on

" Turn syntax highlighting on
syntax on
set omnifunc=syntaxcomplete#Complete

set background=dark
colorscheme hybrid

"
" See 120 char line
set colorcolumn=120
let &colorcolumn=join(range(121,999),",")
highlight ColorColumn ctermbg=235

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

" Ignore case only if search string is all lowercase
set smartcase

" Make sure that tabline is present only if it is needed
set showtabline=1

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

" Caps to Esc
"au VimEnter * silent !setxkbmap -option caps:escape


" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:netrw_browse_split = 1

" Make sure cursor is not blinking
set guicursor=a:blinkon0

"
" Plugins tuning
"

" cloe buffer explorer on select
let g:miniBufExplAutoStart = 0
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplVSplit = 35

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }
let g:syntastic_c_avrgcc_config_file = '.config'

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["mysnip"]
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-j>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-k>"))
"
" 80 column on text files
"
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.rst setlocal textwidth=80
"
" PHP
"
au FileType php set omnifunc=phpcomplete#CompletePHP
" LESS
au BufNewFile,BufRead *.less set filetype=less
" WSGI
au BufNewFile,BufRead *.wsgi set filetype=python
" HTML
au BufRead,BufNewFile *.twig set filetype=html
" MARKDOWN
au BufRead,BufNewFile *.md,*mdown set filetype=markdown

" open all folds
set foldmethod=indent
set foldlevelstart=99
" Enable folds for cucumber, behat...
autocmd BufNewFile,BufReadPost *.feature setl foldmethod=indent nofoldenable

" Coffeescript folding
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Use 2 space on specific files
autocmd Filetype sls,coffee,js,javascript,json,yaml setlocal ts=2 sts=2 sw=2

" Remove trailing spaces
au FileType vim,php,c,python,html,twig,yml,xml,js,javascript,md,sls au BufWritePre *.* :%s/\s\+$//e

"
" MAPPINGS
"

" Unmap arrow keys
no <up> <Nop>
no <down> <Nop>
no <left> <
no <right> >
ino <up> <Nop>
ino <down> <Nop>
ino <left> <
ino <right> >
vno <up> <Nop>
vno <down> <Nop>
vno <left> <gv
vno <right> >gv

" Exit insert mode with jk
:inoremap jk <esc>

" Set the <Leader> for combo commands
let mapleader = ","

" IT keyboards
nmap ò :
vmap ò :

" Prepare tags
set tags=./tags;
map <Leader>tags :!ctags -R --exclude=.subsplit --exclude=.git --exclude=*cache* --languages= .<LEFT><LEFT>

" italian
map <Leader>it :setlocal spell spelllang=it<CR>
map <Leader>nit :set nospell<CR>

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

" Disable markdown preview
let g:instant_markdown_autostart = 0
" Open preview window
map <Leader>mdp :InstantMarkdownPreview<CR>

" Create folder at current path
map <Leader>mk :!mkdir -p %:h<CR><CR>

" PHP Namespaces
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>h :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>mv :!mv % <C-R>=expand("%:p:h") . '/'<CR>

" easy split resize
map + :vertical resize +5<cr>
map - :vertical resize -5<cr>
map = <c-w>=

" open a new vertical split
map <Leader>\| :vnew<cr>

" format table
noremap <Leader>tab :Tabularize /\|<CR>

" phpunit
au FileType php noremap <Leader>tau <ESC>:let g:phpunit_args_append=""<ESC>:Test <CR>
au FileType php noremap <Leader>tu  <ESC>:let g:phpunit_args_append=""<ESC>:Test %<CR>
au FileType php noremap <Leader>tt <ESC>:let g:phpunit_args_append="-v --filter " . @t<ESC>:Test<CR>
au FileType php noremap <Leader>to  <ESC>:TestOutput<CR>

" javascript
au FileType javascript noremap <Leader>tu <ESC>:!npm test %<CR>
au FileType javascript noremap <Leader>tau <ESC>:!npm test<CR>
au FileType javascript noremap <Leader>tt <ESC>:let g:test_filter=@t<CR>:exe "!npm test -- --filter=\"".g:test_filter."\""<CR>

map <Leader>l :MBEToggle<CR> :MBEFocus<CR>

" vimdiff
map ]] ]c
map [[ [c

map <Leader>co :copen<CR>

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

" Show tagbar
nmap <Leader>x :TagbarToggle<CR>

" Ignore folders for ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](report|build|docs|doc|deps|_build|bin|cache|vendor|node_modules|dist|bower_components|_site)$',
    \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~

" do not change the current path
let g:ctrlp_working_path_mode = '0'

" Syntastic check
let g:syntastic_html_checkers=['jshint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']

" Supertab config
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:ctrlp_match_window = 'max:30'

" Gist
let g:gist_show_privates = 1
let g:gist_post_private = 1

" Phpunit
let g:phpunit_args="--colors"

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

" Alias
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Wq","wq")

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"Correct
iab flase       false
iab ture        true
iab clinet      client

" override colors for PHP
let php_var_selector_is_identifier=1

" exclude vendor folder during search
:set wildignore+=**/vendor/**

" Copy using xclip
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> :-1r !xclip -o -sel clip<CR>

"allow project .vimrc
set exrc
"enable secure mode
set secure

if filereadable("~/.exrc")
    source ~/.exrc
endif

