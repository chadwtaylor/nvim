if dein#tap('lightline.vim')

  set noshowmode

  let g:lightline = {
      \   'active': {
      \     'left': [ ['mode','paste'], ['gitbranch','readonly','filename','modified'],['tagbar'] ],
      \   },
      \   'component': {
      \     'tagbar': '%{tagbar#currenttag("%s","","f")}',
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \   },
      \ }

endif
