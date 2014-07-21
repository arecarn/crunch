"HEADER{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Maintainer: Ryan Carney
"Repository: https://github.com/arecarn/crunch
"License: WTFPL

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
if exists("g:loaded_crunch")
    firnish
endif
let g:loaded_crunch = 1

let g:crunchMode = 'n'
augroup crunchMode
    autocmd!
    autocmd CursorMoved * let g:crunchMode = mode()
augroup END

"COMMANDS{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* -range=0 -bang Crunch
            \ call crunch#Dev(<count>, <line1>, <line2>, <q-args>, "<bang>")
command! CrunchLine :echoerr "removed: use :[range]Crunch, g={movement}"
command! CrunchBlock :echoerr "removed: use vip:Crunch or g=ip"
"}}}

"OPERATOR "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <unique> <script> <plug>CrunchOperator <SID>CrunchOperator
nnoremap <SID>CrunchOperator :<C-U>set opfunc=crunch#operator<CR>g@
if !hasmapto('<Plug>CrunchOperator')
    nmap <unique> g= <Plug>CrunchOperator
    nmap <unique> g== <Plug>CrunchOperator_
endif

xnoremap <unique> <script> <plug>VisualCrunchOperator  <SID>VisualCrunchOperator
xnoremap <SID>VisualCrunchOperator :<C-U>call crunch#operator(visualmode())<CR>
if !hasmapto('<Plug>VisualCrunchOperator')
    xmap <unique> g= <Plug>VisualCrunchOperator
endif "}}}

"REMOVED MAPPINGS "{{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CrunchLine mapping
if !hasmapto('<Plug>CrunchEvalLine')
    map <unique> <leader>cl <Plug>CrunchEvalLine
endif
noremap <unique> <script> <Plug>CrunchEvalLine <SID>CrunchLine
noremap <SID>CrunchLine :CrunchLine<CR>

"CrunchBlock mapping
if !hasmapto('<Plug>CrunchEvalBlock')
    map <unique> <leader>cb <Plug>CrunchEvalBlock
endif
noremap <unique> <script> <Plug>CrunchEvalBlock <SID>CrunchBlock
noremap <SID>CrunchBlock :CrunchBlock<CR>
"}}}

" vim:foldmethod=marker
