
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

" ####################################################################################
" WINDOW MANAGEMENT
" ####################################################################################
nnoremap <leader>< <C-W><C-H> " move left
nnoremap <leader>h <C-W><C-H> 

nnoremap <leader>> <C-W><C-L> " move right
nnoremap <leader>l <C-W><C-L> 

nnoremap <leader>^ <C-W><C-K> " move up
nnoremap <leader>k <C-W><C-K> 

nnoremap <leader>_ <C-W><C-J> " move down
nnoremap <leader>j <C-W><C-J> 

nnoremap <leader>w= <C-W>=
map + <C-W>+
map _ <C-W>-


" #################################################################################### 
" NETRW - file explorer
" ####################################################################################
nnoremap <localleader>e :<C-u>Lex<CR>


" ####################################################################################
" DBEXT - database stuff
" ####################################################################################
if dein#tap('dbext.vim')

  command! Dbc :DBPromptForBufferParameters
  command! Dbe :DBExecSQLUnderCursor
  command! Dbe :DBExecVisualSQL
  command! Dbet :DBSelectFromTable
  command! Dbd :DBDescribeTable
  command! Dblt :DBListTable
  command! Dbtl :DBListTable
  command! Dblv :DBListView
  command! Dbvl :DBListView
  command! Dbx :DBResultsClose
  command! Dbh :DBHistory

  nnoremap <localleader>dbc :<C-u>DBPromptForBufferParameters<CR>
  vnoremap <localleader>r :<C-u>DBExecVisualSQL<CR>
  nnoremap <localleader>r :<C-u>mark x<CR>:1,$DBExecRangeSQL<CR>:'x<CR>
  nnoremap <localleader>dbet :<C-u>DBSelectFromTable<CR>
  nnoremap <localleader>dbd :<C-u>DBDescribeTable<CR>
  nnoremap <localleader>dbda :<C-u>DBDescribeTableAskName<CR>
  nnoremap <localleader>dblt :<C-u>DBListTable<CR>
  noremap <localleader>dbtl :<C-u>DBListTable<CR>
  nnoremap <localleader>dblv :<C-u>DBListView<CR>view_<CR>
  nnoremap <localleader>dbvl :<C-u>DBListView<CR>view_<CR>
  nnoremap <localleader>dbx :<C-u>DBResultsClose<CR>
  nnoremap <localleader>dbh :<C-u>DBHistory<CR>

endif


" ####################################################################################
" DENITE
" ####################################################################################
if dein#tap('denite.nvim') 

  nnoremap <leader>d :<C-u>Denite 
  nnoremap <leader>pu :<C-u>call dein#update()<CR>

  " nnoremap <space>v :Denite file_rec -default-action=split<CR>

  " Grep stuff
  nnoremap <localleader>/ :<C-u>Denite grep:. -auto-preview -mode=normal<CR>
  nnoremap <localleader>// :DeniteCursorWord grep -auto-preview -buffer-name=search -no-empty -mode=normal<CR>

  nnoremap <silent><localleader>sr :<C-u>Denite -resume -refresh -mode=normal<CR>
  nnoremap <silent><localleader>sfr :<C-u>Denite file/rec<CR>
  nnoremap <silent><localleader>sf :<C-u>Denite file<CR>
  nnoremap <nowait><silent><localleader>sfb :<C-u>Denite buffer file<CR>
  nnoremap <silent><localleader>sbf :<C-u>Denite buffer file<CR>
  nnoremap <nowait><silent><localleader>sb :<C-u>Denite buffer<CR>
  " nnoremap <silent><localleader>* :<C-u>DeniteCursorWord line -buffer-name=search -auto-highlight -mode=normal<CR>
  " nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>

endif


" ####################################################################################
" FUGITIVE
" ####################################################################################
if dein#tap('vim-fugitive') 
  " nnoremap <localleader>ga :Git add %:p<CR><CR>
  " nnoremap <nowait><localleader>gs :Gstatus<CR>
  " nnoremap <localleader>gc :Gcommit -v -q<CR>
  " nnoremap <localleader>gt :Gcommit -v -q %:p<CR>
  " nnoremap <localleader>gd :Gdiff<CR>
  " nnoremap <localleader>ge :Gedit<CR>
  " nnoremap <localleader>gr :Gread<CR>
  " nnoremap <localleader>gw :Gwrite<CR><CR>
  " nnoremap <localleader>gl :silent! Glog<CR>:bot copen<CR>
  " nnoremap <localleader>gp :Ggrep<Space>
  " nnoremap <localleader>gm :Gmove<Space>
  " nnoremap <localleader>gb :Gblame<CR>q
  " nnoremap <localleader>gco :Git checkout<Space>
  " nnoremap <localleader>gps :Dispatch! git push<CR>
  " nnoremap <localleader>gpl :Dispatch! git pull<CR>
endif


" ####################################################################################
" GINA
" ####################################################################################
if dein#tap('gina.vim') 
  nnoremap <localleader>ga :Gina add %:p<CR>
  nnoremap <nowait><localleader>gs :Gina status<CR>
  nnoremap <localleader>gc :Gina commit -q -v<CR>
  nnoremap <localleader>gco :Gina checkout<SPACE>
  nnoremap <localleader>gph :Gina push<CR>
  nnoremap <localleader>gb ::Gina blame --opener=tabedit --format="%au - %su%=%ti%ma%in" --width=75<CR>
  nnoremap <localleader>gbr :Gina branch -a --opener=split<CR>
endif


" ####################################################################################
" JUNKFILE
" ####################################################################################
if dein#tap('junkfile.vim') 
  nnoremap <leader>jf :JunkfileOpen<CR>
  nnoremap <leader>jfsql :JunkfileOpen<CR>sql<CR>
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

