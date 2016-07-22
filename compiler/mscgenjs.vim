if exists("current_compiler")
  finish
endif
let current_compiler = "mscgenjs"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" error format we are matching:
"----8<----
"mscgenjs --input-type msgenny --output-type png -o spec/diag/mr1.png spec/diag/mr1.msgenny
"
"  syntax error on line 45, column 1:
"  Expected ",", ";", comment, lineend or whitespace but "a" found.
"
"make: *** [spec/diag/mr1.png] Error 1
"----8<----
" unfortunately the compiler doesn't emit a %f for us, but we'll survive
" somehow
CompilerSet errorformat=%E\ \ syntax\ error\ on\ line\ %l\\,\ column\ %c:,%Z%m

" this version is easier to read but doesn't respect CompilerSet behavior:
"let &l:efm  = '%E  syntax error on line %l\, column %c:' . ','
"let &l:efm .= '%Z%m'
