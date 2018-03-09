set nocompatible
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set nu!
set hlsearch
set tabstop=4
set expandtab
set cindent shiftwidth=4
set autoindent shiftwidth=4
set smarttab
set comments=://
set comments=s1:/*,mb:*,ex0:/
set tags=./tags,./../tags,./**/tags
set fileformats=unix,dos
map <Up> gk
map <Down> gj
set cmdheight=1
set titlelen=150
set incsearch

syntax enable
syntax on

colorscheme evening

if has("cscope")
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

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1 

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 
nmap cw :cw <cr>

filetype plugin indent on
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>" 


nmap fls :ls<CR>
nmap <C-s> :w <CR><ESC>
nmap <C-s>a :wall <CR>

"autocmd BufEnter * lcd %:p:h 
nmap <C-s>i :!/opt/vde/services/instances/vde_latest/bin/vde_tool sync_in %<CR>
nmap <C-s>o :!/opt/vde/services/instances/vde_latest/bin/vde_tool sync_out -Vforce %<CR>
nmap <C-c>o :!/opt/vde/services/instances/vde_latest/bin/vde_tool -Vno_sync cc_co -nc %<CR>

"comment code with slash style
map fi :s/^/\/\//g<CR>,, 
map fo :s/^\/\///g<CR>,,
"comment code with star style
map fxa :s/^\(.*\)$/\/\*\1\*\/<CR>,,
"add star comment
map fxr :s/\/\*\(.*\)\*\//\1/g<CR>,,
nmap ,, : noh <CR>
"add comment
nmap ,a A /*  */<ESC>2hi
" set uc=0
set viminfo='20,<0,f1

" insert #if 0 - #endif around block of code
map ,b mz'aO<Esc>i#if 0 /* by xiaoguo, for test */<Esc>'zo<Esc>i#endif<Esc>

" set directory=~/.vim/temp
" :autocmd BufEnter * call DoWordComplete()

set nocompatible
set backspace=indent,eol,start

