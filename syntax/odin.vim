if exists("b:current_syntax")
  finish
endif

syntax keyword odinAsm asm
syntax keyword odinContext context
syntax keyword odinUsing using
syntax keyword odinTransmute transmute
syntax keyword odinCast cast
syntax keyword odinAutoCast auto_cast
syntax keyword odinDistinct distinct
syntax keyword odinOpaque opaque
syntax keyword odinWhere where

syntax keyword odinStruct struct
syntax keyword odinEnum enum
syntax keyword odinUnion union
syntax keyword odinBitField bit_field
syntax keyword odinBitSet bit_set

syntax keyword odinIf if
syntax keyword odinWhen when
syntax keyword odinElse else
syntax keyword odinDo do
syntax keyword odinFor for

syntax keyword odinSwitch switch
syntax keyword odinCase case
syntax keyword odinContinue continue
syntax keyword odinBreak break
syntax keyword odinFallthrough fallthrough

syntax keyword odinSizeOf size_of
syntax keyword odinOffsetOf offset_of
syntax keyword odinTypeInfoOf type_info_of
syntax keyword odinTypeIdOf typeid_of
syntax keyword odinTypeOf type_of
syntax keyword odinAlignOf align_of

syntax keyword odinReturn return
syntax keyword odinDefer defer
syntax keyword odinOrReturn or_return
syntax keyword odinOrElse or_else
syntax keyword odinOrBreak or_break
syntax keyword odinOrContinue or_continue

syntax keyword odinInline #force_inline
syntax keyword odinNoInline #force_no_inline

syntax match odinTodo "TODO"
syntax match odinNote "NOTE"
syntax match odinXXX "XXX"
syntax match odinFixMe "FIXME"
syntax match odinHack "HACK"

syntax keyword odinDataType string cstring bool b8 b16 b32 b64 rune any rawptr f16 f32 f64 f16le f16be f32le f32be f64le f64be u8 u16 u32 u64 u128 u16le u32le u64le u128le u16be u32be u64be u128be uint uintptr i8 i16 i32 i64 i128 i16le i32le i64le i128le i16be i32be i64be i128be int complex complex32 complex64 complex128 quaternion quaternion64 quaternion128 quaternion256 matrix typeid byte
syntax keyword odinBool true false
syntax keyword odinNull nil
syntax keyword odinDynamic dynamic
syntax keyword odinMap map
syntax keyword odinProc proc
syntax keyword odinIn in
syntax keyword odinNotIn not_in
syntax keyword odinImport import
syntax keyword odinExport export
syntax keyword odinForeign foreign
syntax keyword odinConst const
syntax match odinNoinit "---"
syntax keyword odinPackage package
syntax match odinBuildTag "^#+.*$"
syntax match odinShebang "^#!.*$"

syntax region odinRawString start=+`+ end=+`+
syntax region odinChar start=+'+ skip=+\\\\\|\\'+ end=+'+
syntax region odinString start=+"+ skip=+\\\\\|\\'+ end=+"+ contains=odinEscape
syntax match odinEscape display contained /\\\([abefnrtv\\'"]\|x\x\{2}\|u\x\{4}\|U\x\{8}\|[0-7]\{3}\)/

syntax match odinFunctionDecl "\v<\w*>(\s*::\s*(#.*\s*)?proc)@="
syntax match odinFunctionCall "\v\w+\s*(\()@="

syntax match odinTagNote "@\<\w\+\>" display

syntax match odinConstant "\v<[A-Z0-9,_]+>" display
syntax match odinRange "\.\.=\|\.\.<" display
syntax match odinTernaryQMark "?" display
syntax match odinDeclaration "\:\:\?" display
syntax match odinDeclAssign ":=" display
syntax match odinAssign "=" display
syntax match odinReturnOp "->" display

syntax match odinIntFloat '\v<\d(\d|_)*(\.\d(\d|_)*)?([eE][+-]?\d+)?[ijk]?>' display
syntax match odinBin '\v<0b[01]+%(_[01]+)*[ijk]?>' display
syntax match odinOct '\v<0o[0-7]+%(_[0-7]+)*[ijk]?>' display
syntax match odinDec '\v<0d\d+%(_\d+)*[ijk]?>' display
syntax match odinHex '\v<0[xXh]\x+%(_\x+)*[ijk]?>' display

syntax match odinAddressOf "&" display
syntax match odinDeref "\^" display
syntax match odinMaths "+\|-\|\/\|\*\|%" display
syntax match odinCompares "<\|>\||\|!" display
" syntax match odinMiscSymbols ",\|\.\%([0-9]\)\@!\|\[\|\]" display

syntax match odinDirective "#\<\w\+\>" display
syntax match odinTemplate "$\<\w\+\>"

syntax match odinCommentNote "@\<\w\+\>" contained display
syntax region odinLineComment start=/\/\// end=/$/  contains=odinCommentNote, odinTodo, odinNote, odinXXX, odinFixMe, odinHack
syntax region odinBlockComment start=/\v\/\*/ end=/\v\*\// contains=odinBlockComment, odinCommentNote, odinTodo, odinNote, odinXXX, odinFixMe, odinHack
syn sync ccomment odinBlockComment

highlight link odinAsm Keyword
highlight link odinContext Keyword
highlight link odinUsing Keyword
highlight link odinTransmute Keyword
highlight link odinCast Keyword
highlight link odinAutoCast Keyword
highlight link odinDistinct Keyword
highlight link odinOpaque Keyword
highlight link odinWhere Keyword

highlight link odinStruct Structure
highlight link odinEnum Structure
highlight link odinUnion Structure
highlight link odinBitField Structure
highlight link odinBitSet Structure

highlight link odinIf Conditional
highlight link odinWhen Conditional
highlight link odinElse Conditional
highlight link odinDo Keyword
highlight link odinFor Repeat

highlight link odinSwitch Keyword
highlight link odinCase Keyword
highlight link odinContinue Keyword
highlight link odinBreak Keyword
highlight link odinFallthrough Keyword

highlight link odinSizeOf Keyword
highlight link odinOffsetOf Keyword
highlight link odinTypeOf Keyword
highlight link odinTypeInfoOf Keyword
highlight link odinTypeIdOf Keyword
highlight link odinAlignOf Keyword

highlight link odinReturn Keyword
highlight link odinDefer Keyword
highlight link odinOrReturn Keyword
highlight link odinOrElse Keyword
highlight link odinOrBreak Keyword
highlight link odinOrContinue Keyword

highlight link odinInline Keyword
highlight link odinNoInline Keyword

highlight link odinTodo Todo
highlight link odinNote Todo
highlight link odinXXX Todo
highlight link odinFixMe Todo
highlight link odinNoCheckin Todo
highlight link odinHack Todo

highlight link odinDataType Type
highlight link odinBool Boolean
highlight link odinNull Type
highlight link odinDynamic Operator
highlight link odinMap Operator
highlight link odinProc Function
highlight link odinIn Operator
highlight link odinNotIn Operator
highlight link odinImport Keyword
highlight link odinExport Keyword
highlight link odinForeign Keyword
highlight link odinNoinit Keyword
highlight link odinPackage Keyword
highlight link odinBuildTag Macro
highlight link odinShebang Comment

highlight link odinRawString String
highlight link odinString String
highlight link odinChar String
highlight link odinEscape SpecialChar

highlight link odinFunctionDecl Number
highlight link odinFunctionCall Function

highlight link odinTagNote Identifier

highlight link odinConstant Constant
highlight link odinRange Operator
highlight link odinTernaryQMark Operator
highlight link odinDeclaration Operator
highlight link odinDeclAssign Operator
highlight link odinAssign Operator
highlight link odinReturnOp Operator

highlight link odinIntFloat Number
highlight link odinBin Number
highlight link odinOct Number
highlight link odinDec Number
highlight link odinHex Number

highlight link odinAddressOf Operator
highlight link odinDeref Operator
highlight link odinMaths Operator
highlight link odinCompares Operator
highlight link odinMiscSymbols Operator

highlight link odinDirective Macro
highlight link odinTemplate Constant

highlight link odinLineComment Comment
highlight link odinBlockComment Comment
highlight link odinCommentNote Todo

let b:current_syntax = "odin"
