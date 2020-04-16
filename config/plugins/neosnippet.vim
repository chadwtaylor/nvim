let g:neosnippet#snippets_directory = '~/.nvim/neosnippets'

" deoplete + neosnippet + autopairs changes
" let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
" imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
