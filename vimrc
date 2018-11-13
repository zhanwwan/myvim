set nocompatible            " be iMproved, required
filetype off                " required
" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" let vim-plug, required
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/Smart-Tabs'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
" Plug 'majutsushi/tagbar'
Plug 'yggdroot/leaderf'
Plug 'vim-scripts/nesC'
Plug 'vim-scripts/NesC-Syntax-Highlighting'
Plug 'rmartinjak/vim-nesc'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
filetype plugin indent on   " required

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line number
set nu!
" Set how many lines of history VIM has to remeber
set history=1000
" Show matching brackets when text indicator is over them
set showmatch
" Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Enable mouse
set mouse=a
set cursorline
" Set to auto read when a file is changed from the outside
set autoread
" Enable filetype plugins
filetype plugin on
filetype indent on
" Get out of VI/s compatible mode..
set nocompatible
set modelines=0
" Configure backspace so it acts as it should act
set backspace=indent,eol,start whichwrap+=<,>,[,]
set whichwrap+=<,>,h,l
" Backspace in Visual mode deletes selection
vnoremap <BS> d

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab
" 1 tab == 2 spaces
set tabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2
" Linebreak on 500 characters
set lbr
set tw=3000
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set comments=://
set comments=s1:/*,mb:*,ex0:/
set tags=./.tags;,.tags
set fileformats=unix,dos
map <Up> gk
map <Down> gj
" Set title to window
"set title
"set titlelen=150

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
" ColorScheme
"colorscheme evening
colorscheme gruvbox
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cscope and Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocscopeverbose
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
   set csprg=/usr/local/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
       cscope add cscope.out
   "else add database pointed to by environment
   elseif $CSCOPE_DB != ""
       cscope add $CSCOPE_DB $CSCOPE_DB
   endif
   set csverb
endif

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1 

" NERDTree
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 
" nmap cw :NERDTreeToggle <cr>
nmap cw :cw <cr>
let g:netrw_winsize = 50
nmap <silent> fe :Sexplore!<cr>
let NERDTreeIgnore = ['\.\/$', '\.\.\/$']
let NERDTreeWinPos = "left"
let NERDTreeMouseMode = 2

filetype plugin indent on
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>" 
nmap fls :ls<CR>
nmap <C-s> :w <CR><ESC>
nmap <C-s>a :wall <CR>

"add comment
nmap ,a A /*  */<ESC>2hi
" set uc=0
set viminfo='30,<0,f1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.c,*.h,*.nc match Error /\%80v.\%81v./

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.nc :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.hpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()

augroup filetypedetect
  au! BufRead,BufNewFile *nc setfiletype nc
augroup END
