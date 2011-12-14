" Include java syntax {{{
if version >= 600
	runtime! syntax/java.vim
	unlet b:current_syntax 
else
	so $VIMRUNTIME/syntax/java.vim
endif
"}}}

