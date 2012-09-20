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
abbreviate cout std::cout
abbreviate cerr std::cerr
abbreviate endl std::endl
abbreviate maxn MAXN

function! ScanAndAppend()
	execute "w"
	let l:cmd = $HOME . "/.vim/acm/scan-and-append.rb"
	let l:dat = $HOME . "/.vim/acm/scan-and-append.dat"
	let l:signature = '//By chyx111'
	execute '%!ruby ' . l:cmd . " % '" . l:signature . "' " . l:dat
	execute "redraw!"
	execute "w"
	let l:has_in_has_name = 'if [ -f %:t:r.in ] && [ -f %:t:r ]; then ./%:t:r < %:t:r.in; '
	let l:no_in_has_name = 'elif [ -f %:t:r ]; then ./%:t:r; '
	let l:has_in_no_name = 'elif [ -f %:t:r.in ]; then ./a.out < %:t:r.in; '
	let l:no_in_no_name = 'else ./a.out; fi'
	execute "!make %:t:r && " . l:has_in_has_name . l:no_in_has_name . l:has_in_no_name . l:no_in_no_name
	"execute "!make %:t:r && if [ -f %:t:r.in ] && [ -f %:r:r ]; then ./%:t:r < %:t:r.in; elif [ -f %:t:r ]; then ./%:t:r; elif [ -f %t:r.in ]; then ./a.out < %t%r.in; else ./a.out; fi"
endfunc

func! SetTitle()
	let flags = "w"
	if search("\t",flags) != 0 || search(" ", flags) != 0
		call ScanAndAppend()
		return
	endif
	let keystr = "//By chyx111"

	let l = 0
	"let l = l + 1 | call setline(l, "Created Time:  ".strftime("%c"))
	"let l = l + 1 | call setline(l, "File Name: ".expand("%"))
	let l = l + 1 | call setline(l, "")
	let l = l + 1 | call setline(l, keystr)
	let l = l + 1 | call setline(l, "")
	let l = l + 1 | call setline(l, "int main()")
	let l = l + 1 | call setline(l, "{")
	let l = l + 1 | call setline(l, "\t")
	let l = l + 1 | call setline(l, "\treturn 0;")
	let l = l + 1 | call setline(l, "}")
	let l = l + 1 | call setline(l, "")
endfunc

map <F5> :call SetTitle()<CR>
