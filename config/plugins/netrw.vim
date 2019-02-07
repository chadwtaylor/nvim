" absolute width of netrw window
let g:netrw_winsize = -40

" = 0: thin listing (one file per line) 
" = 1: long listing (one file per line with timestamp) 
" = 2: wide listing (multi files in columns)
" = 3: tree style listing 
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" = 0: re-use same window
" = 1: h split
" = 2: v split
" = 3: open in tab
" = 4: open in previous window
let g:netrw_browse_split = 4

" hide default banner
let g:netrw_banner = 0
