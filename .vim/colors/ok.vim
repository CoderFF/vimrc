" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"

highlight Conceal guifg=#ff0000 guibg=#00ff00
" vim: sw=2

hi link jsComment Comment
hi link jsString Function
hi link jsModuleKeyword Normal
hi link jsObjectBraces Comment
hi link jsFlowTypeStatement String
hi jsVariableDef guifg=#174992 guibg=NONE ctermfg=4* ctermbg=NONE 
hi link jsFuncCall jsVariableDef
hi link jsFuncArgs Identifier


