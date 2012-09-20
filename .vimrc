call pathogen#infect()

set nocompatible

let mapleader=","

"编辑vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>es :e $HOME/.vim/snippets/cpp-algorithm.snippets<CR>
nmap <silent> <leader>em :e $HOME/.vim/acm/scan-and-append.dat<CR>
autocmd! bufwritepost *.vimrc source $MYVIMRC

set nowrap
set updatetime=4000
set wildmenu
set autoindent
set copyindent
set cindent
set smarttab
set smartcase
set lazyredraw
set number
set tags+=~/.vim/cpp_src/tags
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termencoding=utf-8
set noswapfile
set nobackup
set hlsearch
set mouse=a
set shiftwidth=4
set tabstop=4
set foldmethod=marker
set backspace=indent,eol,start
syntax on

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*class
set title

filetype plugin indent on
filetype plugin on

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

"tricks
cmap w!! w !sudo tee % > /dev/null
nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR>
autocmd BufNewFile,BufRead *.cpp,*.tex set makeprg=make\ %:t:r
map <Up> gk
map <Down> gj
set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.
imap ,; std:

colo elflord

"set vimwiki path
let g:vimwiki_use_mouse=1
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'path_html': '~/Dropbox/vimwiki/html',
			\ 'nested_syntaxes': {'c++': 'cpp'} } ]
"			\ 'html_header': '~/Dropbox/vimwiki/template/header.tpl', 

"autorun
let b:C_CmdLineArgs=' <in'
map <F8> :NERDTree<CR>
nmap <F7> :TagbarToggle<CR>


map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q %<CR>

"command! -range -nargs=* Google call eclim#web#SearchEngine('http://www.google.com/search?q=<query>', <q-args>, <line1>, <line2>)

"doxygen
let g:DoxygenToolkit_authorName="chyx"
let g:DoxygenToolkit_briefTag_funcName="yes"

"ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

"jflex
augroup filetype
  autocmd BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
autocmd Syntax jflex    source ~/.vim/syntax/jflex.vim

"jQuery
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

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

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd! CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif

function! Put_problem_rst()
	execute "normal i=============="
	execute "normal o=============="
	execute "normal o"
	execute "normal oInput"
	execute "normal o====="
	execute "normal o"
	execute "normal oOutput"
	execute "normal o======"
	execute "normal o"
	execute "normal oSample Input"
	execute "normal o============"
	execute "normal o"
	execute "normal oSample Output"
	execute "normal o============="
	execute "normal ggo"
endfunction
autocmd! BufNewFile *.rst call Put_problem_rst()

"-------------------------------------------------------------------------------
" comma always followed by a space
"-------------------------------------------------------------------------------
"inoremap  ,  ,<Space>
"
"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
""
"vnoremap ( s()<Esc>P<Right>%
"vnoremap [ s[]<Esc>P<Right>%
"vnoremap { s{}<Esc>P<Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
"xnoremap  '  s''<Esc>P<Right>
"xnoremap  "  s""<Esc>P<Right>
"xnoremap  `  s``<Esc>P<Right>
"

