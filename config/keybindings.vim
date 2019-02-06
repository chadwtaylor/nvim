
"First, map and noremap are similar in that that each create mappings for normal, visual, select and operator pending modes simultaneously. Vim details this in :help map-overview:
"
"Overview of which map command works in which mode.  More details below.
"     COMMANDS                    MODES ~
":map   :noremap  :unmap     Normal, Visual, Select, Operator-pending
":nmap  :nnoremap :nunmap    Normal
":vmap  :vnoremap :vunmap    Visual and Select
":smap  :snoremap :sunmap    Select
":xmap  :xnoremap :xunmap    Visual
":omap  :onoremap :ounmap    Operator-pending
":map!  :noremap! :unmap!    Insert and Command-line
":imap  :inoremap :iunmap    Insert
":lmap  :lnoremap :lunmap    Insert, Command-line, Lang-Arg
":cmap  :cnoremap :cunmap    Command-line
"As per the above help, if you wanted to restrict the mapping to a specific mode, you have to prepend:
"
"'n' (for normal), 'v' (for visual and select), 'c' (for command), 'x' (for visual mode), 's' (for select), 'o' (for operator pending).
"
" GOOD REFERENCE ON MAPPING : https://code.i-harness.com/en/q/399e75
"
" ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

let mapleader = ","
let maplocalleader = "-"

" Use ; for commands 
nnoremap ; : 

" Example of custom commands
" command! OpenChangedFiles :call OpenChangedFiles()
" nnoremap ,ocf :OpenChangedFiles<CR>
" command! ws :w<Bar>:so ~/.config/nvim/init.vim<CR>

" MISC STUFF
noremap <leader>w :w<CR>
noremap <leader>sor :so ~/.config/nvim/init.vim<CR>
noremap <leader>ws :w<CR>:so ~/.config/nvim/init.vim<CR>
noremap <leader>q :qa<CR>
noremap <silent> <leader><space> :nohlsearch<CR>

" Moving around windows
nnoremap <leader>< <C-W><C-H> 
nnoremap <leader>h <C-W><C-H> 

nnoremap <leader>> <C-W><C-L> 
nnoremap <leader>l <C-W><C-L> 

nnoremap <leader>^ <C-W><C-K> 
nnoremap <leader>k <C-W><C-K> 

nnoremap <leader>_ <C-W><C-J> 
nnoremap <leader>j <C-W><C-J> 


" ####################################################################################
" DEIN - Plugin Manager
" ####################################################################################
nnoremap <leader>pu :call dein#update()<CR>


" ####################################################################################
" DENITE
" ####################################################################################
if dein#tap('denite.nvim') 

  nnoremap <leader>d :<C-u>Denite 

  " nnoremap <space>v :Denite file_rec -default-action=split<CR>

  " Grep stuff
  nnoremap <leader>/ :<C-u>Denite grep:. -auto-preview -mode=normal<CR>
  nnoremap <leader>// :DeniteCursorWord grep -auto-preview -buffer-name=search -no-empty -mode=normal<CR>
  " nnoremap <silent><localleader>g :<C-u>Denite grep -buffer-name=search -no-empty -mode=normal<CR>
  " nnoremap <silent> <Leader>gg :DeniteCursorWord grep -buffer-name=search -no-empty -mode=normal<CR>

  nnoremap <silent><localleader>r :<C-u>Denite -resume -refresh -mode=normal<CR>
  nnoremap <silent><localleader>fr :<C-u>Denite file/rec<CR>
  nnoremap <silent><localleader>f :<C-u>Denite file<CR>
  nnoremap <silent><localleader>fb :<C-u>Denite buffer file<CR>
  nnoremap <silent><localleader>bf :<C-u>Denite buffer file<CR>
  nnoremap <silent><localleader>b :<C-u>Denite buffer<CR>
  " nnoremap <silent><localleader>* :<C-u>DeniteCursorWord line -buffer-name=search -auto-highlight -mode=normal<CR>

  " nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>

endif


" ####################################################################################
" FUGITIVE
" ####################################################################################
if dein#tap('vim-fugitive') 
  nnoremap <space>ga :Git add %:p<CR><CR>
  nnoremap <space>gs :Gstatus<CR>
  nnoremap <space>gc :Gcommit -v -q<CR>
  nnoremap <space>gt :Gcommit -v -q %:p<CR>
  nnoremap <space>gd :Gdiff<CR>
  nnoremap <space>ge :Gedit<CR>
  nnoremap <space>gr :Gread<CR>
  nnoremap <space>gw :Gwrite<CR><CR>
  nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
  nnoremap <space>gp :Ggrep<Space>
  nnoremap <space>gm :Gmove<Space>
  nnoremap <space>gb :Gblame<CR>
  nnoremap <space>gco :Git checkout<Space>
  nnoremap <space>gps :Dispatch! git push<CR>
  nnoremap <space>gpl :Dispatch! git pull<CR>
endif


" ####################################################################################
" NERDTREE
" ####################################################################################
if dein#tap('nerdtree') 
  nnoremap <silent> <localleader>e :<C-u>let NERDTreeWinPos=0 \| NERDTreeToggle<CR>
  nnoremap <silent> <localleader>a :<C-u>let NERDTreeWinPos=0 \| NERDTreeFind<CR>
  nnoremap <silent> <localleader>E :<C-u>let NERDTreeWinPos=1 \| NERDTreeToggle<CR>
  nnoremap <silent> <localleader>A :<C-u>let NERDTreeWinPos=1 \| NERDTreeFind<CR>
endif 


" ####################################################################################
" SESSION
" ####################################################################################
if dein#tap('vim-session')
  nnoremap <localleader>p :OpenSession<CR> 
  nnoremap <localleader>u :OpenSession<CR> 
  " nnoremap <localleader>ps :SaveSession
  " nnoremap <localleader>ps :SaveSession
endif


" ####################################################################################
" STARTIFY
" ####################################################################################
if dein#tap('vim-startify') 
  nnoremap <silent> <leader>sy :Startify<CR>
endif 


" ####################################################################################
" TAGBAR
" ####################################################################################
if dein#tap('tagbar') 
  nnoremap <silent> <localleader>t :TagbarToggle<CR>
endif 

