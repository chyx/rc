" Only do this when not done yet for this buffer
if exists("b:did_cpp_acm_ftplugin")
	finish
endif
let b:did_cpp_acm_ftplugin = 1

abbreviate Rep REP
abbreviate rep REP
abbreviate forE FORE
abbreviate fore FORE
abbreviate forI FORI
abbreviate fori FORI
abbreviate forPair FORPAIR
abbreviate forpair FORPAIR

function! ScanAndAppend()
	let l:cmd = $HOME . "/.vim/acm/scan-and-append.rb"
	let l:dat = $HOME . "/.vim/acm/scan-and-append.dat"
	let l:signature = '//By chyx111'
	execute '%!ruby ' . l:cmd . " % '" . l:signature . "' " . l:dat
endfunc
map <F4> :call ScanAndAppend()<CR>
