"Install pathogen.vim:
"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

"Install vim-node
"mkdir -p ~/.vim/bundle/node
"git clone https://github.com/moll/vim-node.git ~/.vim/bundle/node

"Install tabularize
"mkdir -p ~/.vim/bundle
"cd ~/.vim/bundle
"git clone git://github.com/godlygeek/tabular.git

"Install JSHint
"cd ~/
"npm install jshint
"sudo npm install -g jshint
"git clone https://github.com/Shutnik/jshint2.vim ~/.vim/bundle/jshint2

"Install YouCompleteMe + Tern
"See https://github.com/Valloric/YouCompleteMe
"Somthing like this:
"cd ~/.vim/bundle
"git clole https://github.com/Valloric/YouCompleteMe
"cd YouCompleteMe
"git submodule update --init --recursive
"./install.py --js-completer
"
"Also, don't forget to create a .tern-project file in the root directory of
"your JavaScript project, containing
"{
"    "plugins": {
"        "node": {}
"    }
"}
"

set tabstop=2
set shiftwidth=2
set smarttab
set et

set wrap

set ai
set cin

set showmatch
set hlsearch
set incsearch
set ignorecase

set lz

set listchars=tab:··
set list

"key mapings
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"no error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Send more characters for redraws
set ttyfast

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

"JSHint options
let jshint2_command = '/home/coder/node_modules/jshint/bin/jshint'
let jshint2_read = 1
let jshint2_save = 1

"YouCompleteMe options
let g:ycm_autoclose_preview_window_after_completion = 1
"Color scheme
colo ok

execute pathogen#infect()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
