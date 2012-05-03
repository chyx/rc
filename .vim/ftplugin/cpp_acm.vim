" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

function! ScanAndAppend()
endfunc

abbreviate Rep REP
abbreviate forE FORE
abbreviate forI FORI
abbreviate forPair FORPAIR
abbreviate two TWO
abbreviate twoll TWOLL
abbreviate twoLL TWOLL
abbreviate all ALL
