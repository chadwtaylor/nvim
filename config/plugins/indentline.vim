if dein#tap('vim-indent-guides')

  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_start_level = 3
  let g:indent_guides_guide_size = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg='#232323'      ctermbg=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg='#232323'      ctermbg=50

endif
