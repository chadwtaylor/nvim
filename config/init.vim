" CHECK THIS OUT FOR LEAN CONFIGS
" https://github.com/rafi/vim-config
"
" init.vim contains all of the initialization plugins for vim
" note that this has to be sourced second since dein needs to
" run its scripts first. This contains misc startup settings
" for vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable syntax highlighting
syntax on

" Fixes backspace
set backspace=indent,eol,start

" Enable line numbers
set nu

" Enable line/column info at bottom
set ruler
set cursorline " highlights current line
set nowrap

" Automatically reload file when file changes
set autoread

set scrolloff=10

" Autoindentation
" set ai
set smartindent
filetype indent plugin on

" Copies using system clipboard
set clipboard+=unnamedplus

" Tab = 2 spaces
set tabstop=2
set shiftwidth=2
" set sta
set expandtab
set sts=2 " softtabstop, makes spaces feel like tabs when deleting

" enable mouse support
set mouse=a mousemodel=popup

" markdown file recognition
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.md.html set filetype=markdown

" relative line numbers
" Sets relative line numbers in normal mode, absolute line numbers in insert
" mode
set number
set relativenumber

" use ripgreg instead of grep
" set grepprg=rg\ --vimgrep

" use ag (silver searcher) instead of grep
set grepprg=ag\ --vimgrep
set rtp+=/usr/local/opt/fzf

" Set colors in terminal
set termguicolors
let g:gruvbox_termcolors=16
" set background=dark
colorscheme gruvbox
" colorscheme molokai
" colorscheme NeoSolarized

" close vim if only window left is nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" crontab filetype tweak (the way vim normally saves files confuses crontab
" so this workaround allows for editing
au FileType crontab setlocal bkc=yes

set hidden

" Disable completion where available from ALE
" (not worth creating a separate file just for a one-liner)
let g:ale_completion_enabled = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" terminal settings
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" markdown settings
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 0

" session management
let g:session_directory = '~/.nvim/sessions'
let g:session_autosave = 'yes'
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions-=options
" autocmd BufEnter NERD_tree_* nmap d<CR> <CR> :NERDTreeToggle <CR>
" autocmd BufLeave NERD_tree_* unmap d<CR>
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" set sessionoptions-=buffers


" ES6-to-JS Transpiling
augroup es6_transpiling
  autocmd!
  " treat es6 files like javascript files
  autocmd BufNewFile,BufRead *.es6 set filetype=javascript
  autocmd BufWritePost,FileWritePost *.es6 :silent !babel <afile> -o <afile>:r.js
augroup END

" --------------------------------------------------------------------------------
" FIX TRAILING WHITESPACE ON SAVE
" --------------------------------------------------------------------------------
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

augroup AutoFixTrailingWhitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END
" --------------------------------------------------------------------------------
