" Forked from https://github.com/Tetralux/odin.vim,
" which was derived from https://github.com/jansedivy/jai.vim
" License: MIT (see LICENSE file)

if exists("b:current_syntax")
  finish
endif

" == Definitions == {{{

" Keywords {{{
syntax keyword odinKeyword
      \ package
      \ import
      \ proc
      \ foreign
      \ const
      \ context
      \ distinct
      \ using
      \ cast auto_cast transmute
      \ asm

syntax match odinGetInfoOf "\v(size_of|offset_of|type_info_of|typeid_of|type_of|align_of)\ze\("

" NOTE: Optional, disabled by default to match Sublime's highlighting
" syntax match odinBuiltinProc "\v(len|cap|swizzle|complex|quaternion|real|imag|jmag|kmag|conj)\ze\("
" syntax match odinBuiltinProc "\v(expand_values|compress_values|min|max|abs|clamp)\ze\("
" syntax match odinBuiltinProc "\v(soa_zip|soa_unzip|unreachable|raw_data)\ze\("
" }}}

" Directives and Attributes {{{
syntax match odinBuildTag "^#+.*$" contains=odinLineComment, odinBlockComment
syntax match odinDirective "#\<\w\+\>" display
syntax match odinAttributeShort "\v\@<\w+>" display
syntax region odinAttribute matchgroup=odinAttributeShort start="@(\s\?\w\+\s*)\@=" end="\s*)" display
syntax region odinAttribute matchgroup=odinAttributeParens start="@(" end=")" display contains=TOP
" }}}

" Procedures {{{
syntax match odinProcDeclaration "\v<\w*>(\s*:\s*:\s*(#.*\s*)?proc)@=" display
syntax match odinProcCall "\v\w+\s*(\()@=" display contains=odinBuiltinProc
" }}}

" Control flow {{{
syntax keyword odinMainControl if else when where do defer return
syntax keyword odinSwitchControl switch case continue break fallthrough
syntax keyword odinOrUnderscore or_return or_else or_break or_continue
syntax keyword odinFor for
" }}}

" Types {{{
syntax keyword odinBasicType
      \ bool b8 b16 b32 b64
      \ int i8 i16 i32 i64 i128
      \ uint u8 u16 u32 u64 u128 uintptr byte
      \ i16le i32le i64le i128le u16le u32le u64le u128le
      \ i16be i32be i64be i128be u16be u32be u64be u128be
      \ f16 f32 f64 f16le f32le f64le f16be f32be f64be
      \ complex32 complex64 complex128 quaternion64 quaternion128 quaternion256
      \ rune string cstring rawptr typeid byte any

syntax keyword odinAdvancedType struct enum union map bit_set bit_field dynamic matrix
" }}}

" Numbers {{{
syntax match odinNumber "\v<\d(\d|_)*(\.\d(\d|_)*)?([eE][+-]?\d+)?[ijk]?>" display
syntax match odinBin "\v<0b[01]+%(_[01]+)*[ijk]?>" display
syntax match odinOct "\v<0o[0-7]+%(_[0-7]+)*[ijk]?>" display
syntax match odinDec "\v<0d\d+%(_\d+)*[ijk]?>" display
syntax match odinHex "\v<0[xXh]\x+%(_\x+)*[ijk]?>" display
" }}}

" Constants {{{
syntax keyword odinBool true false
syntax keyword odinNil nil
syntax match odinNoInit "---"
syntax match odinCompileTime "$\<\w\+\>" display

" NOTE: Optional, disabled by default to reduce noise.
"       This highlights any label left of `::` (or `: type :`) as a Constant,
"       with the exception of proc declarations.
" syntax match odinUserConst "\w*\ze\s*:\s*\w*\s*:" contains=odinProcDeclaration
" }}}

" Strings {{{
syntax region odinRawString start=+`+ end=+`+
syntax region odinChar start=+'+ skip=+\\\\\|\\'+ end=+'+
syntax region odinString start=+"+ skip=+\\\\\|\\'+ end=+"+ keepend contains=odinEscape, odinFmtSpec
syntax match odinEscape display contained "\\\([abefnrtv\\'"]\|x\x\{2}\|u\x\{4}\|U\x\{8}\|[0-7]\{3}\)"

" C and Python style format specifiers for Odin core:fmt
" NOTE: Optional, disabled by default to match Sublime.
"       Also likely to incorrectly highlight strings that are used outside of Odin's fmt package.
" syntax region odinFmtSpec start="%" end="[vwTtbcrodizxXUmMeEfFgGhHsqp]" contained
" syntax region odinFmtSpec start="{" end="[{}]" contained
" syntax match odinFmtSpec "%%\|{{\|}}" contained
" }}}

" Operators {{{
syntax keyword odinInNotIn in not_in

syntax match odinArithmeticOp "+\|\*\|/\|%\|-\|!" display contains=odinNoInit
syntax match odinBinaryOp "!\|\~\||\|&" display
syntax match odinComparison "\V==\|!=\|<\|<=\|>\|>=\|%%\|||" display

syntax match odinDeclaration "\:\:\?" display
syntax match odinDeclAssign ":=" display
syntax match odinAssign "=" display
syntax match odinAddressOf "&\ze\w" display
syntax match odinPointer "\^" display

syntax match odinReturnOp "->" display
syntax match odinTernaryQMark "?" display
syntax match odinArrayQMark "\[\zs?\ze\]" display
syntax match odinTypeQMark "\.\zs?" display
syntax match odinVariadic "\V...\?" display
syntax match odinRange "\V..=\|..<" display
syntax match odinExpandOp "\V**" display

" NOTE: Optional, disabled by default to reduce noise
" syntax match odinSemicolon ";" display
" syntax match odinComma "," display
" syntax match odinPeriod "\v\.%([0-9])@!" display
" syntax match odinArrayBrackets "\[\|\]" display
" }}}

" Comments {{{
syntax keyword odinCommentNote NOTE TODO XXX FIXME HACK contained
syntax match odinShebangComment "^#!.*$" display " for running Odin files as a Unix script
syntax region odinLineComment start="\/\/" end="$" contains=odinCommentNote, odinCommentNote
syntax region odinBlockComment start="\v\/\*" end="\v\*\/" contains=odinBlockComment, odinCommentNote
syntax sync ccomment odinBlockComment
" }}}
" }}} == Definitions END ==

" == Links == {{{

" Keywords {{{
highlight def link odinKeyword Keyword
highlight def link odinGetInfoOf Keyword
highlight def link odinBuiltinProc Keyword
" }}}

" Directives and Attributes {{{
highlight def link odinBuildTag Macro
highlight def link odinDirective Macro
highlight def link odinAttributeShort Macro " e.g. @foo or @(foo)
highlight def link odinAttributeParens Macro " only the @( and ) are highlighted for @(foo=bar) or @(foo=bar, baz=qux)

" NOTE: Optional, disabled by default to match Sublime's highlighting.
"       When enabled, the entire AttributeParens will be highlighted as Macro.
" highlight def link odinAttribute Macro
" }}}

" Procedures {{{
highlight def link odinProcDeclaration Function
highlight def link odinProcCall Function
" }}}

" Control flow {{{
highlight def link odinMainControl Conditional
highlight def link odinSwitchControl Conditional
highlight def link odinOrUnderscore Conditional
highlight def link odinFor Repeat
" }}}

" Types {{{
highlight def link odinBasicType Type
highlight def link odinAdvancedType Structure
" }}}

" Numbers {{{
highlight def link odinNumber Number
highlight def link odinBin Number
highlight def link odinOct Number
highlight def link odinDec Number
highlight def link odinHex Number
" }}}

" Constants {{{
highlight def link odinBool Boolean
highlight def link odinNil Constant
highlight def link odinNoInit Constant
highlight def link odinCompileTime Constant

highlight def link odinUserConst Constant
" }}}

" Strings {{{
highlight def link odinRawString String
highlight def link odinString String
highlight def link odinChar String
highlight def link odinEscape SpecialChar
highlight def link odinFmtSpec SpecialChar
" }}}

" Operators {{{
highlight def link odinInNotIn Operator

highlight def link odinArithmeticOp Operator
highlight def link odinBinaryOp Operator
highlight def link odinComparison Operator

highlight def link odinDeclaration Operator
highlight def link odinDeclAssign Operator
highlight def link odinAssign Operator
highlight def link odinAddressOf Operator
highlight def link odinPointer Operator

highlight def link odinReturnOp Operator
highlight def link odinTernaryQMark Operator
highlight def link odinArrayQMark Operator
highlight def link odinTypeQMark Operator
highlight def link odinVariadic Operator
highlight def link odinRange Operator
highlight def link odinExpandOp Operator

highlight def link odinComma Operator
highlight def link odinSemicolon Operator
highlight def link odinPeriod Operator
highlight def link odinArrayBrackets Operator
" }}}

" Comments {{{
highlight def link odinCommentNote Todo
highlight def link odinShebangComment Comment
highlight def link odinLineComment Comment
highlight def link odinBlockComment Comment
" }}}
" }}} == Links END ==

let b:current_syntax = "odin"
" vim: set foldmethod=marker:
