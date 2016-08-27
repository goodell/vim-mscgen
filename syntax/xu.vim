" Vim syntax file
" Language:     mscgen
" Maintainer:   Dave Goodell <davidjgoodell@gmail.com>
" Last Change:  2016 Aug 27
" loosely derived from conf.vim and c.vim in the Vim distribution
" Xù is documented here:
"   https://github.com/sverweij/mscgenjs-core/blob/master/doc/xu.md
"
" This version is simple and only attempts to highlight strings, comments,
" valid arrows/boxes, attributes, and global options.  It could be made more
" robust to try to show erroneous constructs or distinguish between the left
" and right sides of a ':', though that would probably be overkill.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match       xuSpecial  display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match       xuSpecial  display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn keyword     xuTodo     contained TODO FIXME XXX
" Avoid matching "text#text"
syn match       xuComment  "^#.*" contains=xuTodo
syn match       xuComment  "\s#.*"ms=s+1 contains=xuTodo
syn match       xuComment  "//.*" contains=xuTodo
syn region      xuComment  start="/\*" end="\*/" contains=xuTodo

syn region      xuString   start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=xuSpecial
syn region      xuString   start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline contains=xuSpecial
syn keyword     xuKeyword  hscale arcgradient width wordwraparcs watermark

" signal
syn match       xuArrow    "<->\|->\|<-\|--"
" method
syn match       xuArrow    "<=>\|=>\|<=\|=="
" return
syn match       xuArrow    "<<>>\|>>\|<<\|\.\."
" callback
syn match       xuArrow    "<<=>>\|=>>\|<<="
" lost
syn match       xuArrow    "-x\|x-"
" emphasized
syn match       xuArrow    "<:>\|:>\|<:\|::"
" empty/comment/omitted
syn match       xuArrow    "|||\|---\|\.\.\."
" boxes
syn keyword     xuBox      box abox rbox note
syn keyword     xuKeyword  msc xu
syn keyword     xuAttribute label URL ID IDURL arcskip linecolour linecolor textcolour textcolor textbgcolour textbgcolor arclinecolour arclinecolor arctextcolour arctextcolor arctextbgcolour arctextbgcolor
syn keyword     xuInlineExpr alt opt exc break seq strict neg critical consider ignore assert loop ref

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link xuComment      Comment
hi def link xuTodo Todo
hi def link xuString       String
hi def link xuArrow        Keyword
hi def link xuBox          Keyword
hi def link xuKeyword      Keyword
hi def link xuAttribute    Keyword
hi def link xuSpecial      Special
hi def link xuInlineExpr   Keyword

let b:current_syntax = "xu"

" vim: ts=8 sw=2 et :
