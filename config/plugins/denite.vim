
" -----------------------------------------------------------------
" Makes grep faster
" -----------------------------------------------------------------
call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading'])
" -----------------------------------------------------------------

let s:denite_options = { 'default': {
  \ 'split': 'vertical',
  \ 'ignorecase': 1, 
  \ 'vertical_preview': 1, 
  \ }}

"nnoremap <space>v :Denite file_rec -default-action=vsplit<cr>¬                                                                                                                   
"nnoremap <space>s :Denite file_rec -default-action=split<cr>¬                                                                                                                    
"nnoremap <space>e :Denite file_rec -winheight=10 <cr>¬                                                                                                                           
"nnoremap <space>m :Denite file_mru -winheight=10 -vertical-preview -auto-preview <cr>¬                                                                                           
"nnoremap <space>l :Denite line -auto-preview<cr>¬  

