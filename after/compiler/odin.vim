" Vim compiler file
let current_compiler = "odin"
let s:keepcpo= &cpo
set cpo&vim

CompilerSet errorformat=%f(%l:%c)\ %m
CompilerSet makeprg=odin\ build\ %:p:h

let &cpo = s:keepcpo
unlet s:keepcpo
