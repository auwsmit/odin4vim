" Vim compiler file
let current_compiler = "odin"
let s:keepcpo= &cpo
set cpo&vim

" NOTE: these are set when the user runs `:compiler odin`
CompilerSet errorformat=%f(%l:%c)\ %m
CompilerSet makeprg=odin\ build\ .

let &cpo = s:keepcpo
unlet s:keepcpo
