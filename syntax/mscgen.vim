" Vim syntax file
" Language:     mscgen
" Maintainer:   Dave Goodell <davidjgoodell@gmail.com>
" Last Change:  2016 Aug 27
" loosely derived from conf.vim and c.vim in the Vim distribution
" mscgen is documented here:
"   http://www.mcternan.me.uk/mscgen/
"
" This version is simple and only attempts to highlight strings, comments,
" valid arrows/boxes, attributes, and global options.  It could be made more
" robust to try to show erroneous constructs or distinguish between the left
" and right sides of a ':', though that would probably be overkill.

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match       mscgenSpecial  display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match       mscgenSpecial  display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn keyword     mscgenTodo     contained TODO FIXME XXX
" Avoid matching "text#text"
syn match       mscgenComment  "^#.*" contains=mscgenTodo
syn match       mscgenComment  "\s#.*"ms=s+1 contains=mscgenTodo
syn match       mscgenComment  "//.*" contains=mscgenTodo
syn region      mscgenComment  start="/\*" end="\*/" contains=mscgenTodo

syn region      mscgenString   start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline contains=mscgenSpecial
syn region      mscgenString   start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline contains=mscgenSpecial
syn keyword     mscgenKeyword  hscale arcgradient width wordwraparcs

" signal
syn match       mscgenArrow    "<->\|->\|<-\|--"
" method
syn match       mscgenArrow    "<=>\|=>\|<=\|=="
" return
syn match       mscgenArrow    "<<>>\|>>\|<<\|\.\."
" callback
syn match       mscgenArrow    "<<=>>\|=>>\|<<="
" lost
syn match       mscgenArrow    "-x\|x-"
" emphasized
syn match       mscgenArrow    "<:>\|:>\|<:\|::"
" empty/comment/omitted
syn match       mscgenArrow    "|||\|---\|\.\.\."
" boxes
syn keyword     mscgenBox      box abox rbox note
syn keyword     mscgenKeyword  msc
syn keyword     mscgenAttribute label URL ID IDURL arcskip linecolour linecolor textcolour textcolor textbgcolour textbgcolor arclinecolour arclinecolor arctextcolour arctextcolor arctextbgcolour arctextbgcolor

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link mscgenComment      Comment
hi def link mscgenTodo Todo
hi def link mscgenString       String
hi def link mscgenArrow        Keyword
hi def link mscgenBox          Keyword
hi def link mscgenKeyword      Keyword
hi def link mscgenAttribute    Keyword
hi def link mscgenSpecial      Special

let b:current_syntax = "mscgen"

" vim: ts=8 sw=2 et :
