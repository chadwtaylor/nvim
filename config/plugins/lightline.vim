if dein#tap('lightline.vim')

  set noshowmode

  let g:lightline = {
    \    'active': {
    \      'left': [ 
    \           [ 'mode', 'paste' ],
    \           [ 'ginabranch', 'ginastatus', 'readonly', 'filename', 'modified' ],
    \           ['tagbar']
    \         ],
    \   },
    \   'component': {
    \     'tagbar': '%{tagbar#currenttag("%s","","f")}',
    \   },
    \   'component_function': {
    \     'ginabranch': 'MyGinaBranch',
    \     'ginastatus': 'MyGinaStatus',
    \   },
    \ }

  function! MyGinaBranch()
    let branch = gina#component#repo#branch()
    return branch
	endfunction

  function! MyGinaStatus() 
    let status = gina#component#status#preset('fancy') 
    let traffic = gina#component#traffic#preset('fancy')
    let modifications = MySignify()
    return modifications . ' ' . status . ' ' . traffic
	endfunction

  function! MySignify()
    let symbols = ['+', '-', '~']
    let [added, modified, removed] = sy#repo#get_stats()
    let stats = [added, removed, modified]  " reorder
    let hunkline = ''

    for i in range(3)
      if stats[i] > 0
        let hunkline .= printf('%s%s ', symbols[i], stats[i])
      endif
    endfor

    if !empty(hunkline)
      let hunkline = printf('%s', hunkline[:-2])
    endif

    return hunkline
  endfunction

  " ---------------------------------------------------------------------------------------------------------------------------------------
  "  Below is reference stuff, mostly courtesy of ewilliam :)
  " ---------------------------------------------------------------------------------------------------------------------------------------
  
  " \      'right': [ 
  " \           [ 'lineinfo' ], [ 'percent' ],
  " \           [ 'fileformat', 'fileencoding', 'filetype' ],
  " \         ],

  " \     'readonly': 'MyReadonly',
  " \     'filename': 'MyFilename',
  " \     'modified': 'MyModified',
  " \     'fileformat': 'MyFileformat',
  " \     'fileencoding': 'MyFileencoding',
  " \     'mode': 'MyMode',
  " \     'filetype': 'MyFiletype',
  
  " function! MyFugitive()
  "   try
  "     if expand('%:t') !~? 'Mundo\|Tagbar' && &ft != "denite" && exists('*fugitive#head')
  "       " let mark = "\ue0a0 "
  "       let mark = ''
  "       let branch = fugitive#head()
  "       return branch !=# '' ? mark.branch : ''
  "     endif
  "   catch
  "   endtry
  "   return ''
  " endfunction

  " function! MyReadonly()
  "   return &ft !~? 'help' && &readonly ? "[LOCK]" : ''
  " endfunction

  " function! MyModified()
  "   return &ft =~ 'help\|gitcommit' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  " endfunction

  " function! MyFilename()
  "   let fname = expand('%:t')
  "   return fname == '__Tagbar__' ? g:lightline.fname :
  "         \ fname =~ '__Mundo' ? '' :
  "         \ &ft == 'gitcommit' ? "" :
  "         \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
  "         \ ('' != fname ? fname : '[No Name]') .
  "         \ ('' != MyModified() ? ' ' . MyModified() : '')
  " endfunction

  " function! MyMode()
  "   let fname = expand('%:t')
  "   return fname == '__Tagbar__' ? 'Tagbar' :
  "         \ fname == '__Mundo__' ? 'Mundo' :
  "         \ fname == '__Mundo_Preview__' ? 'Mundo Preview' :
  "         \ &ft == 'denite' ? 'Denite' :
  "         \ winwidth(0) > 60 ? lightline#mode() : ''
  " endfunction

  " function! MyFileformat()
  "   return winwidth(0) > 70 ? &fileformat : ''
  " endfunction

  " function! MyFiletype()
  "   return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  " endfunction

  " function! MyFileencoding()
  "   return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
  " endfunction

endif
