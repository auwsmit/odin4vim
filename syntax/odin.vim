" Forked from https://github.com/Tetralux/odin.vim,
" which was derived from https://github.com/jansedivy/jai.vim
" License: MIT (see LICENSE file)

if exists("b:current_syntax")
  finish
endif

" == Definitions == {{{

" Keywords {{{
syntax keyword odinPackage package
syntax keyword odinImport import
syntax keyword odinProc proc
syntax keyword odinForeign foreign
syntax keyword odinConst const
syntax keyword odinContext context
syntax keyword odinDistinct distinct
syntax keyword odinUsing using
syntax keyword odinCast cast auto_cast transmute
syntax keyword odinAsm asm

syntax match odinGetInfoOf "\v(size_of|offset_of|type_info_of|typeid_of|type_of|align_of)\ze\("

" NOTE: Optional, disabled by default to match Sublime's highlighting
" syntax match odinBuiltinProc "\v(len|cap|swizzle|complex|quaternion|real|imag|jmag|kmag|conj)\ze\("
" syntax match odinBuiltinProc "\v(expand_values|compress_values|min|max|abs|clamp)\ze\("
" syntax match odinBuiltinProc "\v(soa_zip|soa_unzip|unreachable|raw_data)\ze\("
" }}}

" Directives and Attributes {{{
syntax match odinBuildTag "^#+.*$" display contains=odinLineComment, odinBlockComment
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
syntax keyword odinBasicType string cstring bool b8 b16 b32 b64 rune any rawptr f16 f32 f64 f16le f16be f32le f32be f64le f64be u8 u16 u32 u64 u128 u16le u32le u64le u128le u16be u32be u64be u128be uint uintptr i8 i16 i32 i64 i128 i16le i32le i64le i128le i16be i32be i64be i128be int complex32 complex64 complex128 quaternion64 quaternion128 quaternion256 typeid byte
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

syntax match odinArithmeticOp "+\|\*\|/\|%\|-\|!" contains=odinNoInit
syntax match odinBinaryOp "!\|\~\||\|&" display
syntax match odinComparison "\V==\|!=\|<\|<=\|>\|>=\|%%\|||" display

syntax match odinDeclaration "\:\:\?" display
syntax match odinDeclAssign ":=" display
syntax match odinAssign "=" display
syntax match odinAddressOf "&\ze\w." display
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
syntax match odinShebangComment "^#!.*$" display " for running Odin files as a Unix script
syntax keyword odinCommentNote NOTE TODO XXX FIXME HACK contained
syntax region odinLineComment start="\/\/" end="$"  contains=odinCommentNote, odinCommentNote
syntax region odinBlockComment start="\v\/\*" end="\v\*\/" contains=odinBlockComment, odinCommentNote
syntax sync ccomment odinBlockComment
" }}}
" }}} == Definitions END ==

" == Links == {{{

" Keywords {{{
highlight link odinPackage Keyword
highlight link odinImport Keyword
highlight link odinProc Keyword
highlight link odinForeign Keyword
highlight link odinConst Keyword
highlight link odinContext Keyword
highlight link odinDistinct Keyword
highlight link odinUsing Keyword
highlight link odinCast Keyword
highlight link odinAsm Keyword

highlight link odinGetInfoOf Keyword

highlight link odinBuiltinProc Keyword
" }}}

" Directives and Attributes {{{
highlight link odinBuildTag Macro
highlight link odinDirective Macro
highlight link odinAttributeShort Macro " e.g. @foo or @(foo)
highlight link odinAttributeParens Macro " only the @( and ) are highlighted for @(foo=bar) or @(foo=bar, baz=qux)

" NOTE: Optional, disabled by default to match Sublime's highlighting.
"       When enabled, the entire AttributeParens will be highlighted as Macro.
" highlight link odinAttribute Macro
" }}}

" Procedures {{{
highlight link odinProcDeclaration Function
highlight link odinProcCall Function
" }}}

" Control flow {{{
highlight link odinMainControl Conditional
highlight link odinSwitchControl Conditional
highlight link odinOrUnderscore Conditional
highlight link odinFor Repeat
" }}}

" Types {{{
highlight link odinBasicType Type
highlight link odinAdvancedType Structure
" }}}

" Numbers {{{
highlight link odinNumber Number
highlight link odinBin Number
highlight link odinOct Number
highlight link odinDec Number
highlight link odinHex Number
" }}}

" Constants {{{
highlight link odinBool Boolean
highlight link odinNil Constant
highlight link odinNoInit Constant
highlight link odinCompileTime Constant

highlight link odinUserConst Constant
" }}}

" Strings {{{
highlight link odinRawString String
highlight link odinString String
highlight link odinChar String
highlight link odinEscape SpecialChar
highlight link odinFmtSpec SpecialChar
" }}}

" Operators {{{
highlight link odinInNotIn Operator

highlight link odinArithmeticOp Operator
highlight link odinBinaryOp Operator
highlight link odinComparison Operator

highlight link odinDeclaration Operator
highlight link odinDeclAssign Operator
highlight link odinAssign Operator
highlight link odinAddressOf Operator
highlight link odinPointer Operator

highlight link odinReturnOp Operator
highlight link odinTernaryQMark Operator
highlight link odinArrayQMark Operator
highlight link odinTypeQMark Operator
highlight link odinVariadic Operator
highlight link odinRange Operator
highlight link odinExpandOp Operator

highlight link odinComma Operator
highlight link odinSemicolon Operator
highlight link odinPeriod Operator
highlight link odinArrayBrackets Operator
" }}}

" Comments {{{
highlight link odinShebangComment Comment
highlight link odinCommentNote Todo
highlight link odinLineComment Comment
highlight link odinBlockComment Comment
" }}}
" }}} == Links END ==

let b:current_syntax = "odin"
" vim: set foldmethod=marker:
