
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

"push Example of custom commands
" command! OpenChangedFiles :call OpenChangedFiles()
" nnoremap ,ocf :OpenChangedFiles<CR>
" command! ws :w<Bar>:so ~/.config/nvim/init.vim<CR>


" MISC STUFF
noremap <leader>w :w<CR>
noremap <leader>sor :so ~/.config/nvim/init.vim<CR>
noremap <leader>ws :w<CR>:so ~/.config/nvim/init.vim<CR>
noremap <leader>q :qa<CR>
noremap <silent> <leader><space> :nohlsearch<CR>

" ------------------------------------------------------------------------------------
" WINDOW MANAGEMENT
" ------------------------------------------------------------------------------------
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


" ------------------------------------------------------------------------------------
" DBEXT - database stuff
" ------------------------------------------------------------------------------------
if dein#tap('dbext.vim')

  command! Dc :DBPromptForBufferParameters
  command! De :DBExecSQLUnderCursor
  command! De :DBExecVisualSQL
  command! Det :DBSelectFromTable
  command! Dd :DBDescribeTable
  command! Dlt :DBListTable
  command! Dtl :DBListTable
  command! Dlv :DBListView
  command! Dvl :DBListView
  command! Dx :DBResultsClose
  command! Dh :DBHistory

  nnoremap <leader>dc :<C-u>DBPromptForBufferParameters<CR>
  vnoremap <leader>dr :<C-u>DBExecVisualSQL<CR>
  nnoremap <leader>dr :<C-u>mark x<CR>:1,$DBExecRangeSQL<CR>:'x<CR>
  nnoremap <leader>det :<C-u>DBSelectFromTable<CR>
  nnoremap <leader>dd :<C-u>DBDescribeTable<CR>
  nnoremap <leader>dda :<C-u>DBDescribeTableAskName<CR>
  nnoremap <leader>dlt :<C-u>DBListTable<CR>
  nnoremap <leader>dtl :<C-u>DBListTable<CR>
  nnoremap <leader>dlv :<C-u>DBListView<CR>view_<CR>
  nnoremap <leader>dvl :<C-u>DBListView<CR>view_<CR>
  nnoremap <leader>dx :<C-u>DBResultsClose<CR>
  nnoremap <leader>dh :<C-u>DBHistory<CR>

endif


" ------------------------------------------------------------------------------------
" DENITE
" ------------------------------------------------------------------------------------
if dein#tap('denite.nvim') 

  nnoremap <leader>pu :<C-u>call dein-update()<CR>

  " nnoremap <space>v :Denite file_rec -default-action=split<CR>

  " Grep stuff
  nnoremap <leader>/ :<C-u>Denite grep:. -auto-preview -mode=normal<CR>
  nnoremap <leader>// :DeniteCursorWord grep -auto-preview -buffer-name=search -no-empty -mode=normal<CR>

  nnoremap <silent><leader>f :<C-u>Denite file/rec<CR>

  nnoremap <silent><leader>sr :<C-u>Denite -resume -refresh -mode=normal<CR>
  nnoremap <silent><leader>sf :<C-u>Denite file<CR>
  nnoremap <nowait><silent><leader>sfb :<C-u>Denite buffer file<CR>
  nnoremap <silent><leader>sbf :<C-u>Denite buffer file<CR>
  nnoremap <nowait><silent><leader>b :<C-u>Denite buffer<CR>
  " nnoremap <silent><leader>* :<C-u>DeniteCursorWord line -buffer-name=search -auto-highlight -mode=normal<CR>
  " nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>

endif


" ------------------------------------------------------------------------------------
" FUGITIVE
" ------------------------------------------------------------------------------------
" if dein#tap('vim-fugitive') 
"   nnoremap <leader>ga :Git add %:p<CR><CR>
"   nnoremap <nowait><leader>gs :Gstatus<CR>
"   nnoremap <leader>gc :Gcommit -v -q<CR>
"   nnoremap <leader>gt :Gcommit -v -q %:p<CR>
"   nnoremap <leader>gd :Gdiff<CR>
"   nnoremap <leader>ge :Gedit<CR>
"   nnoremap <leader>gr :Gread<CR>
"   nnoremap <leader>gw :Gwrite<CR><CR>
"   nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
"   nnoremap <leader>gp :Ggrep<Space>
"   nnoremap <leader>gm :Gmove<Space>
"   nnoremap <leader>gb :Gblame<CR>q
"   nnoremap <leader>gco :Git checkout<Space>
"   nnoremap <leader>gps :Dispatch! git push<CR>
"   nnoremap <leader>gpl :Dispatch! git pull<CR>
" endif


" ------------------------------------------------------------------------------------
" GINA
" ------------------------------------------------------------------------------------
if dein#tap('gina.vim') 
  nnoremap <leader>ga :Gina add %:p<CR>
  nnoremap <nowait><leader>gs :Gina status<CR>
  nnoremap <leader>gc :Gina commit -q -v<CR>
  nnoremap <leader>gco :Gina checkout<SPACE>
  nnoremap <silent> <leader>gp :Gina push<CR>
  nnoremap <leader>gpl :Gina pull<CR>
  nnoremap <leader>gb ::Gina blame --opener=tabedit --format="%au - %su%=%ti%ma%in" --width=75<CR>
  nnoremap <leader>gbr :Gina branch -a --opener=split<CR>
endif


" ------------------------------------------------------------------------------------
" JUNKFILE
" ------------------------------------------------------------------------------------
if dein#tap('junkfile.vim') 
  nnoremap <leader>jf :JunkfileOpen<CR>
  nnoremap <leader>jfsql :JunkfileOpen<CR>sql<CR>
endif


" ------------------------------------------------------------------------------------
" NERDTREE
" ------------------------------------------------------------------------------------
if dein#tap('nerdtree') 
  nnoremap <silent> <leader>e :<C-u>let NERDTreeWinPos=0 \| NERDTreeToggle<CR>
  nnoremap <silent> <leader>a :<C-u>let NERDTreeWinPos=0 \| NERDTreeFind<CR>
  nnoremap <silent> <leader>E :<C-u>let NERDTreeWinPos=1 \| NERDTreeToggle<CR>
  nnoremap <silent> <leader>A :<C-u>let NERDTreeWinPos=1 \| NERDTreeFind<CR>
endif 

" ------------------------------------------------------------------------------------
" RSPEC
" ------------------------------------------------------------------------------------
" if dein#tap('vim-rspec') 
"   nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
"   nnoremap <Leader>s :call RunNearestSpec()<CR>
"   nnoremap <Leader>l :call RunLastSpec()<CR>
"   nnoremap <Leader>a :call RunAllSpecs()<CR>
" endif

" ------------------------------------------------------------------------------------
" SESSION
" ------------------------------------------------------------------------------------
if dein#tap('vim-session')
  nnoremap <leader>p :OpenSession<CR> 
  nnoremap <leader>u :OpenSession<CR> 
  " nnoremap <leader>ps :SaveSession
  " nnoremap <leader>ps :SaveSession
endif


" ------------------------------------------------------------------------------------
" STARTIFY
" ------------------------------------------------------------------------------------
if dein#tap('vim-startify') 
  nnoremap <silent> <leader>sy :Startify<CR>
endif 


" ------------------------------------------------------------------------------------
" TAGBAR
" ------------------------------------------------------------------------------------
if dein#tap('tagbar') 
  nnoremap <silent> <leader>t :TagbarToggle<CR>
endif 

