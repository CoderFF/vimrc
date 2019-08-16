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

"Install ALE+ESLint
"npm install eslint-plugin-prettier --save-dev
"npm install prettier --save-dev
"Install ALE
"cd ~/.vim/bundle
"git clone https://github.com/w0rp/ale.git

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
"Install sleuth(detects indent)
"cd ~/.vim/bundle/
"git clone https://github.com/tpope/vim-sleuth

set tabstop=2
set shiftwidth=2 " this is an indent width
 
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

" set ident on
if has("autocmd")
  filetype plugin indent on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
"let jshint2_command = '/home/coder/node_modules/jshint/bin/jshint'
"let jshint2_read = 1
"let jshint2_save = 1

"YouCompleteMe options
let g:ycm_autoclose_preview_window_after_completion = 1
"Color scheme
syntax on
colorscheme monokai

execute pathogen#infect()

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" VIM-Javascript conceal characters
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1

"highlight Conceal guifg=#ff0000 guibg=#00ff00 ctermfg=4* ctermbg=NONE
highlight Conceal ctermfg=1* ctermbg=NONE

" map leader (the '\' button) to toggle concealing
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" VIM-Javascript Done

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" From insert mode too
inoremap <silent> <C-l> <Esc>:nohl<CR><C-l>i

" Prevents Insert from cycling between insert mode and replace mode
nnoremap <Insert> i
inoremap <Insert> <Nop>

" Binds Alt+Insert to enter replace mode.
nnoremap <A-Insert> R

" Bindings for run and debug from VIM
nnoremap <F2> <Esc>:w<CR>:!npm run vim-run<enter>
inoremap <F2> <Esc>:w<CR>:!npm run vim-run<enter>

nnoremap <F3> <Esc>:w<CR>:!npm run vim-inspect-brk<enter>
inoremap <F3> <Esc>:w<CR>:!npm run vim-inspect-brk<enter>

nnoremap <F4> <Esc>:w<CR>:!npm run vim-inspect<enter>
inoremap <F4> <Esc>:w<CR>:!npm run vim-inspect<enter>

nnoremap <F5> <Esc>:w<CR>:!npm run vim-test --silent<enter>
inoremap <F5> <Esc>:w<CR>:!npm run vim-test --silent<enter>


" Disable YouCompleteMe on SQL files
let g:ycm_filetype_blacklist = { 'sql': 1 }

"ALE + ESLint config
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}

"let g:ale_linters_explicit = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

"-- FOLDING --
set foldmethod=indent "indentation specify folds
set foldignore='#/*'
set foldminlines=3 "minimum lines to fold is 3 cause it make no sense to fold less
"set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=1 "start file with all folds closed(lvl 1)
"set foldlevelstart=99 "start file with all folds opened

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    let displayline = matchstr(line, '\s\+') . '… ' . foldedlinecount . ' lines …'
    let fillcharcount = windowwidth - strdisplaywidth(displayline)
    return displayline . repeat(" ", fillcharcount)
endfunction " }}}
set foldtext=MyFoldText()

"save and remember folds automatically
set viewoptions-=options
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

"map keys
"Shift + Left Arrow closes fold
"Shift + Right Arrow opens fold
"Shift + Up&Down navigates between folds
"Ctrl + Arrows and Alt + Arrows do nothing
"F1 toggle foldcolumn
"nnoremap <silent> <F1> :if &foldcolumn <Bar> set foldcolumn=0 <Bar> else set foldcolumn=1 <Bar> endif
nnoremap <silent> <F1> :if &foldcolumn <Bar> set foldcolumn=0 <Bar> else <Bar> set foldcolumn=1 <Bar> endif<CR>
nnoremap <S-F1> :set foldlevel=1<CR>
nnoremap <S-Left> zc
inoremap <S-Left> <C-O>zc
nnoremap <S-Right> zO
inoremap <S-Right> <C-O>zO
" Shift-Up Shift-Down
nnoremap <S-Up> zk
inoremap <S-Up> <C-O>zk
nnoremap <S-Down> zj
inoremap <S-Down> <C-O>zj
" modified arrow keys do bad things by default
" Ctrl-(Up, Down, Left, Right)
noremap <C-Up> <Nop>
noremap! <C-Up> <Nop>
noremap <C-Down> <Nop>
noremap! <C-Down> <Nop>
noremap <C-Left> <Nop>
noremap! <C-Left> <Nop>
noremap <C-Right> <Nop>
noremap! <C-Right> <Nop>
" Alt-(Left, Right)
noremap <M-Left> <Nop>
noremap! <M-Left> <Nop>
noremap <M-Right> <Nop>
noremap! <M-Right> <Nop>

autocmd BufNewFile,BufRead *.volt set syntax=html
