" Vim syntax file
" Language:     msgenny
" Maintainer:   Dave Goodell <davidjgoodell@gmail.com>
" Last Change:  2016 Aug 27
" loosely derived from conf.vim and c.vim in the Vim distribution
" msgenny is documented here:
"   https://github.com/sverweij/mscgen_js/blob/master/wikum/msgenny.md
"
" This version is simple and only attempts to highlight strings, comments,
" valid arrows/boxes, and global options.  It could be made more robust to try
" to show erroneous constructs or distinguish between the left and right sides
" of a ':', though that would probably be overkill.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match       msgennySpecial  display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match       msgennySpecial  display contained "\\\(u\x\{4}\|U\x\{8}\)"
syn keyword     msgennyTodo     contained TODO FIXME XXX
" Avoid matching "text#text"
syn match       msgennyComment  "^#.*" contains=msgennyTodo
syn match       msgennyComment  "\s#.*"ms=s+1 contains=msgennyTodo
syn match       msgennyComment  "//.*" contains=msgennyTodo
syn region      msgennyComment  start="/\*" end="\*/" contains=msgennyTodo
syn region      msgennyString   start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=msgennySpecial
syn region      msgennyString   start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline contains=msgennySpecial
syn keyword     msgennyKeyword  hscale arcgradient width wordwraparcs watermark

" signal
syn match       msgennyArrow    "<->\|->\|<-\|--"
" method
syn match       msgennyArrow    "<=>\|=>\|<=\|=="
" return
syn match       msgennyArrow    "<<>>\|>>\|<<\|\.\."
" callback
syn match       msgennyArrow    "<<=>>\|=>>\|<<="
" lost
syn match       msgennyArrow    "-x\|x-"
" emphasized
syn match       msgennyArrow    "<:>\|:>\|<:\|::"
" empty/comment/omitted
syn match       msgennyArrow    "|||\|---\|\.\.\."
" boxes
syn keyword     msgennyBox      box abox rbox note
syn keyword     msgennyInlineExpr alt opt exc break seq strict neg critical consider ignore assert loop ref

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link msgennyComment      Comment
hi def link msgennyTodo Todo
hi def link msgennyString       String
hi def link msgennyArrow        Keyword
hi def link msgennyBox          Keyword
hi def link msgennyKeyword      Keyword
hi def link msgennySpecial      Special
hi def link msgennyInlineExpr   Keyword

let b:current_syntax = "msgenny"

" vim: ts=8 sw=2 et :
