"" Vim syntax file
" Language:         CUP
" Maintainer:       Jon Siddle <jon@trapdoor.org>
" Last Change:      21/3/2007

" Adapted from the jflex syntax file by Gerwin Klein

" Quit when a syntax file was already loaded	{{{
if exists("b:current_syntax")
	finish
endif
"}}}

" Include java syntax {{{
if version >= 600
	runtime! syntax/java.vim
	unlet b:current_syntax 
else
	so $VIMRUNTIME/syntax/java.vim
endif
"}}}

syn cluster cupOptions contains=cupDef,cupClass,cupTerm,cupNonTerm,cupNonTermDef,cupVarLabel,cupOperator,cupCodeInclude,cupComment,cupActionCode

syn region cupStart start="" end="" contains=@cupOptions


syn match cupTerm "\<[A-Z]\+\>" contained
syn match cupNonTerm "\<[a-z]\+\>" contained
syn match cupNonTermDef "^[a-z]\+\>" contained
syn match cupClass "\<[A-Z][a-z]\+\>" contained

syn match cupDef "^package.*$" contained
syn match cupDef "^import.*$" contained
syn match cupDef "^precedence left" contained
syn match cupDef "^precedence right" contained
syn match cupDef "^precedence nonassoc" contained
syn match cupDef "^terminal" contained
syn match cupDef "^non terminal" contained

syn region cupVarLabel matchgroup=cupVarLabelMark start=":" end="\s" contains=cupVar contained
syn match cupVar "[a-z]\+\>" contained

syn match cupOperator "::=" contained

syn region cupCodeInclude matchgroup=cupCodeIncludeMark start="^parser code {:" end=":}" contains=@javaTop contained
syn region cupCodeInclude matchgroup=cupCodeIncludeMark start="^action code {:" end=":}" contains=@javaTop contained
syn region cupCodeInclude matchgroup=cupCodeIncludeMark start="^init code {:" end=":}" contains=@javaTop contained

" take out comments
syn match cupComment "//.*" contained
syn region cupComment start="/\*" end="\*/" contained contains=cupComment

" action code (only after states braces and macro use)
syn region cupActionCode matchgroup=Delimiter start="{:" end=":}" contained contains=@javaTop,cupJavaBraces

" keep braces in actions balanced
syn region cupJavaBraces start="{" end="}" contained contains=@javaTop,cupJavaBraces

" syncing
syn sync clear
syn sync minlines=10

" highlighting
hi link cupOption      Special
hi link cupMacroIdent  Ident
hi link cupOptionError Error
hi link cupComment     Comment
hi link cupOperator    Operator
hi link cupRuleStates  Special
hi link cupDef      Keyword
hi link cupTerm      Macro
hi link cupNonTermDef      Typedef
hi link cupNonTerm      Function
hi link cupVar      Label
hi link cupClass      Type
" hi cupSectionSep guifg=yellow ctermfg=yellow guibg=blue ctermbg=blue gui=bold cterm=bold
hi link cupCodeIncludeMark Delimiter

let b:current_syntax="cup"
" Include java syntax {{{
"if version >= 600
"	runtime! syntax/java.vim
"	unlet b:current_syntax 
"else
"	so $VIMRUNTIME/syntax/java.vim
"endif
"}}}

"syn match Comment "@.*" 
"syn match ksKeyword "\<accel\>" me=e-1
"syn match ksKeyword "\<align\>" me=e-1
"syn match ksKeyword "\<alphachannel\>" me=e-1
"syn match ksKeyword "\<alt\>" me=e-1
"syn match ksKeyword "\<angle\>" me=e-1
"syn match ksKeyword "\<animstart\>" me=e-1
"syn match ksKeyword "\<animstop\>" me=e-1
"syn match ksKeyword "\<ask\>" me=e-1
"syn match ksKeyword "\<assignImages\>" me=e-1
"syn match ksKeyword "\<audiostreamnum\>" me=e-1
"syn match ksKeyword "\<autohide\>" me=e-1
"syn match ksKeyword "\<autoreturn\>" me=e-1
"syn match ksKeyword "\<autowc\>" me=e-1
"syn match ksKeyword "\<backlay\>" me=e-1
"syn match ksKeyword "\<bceil\>" me=e-1
"syn match ksKeyword "\<bfloor\>" me=e-1
"syn match ksKeyword "\<bgamma\>" me=e-1
"syn match ksKeyword "\<bgcolor\>" me=e-1
"syn match ksKeyword "\<bgimage\>" me=e-1
"syn match ksKeyword "\<bgm\>" me=e-1
"syn match ksKeyword "\<bgmopt\>" me=e-1
"syn match ksKeyword "\<bold\>" me=e-1
"syn match ksKeyword "\<buf\>" me=e-1
"syn match ksKeyword "\<button\>" me=e-1
"syn match ksKeyword "\<call\>" me=e-1
"syn match ksKeyword "\<cancelautomode\>" me=e-1
"syn match ksKeyword "\<cancelskip\>" me=e-1
"syn match ksKeyword "\<cancelvideoevent\>" me=e-1
"syn match ksKeyword "\<cancelvideosegloop\>" me=e-1
"syn match ksKeyword "\<canskip\>" me=e-1
"syn match ksKeyword "\<ch\>" me=e-1
"syn match ksKeyword "\<channel\>" me=e-1
"syn match ksKeyword "\<char\>" me=e-1
"syn match ksKeyword "\<checkbox\>" me=e-1
"syn match ksKeyword "\<children\>" me=e-1
"syn match ksKeyword "\<clearsysvar\>" me=e-1
"syn match ksKeyword "\<clearvideolayer\>" me=e-1
"syn match ksKeyword "\<click\>" me=e-1
"syn match ksKeyword "\<clickse\>" me=e-1
"syn match ksKeyword "\<clicksebuf\>" me=e-1
"syn match ksKeyword "\<clickskip\>" me=e-1
"syn match ksKeyword "\<clipheight\>" me=e-1
"syn match ksKeyword "\<clipleft\>" me=e-1
"syn match ksKeyword "\<cliptop\>" me=e-1
"syn match ksKeyword "\<clipwidth\>" me=e-1
"syn match ksKeyword "\<close\>" me=e-1
"syn match ksKeyword "\<cm\>" me=e-1
"syn match ksKeyword "\<color\>" me=e-1
"syn match ksKeyword "\<commmit\>" me=e-1
"syn match ksKeyword "\<copybookmark\>" me=e-1
"syn match ksKeyword "\<copylay\>" me=e-1
"syn match ksKeyword "\<count\>" me=e-1
"syn match ksKeyword "\<countpage\>" me=e-1
"syn match ksKeyword "\<crossingfade\>" me=e-1
"syn match ksKeyword "\<ct\>" me=e-1
"syn match ksKeyword "\<current\>" me=e-1
"syn match ksKeyword "\<cursor\>" me=e-1
"syn match ksKeyword "\<data\>" me=e-1
"syn match ksKeyword "\<dataxp3\>" me=e-1
"syn match ksKeyword "\<default\>" me=e-1
"syn match ksKeyword "\<deffont\>" me=e-1
"syn match ksKeyword "\<defstyle\>" me=e-1
"syn match ksKeyword "\<delay\>" me=e-1
"syn match ksKeyword "\<delete\>" me=e-1
"syn match ksKeyword "\<destlayer\>" me=e-1
"syn match ksKeyword "\<destpage\>" me=e-1
"syn match ksKeyword "\<disablestore\>" me=e-1
"syn match ksKeyword "\<draggable\>" me=e-1
"syn match ksKeyword "\<dx\>" me=e-1
"syn match ksKeyword "\<dy\>" me=e-1
"syn match ksKeyword "\<edge\>" me=e-1
"syn match ksKeyword "\<edgecolor\>" me=e-1
"syn match ksKeyword "\<edit\>" me=e-1
"syn match ksKeyword "\<else\>" me=e-1
"syn match ksKeyword "\<elsif\>" me=e-1
"syn match ksKeyword "\<emb\>" me=e-1
"syn match ksKeyword "\<enabled\>" me=e-1
"syn match ksKeyword "\<end\>" me=e-1
"syn match ksKeyword "\<endhact\>" me=e-1
"syn match ksKeyword "\<endif\>" me=e-1
"syn match ksKeyword "\<endignore\>" me=e-1
"syn match ksKeyword "\<endindent\>" me=e-1
"syn match ksKeyword "\<endlink\>" me=e-1
"hi ksKeyword gui=NONE guifg=#B5A1FF
