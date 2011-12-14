set updatetime=4000
set wildmenu
set autoindent
set cindent
set sm
set lz
set nu
set tags+=~/.vim/cpp_src/tags
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set noswapfile

au BufNewFile,BufRead *.cpp,*.tex set makeprg=make\ %:t:r

"set expandtab

set shiftwidth=4
set tabstop=4
set foldmethod=marker
set bs=2
syntax on
map <Up> gk
map <Down> gj

"set vimwiki path
let g:vimwiki_use_mouse=1
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'path_html': '~/Dropbox/vimwiki/html',
			\ 'nested_syntaxes': {'c++': 'cpp'} } ]
"			\ 'html_header': '~/Dropbox/vimwiki/template/header.tpl', 

"autorun
let b:C_CmdLineArgs=' <in'
map <F8> :NERDTree<CR>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map <C-Left> :bn<CR>
map <C-Right> :bp<CR>
map <C-Y> <Esc>bi<code><Esc>ea</code><Esc>
map <C-tab> :sp

"编辑vimrc
map <silent> <leader>ee :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc

map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q %<CR>

command! -range -nargs=* Google call eclim#web#SearchEngine('http://www.google.com/search?q=<query>', <q-args>, <line1>, <line2>)

"doxygen
let g:DoxygenToolkit_authorName="chyx"
let g:DoxygenToolkit_briefTag_funcName="yes"

"ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

"jflex
augroup filetype
  au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim

"jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

filetype plugin indent on
filetype plugin on

"{{{ ACM FAST GENERATE
map <F5> :call SetTitle()<CR>
func! SetTitle()
	let flags = "w"
	if search("\t",flags) != 0 || search(" ", flags) != 0
		call CR()
		return
	endif
	let keystr = "//By chyx111"

	let l = 0
	"let l = l + 1 | call setline(l, "Created Time:  ".strftime("%c"))
	"let l = l + 1 | call setline(l, "File Name: ".expand("%"))
	let l = l + 1 | call setline(l, "")
	let l = l + 1 | call setline(l, keystr)
	let l = l + 1 | call setline(l, "")
	let l = l + 1 | call setline(l, "int main() {")
	let l = l + 1 | call setline(l, "\t")
	let l = l + 1 | call setline(l, "\treturn 0;")
	let l = l + 1 | call setline(l, "}")
	let l = l + 1 | call setline(l, "")
endfunc

"map <F5> :call CR()<CR>
func! CR()
call AutoFill()
exec "w"
exec "!touch %:t:r.in"<CR>
exec "!make %:t:r && ./%:t:r < %:t:r.in"
endfunc

func! AutoFill()
	let flags = "w"
	let keystr = "//By chyx111"
	if search(keystr,flags)== 0
		return
	endif

	let mylist = [
\		["ll",		"typedef long long ll;"],
\		["u64",		"typedef long long unsigned u64;"],
\		["u32",		"typedef long unsigned u32;"],
\		["pii",		"typedef pair<int,int> pii;"],
\		["checkMax(",	"template<class T> void inline checkMax(T& a, T b){if(a < b) a = b;};"], 
\		["checkMin(",	"template<class T> void inline checkMin(T& a, T b){if(a > b) a = b;};"], 
\		["_ceil_div(",	"template<class A, class B> A _ceil_div(A a, B b){ return (a + b - 1 ) / b ;}"],
\		["Rep(", 	"#define Rep(i,n) for(int n_ = (n), i = 0; i< n_; ++i)"],
\		["forEach(", 	"#define forEach(it,v) for(__typeof__((v).begin()) it = (v).begin(); it != (v).end(); ++it)"],
\		["forElem(", "#define forElem(elem,v) \\", 
\			"for(__typeof__(v.begin()) _it = v.begin(); _it != v.end(); ++_it)\\",
\			"for(int _once=1, _done=0; _once; (!_done) ? (_it=v.end(), --_it) : _it )\\",
\			"for(__typeof__(*_it) & elem = * _it; _once && !(_once=0); _done=1) "],
\		["forEdge(", 	"#define forEdge(i,x) for(int i = \\", "head[x]; i != -1; i = edge[i].next)"],
\		["two(",	"#define two(x) (1<<(x))"],
\		["twoLL(",	"#define twoLL(x) (1LL<<(x))"],
\		["DBG(",	"#define DBG(a) cerr << #a << \": \" << (a) << endl"],
\		["ALL(",	"#define ALL(a) (a).begin(),(a).end()"],
\		["SZ(", 	"#define SZ(a) ((int)(a).size())"],
\		["_getint(",	"inline int _getint", "(int n=0){", 
\				"\tchar c;for(c=getchar();!isdigit(c);c=getchar());for(;isdigit(c);c=getchar())n=n*10+c-'0';return n;",
\				"}"]
\	]

"\		["pair<", "template<typename S, typename T> ostream& operator<<(ostream& os, pair<S,T> p){ return os << \"(\" << p.first << \",\" << p.second << \")\"; };"]

	let i = len(mylist) - 1
	while i >= 0
		if search(mylist[i][0], "w") != 0
			if search(mylist[i][1], flags) == 0
				let l = search(keystr, "w")
				let k = 1
				while k < len(mylist[i])
					call append(l, mylist[i][k])
					let k = k+1
					let l = l+1
				endwhile
			endif
		endif
		let i = i-1
	endwhile

	let mylist = [
\		["iostream", "map", "bitset", "algorithm", "vector", "<string>", "complex", "using namespace std;"],
\		["cerr", "cout", "cin", "#include <iostream>"],
\		["sort", "min", "max", "permutation", "#include <algorithm>"],
\		["isdigit", "#include <cctype>"],
\		["bitset", "#include <bitset>"],
\		["string", "#include <string>"],
\		["assert", "#include <cassert>"],
\		["strlen", "memset", "memcpy", "#include <cstring>"],
\		["scanf", "printf", "getchar", "puts", "gets", "#include <cstdio>"],
\		["queue", "#include <queue>"],
\		["set", "#include <set>"],
\		["map", "#include <map>"],
\		["sin", "cos", "tan", "pow", "#include <cmath>"],
\		["complex", "#include <complex>"],
\		["vector", "#include <vector>"],
\		["accumulate", "#include <numeric>"],
\		["iterator", "#include <iterator>"]
\	]

	let i = len(mylist) - 1
	while i >= 0
		let k = len(mylist[i]) - 2
		while k >= 0 && search(mylist[i][k], flags) == 0
			let k = k - 1
		endwhile
		if k != -1 
			let str2 = mylist[i][len(mylist[i])-1]
			if search(str2, flags) == 0
				call append(0, str2)
			endif
		endif
		let i = i-1
	endwhile
endfunc
"}}}

"snipmate
function! ReloadSnippets( snippets_dir, ft )
	if strlen( a:ft ) == 0 
		let filetype = "_"
	else
		let filetype = a:ft
	endif

	call ResetSnippets()
	call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

set mouse=a
