filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarick/Vundle.vim'

" General
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/YankRing.vim'
" for snipmate (run :BundleInstall)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'bling/vim-airline'

Plugin 'gerw/vim-HiLinkTrace'  " trace syntax highlighting

" python
Plugin 'nvie/vim-flake8'

" html
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" clojure
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'

" rust
Plugin 'wting/rust.vim'

" js
Plugin 'Shutnik/jshint2.vim'

" Go
Plugin 'fatih/vim-go'

" themes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

set backup
set swapfile
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

colorscheme Monokai-Refined
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nocompatible
set autoindent
set smartindent		" умный автоотступ
set ignorecase		" игнорировать регистр при поиске
syntax on
" set number
set incsearch		" прокручивать к найденому в процесе набора поискового запроса
set hlsearch		" подсветка искомого выражения
set showmatch
set linebreak		" перенос строк по словам, а не по буквам
set wildmenu
set backspace=indent,eol,start
set wildignore=*.pyc,*.pyo,.git,*.class,*~,#*#,*.egg-info
set wildignore+=*/env-docker/*
set wildignore+=*/target/*
set wildignore+=*/node_modules/*
set wildignore+=*/resources/public/js/*
set wildignore+=*/resources/public/dev-js/*
set gdefault  " default /g in regexps
set hidden
" set relativenumber
set undofile
" vertical diff by default
set diffopt+=vertical

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,№#

" LEADER MAPPINGS

let mapleader = ","
let g:pep8_map = '<leader>8'
let g:ctrlp_match_window_reversed = 0
map <silent> <leader>td <Plug>TaskList
map <silent> <leader>u :GundoToggle<CR>
map <silent> <leader>n :NERDTreeToggle<CR>
map <leader>j :JSHint<CR>
nmap <leader>a <Esc>:Ack!
" open .vimrc in vsplit window
nnoremap <leader>ev <C-w><C-v><C-w><C-l>:e $MYVIMRC<cr>
" kill search highlighting
nnoremap <silent> <leader><space> :noh<cr>
" toggle invisible chars
nmap <silent> <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
" toggle spellcheck
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

nmap <silent> <leader>0 :only<CR>

" copy current filename to clipboard
nmap <silent> <leader>f :let @+ = expand("%")<CR>
" copy current filename:line to clipboard
nmap <silent> <leader>fn :let @+ = expand("%") . ":" . line(".")<CR>
" paste from clipboard
nmap <silent> <leader>p "+p
nmap <silent> <leader>P "+P
vmap <silent> <leader>p "+p
" yank to clipboard
vmap <silent> <leader>y "+y
nmap <silent> <leader>y "+y

" remove trailing spaces
nmap <leader>ts :%s/\s\+$//e<CR>:noh<CR>

" nmap <Space> <C-D>


" BUFFERS

"nmap <C-Tab> :bn!<CR>
"nmap <C-S-Tab> :bp!<CR>
"imap <C-Tab> <Esc>:bn!<CR>
"imap <C-S-Tab> <Esc>:bp!<CR>
nmap <F2> :CtrlPBuffer<CR>
nmap <F3> :ls<CR>:b<Space>


" SPLIT WINDOWS

" nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" split window size
nmap + <C-w>+
nmap - <C-w>-
nmap _ <C-w>-
nmap <C-q> <C-w>q


" TEXT

" tweak movements
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" restore selection after indentation command in visual mode
vmap > >gv
vmap < <gv


" command-line mode aliases
:ca WQ wq
:ca Wq wq
:ca W w
:ca Q q
:ca Q q
:ca E e
:ca Qa qa
:ca QA qa


" FILETYPE RELATED

if has("autocmd")
  " Syntax highlighting
  au BufRead,BufNewFile *.go set filetype=go
  au BufRead,BufNewFile *.less set filetype=css
  au BufRead,BufNewFile *.js set ft=javascript syntax=jquery
  au BufRead,BufNewFile *.html set ft=htmldjango
  au BufRead,BufNewFile *.md set ft=markdown
  au BufRead,BufNewFile *.cljs set filetype=clojure
  au BufRead,BufNewFile *.boot set filetype=clojure
  " remove all trailing whitespace on file save
  " autocmd BufWritePre *.py,*.html,*.less,*.js,*.sml,*.clj :%s/\s\+$//e
  " autoreload vim configuration on save
  autocmd BufWritePost .vimrc source $MYVIMRC
  autocmd BufWritePost .gvimrc source $MYGVIMRC

  " fix html indentation
  " see http://www.morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files/
  autocmd FileType html setlocal indentkeys-=*<Return>

  " om.dom indentation (see 'om.dom/tags list)
  autocmd FileType clojure setlocal lispwords+=a,abbr,address,area,article,aside,audio,b,base,bdi,bdo,big,blockquote,body,br,button,canvas,caption,cite,code,col,colgroup,data,datalist,dd,del,details,dfn,dialog,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,head,header,hr,i,iframe,img,ins,kbd,keygen,label,legend,li,link,main,mark,menu,menuitem,meta,meter,nav,noscript,object,ol,optgroup,output,p,param,picture,pre,progress,q,rp,rt,ruby,s,samp,script,section,small,source,span,strong,style,sub,summary,sup,table,tbody,td,tfoot,th,thead,time,title,tr,track,u,ul,var,video,wbr,circle,clipPath,ellipse,g,line,mask,path,pattern,polyline,rect,svg,text,defs,linearGradient,polygon,radialGradient,stop,tspan,use
  " Om components lifecycle methods indentation
  autocmd FileType clojure setlocal lispwords+=query,ident,render,params
  " compojure verbs
  autocmd FileType clojure setlocal lispwords+=GET,POST,PUT,DELETE,OPTIONS,ANY,context
endif


" PLUGINS

let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
let g:NERDTreeWinPos = "right"
let g:pyflakes_use_quickfix = 0
let g:ackprg=" ack-grep -H --nocolor --nogroup --column"

let g:paredit_smartjump = 1
let g:paredit_mode = 1

let g:yankring_replace_n_pkey = '<C-\>'

let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2


function! ToggleFullscreen()
  exec('silent !wmctrl -r :ACTIVE: -b toggle,fullscreen')
  exec('set lines=50')
  exec('set columns=160')
endfunction

nnoremap <F11> :call ToggleFullscreen()<CR>
inoremap <F11> :call ToggleFullscreen()<CR>

if has('gui_running')
  syntax on
  " colorscheme molokai
  " colorscheme codeschool
  " colorscheme min
  colorscheme jet
  set columns=95
  set lines=25

  " turn off menu
  set guioptions-=m
  set guioptions-=T
  " turn off gui tabs
  set guioptions-=e
  " turn off scrollbars
  set guioptions-=l
  set guioptions-=L
  set guioptions-=l
  set guioptions-=r
  set guioptions-=b

  " turn off cursor blinking
  set guicursor+=a:blinkon0

  " set guifont=Terminus\ 13
  " set guifont=Inconsolata\ 12
  " set guifont=Droid\ Sans\ Mono\ 12
  " set guifont=Ubuntu\ Mono\ 14
  " set guifont=Anonymous\ Pro\ 14
  " set linespace=7
  set guifont=Fira\ Mono\ 14
  set linespace=3
endif
