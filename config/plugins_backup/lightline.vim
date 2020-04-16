if dein#tap('lightline.vim')

  set noshowmode

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

  let s:p.normal.left = [ ['darkestgreen', 'brightgreen', 'bold'], ['white', 'darkestgreen'] ]
  let s:p.normal.right = [ ['darkestgreen', 'mediumgreen'], ['white', 'darkgreen'], ['white', 'darkestgreen'] ]

  let s:p.inactive.right = [ ['gray1', 'gray5'], ['gray4', 'gray1'], ['gray4', 'gray0'] ]
  let s:p.inactive.left = s:p.inactive.right[1:]
  let s:p.inactive.middle = [ [ 'gray7', 'gray2' ] ]

  let s:p.insert.left = [ ['darkestcyan', 'white', 'bold'], ['white', 'darkblue'] ]
  let s:p.insert.right = [ [ 'darkestcyan', 'mediumcyan' ], [ 'mediumcyan', 'darkblue' ], [ 'mediumcyan', 'darkestblue' ] ]

  let s:p.replace.left = [ ['white', 'brightred', 'bold'], ['white', 'gray4'] ]
  let s:p.visual.left = [ ['darkred', 'brightorange', 'bold'], ['white', 'gray4'] ]
  let s:p.normal.middle = [ [ 'gray7', 'darkestgreen' ] ]
  let s:p.insert.middle = [ [ 'mediumcyan', 'darkestblue' ] ]
  let s:p.replace.middle = s:p.normal.middle
  let s:p.replace.right = s:p.normal.right
  let s:p.tabline.left = [ [ 'gray9', 'gray4' ] ]
  let s:p.tabline.tabsel = [ [ 'gray9', 'gray1' ] ]
  let s:p.tabline.middle = [ [ 'gray2', 'gray8' ] ]
  let s:p.tabline.right = [ [ 'gray9', 'gray3' ] ]
  let s:p.normal.error = [ [ 'gray9', 'brightestred' ] ]
  let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

  let g:lightline#colorscheme#powerline#palette = lightline#colorscheme#fill(s:p)


  let g:lightline = {
    \    'active': {
    \      'left': [
    \           [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ],
    \           ['tagbar'],
    \         ],
    \      'right': [
    \           [ ],
    \           [ 'githealth', 'gitbranch'],
    \           [ 'linter_checking', 'linter_errors', 'linter_warnings', 'liter_ok' ],
    \         ],
    \   },
    \    'inactive': {
    \      'left': [
    \           [ 'readonly', 'filename', 'modified' ],
    \         ],
    \      'right': [
    \           [ 'githealth', 'gitbranch'],
    \         ],
    \   },
    \   'component': {
    \     'tagbar': '%{tagbar#currenttag("%s","")}',
    \   },
    \   'component_function': {
    \     'gitbranchx': 'MyGinaBranch',
    \     'githealthx': 'MyGinaHealth',
    \     'linter': 'MyALEStatus',
    \   },
    \   'component_expand': {
    \     'linter_checking': 'MyALEChecking',
    \     'linter_warnings': 'MyALEWarnings',
    \     'linter_errors': 'MyALEErrors',
    \     'linter_ok': 'MyALEOk',
    \   },
    \   'component_type': {
    \     'linter_checking': 'left',
    \     'linter_warnings': 'warning',
    \     'linter_errors': 'error',
    \     'linter_ok': 'left',
    \   },
    \ }



  function! MyGinaBranch()
    let branch = ''
    let branch .= gina#component#repo#name()
    let branch .= ':'
    let branch .= gina#component#repo#branch()
    return branch
  endfunction

  function! MyGinaHealth()
    let mods = MySignify()
    let status = MyGinaStatus()
    let traffic = gina#component#traffic#preset('fancy')
    let items = [mods, status, traffic]
    let summary = ''

    for i in range(3)
      if !empty(items[i])
        let summary .= printf('%s ', items[i])
      endif
    endfor

    if !empty(summary)
      let summary = printf('%s', summary[:-2])
    endif

    return summary
  endfunction

  function! MyGinaStatus()
    let symbols = ['s','u','x']
    let staged = gina#component#status#staged()
    let unstaged = gina#component#status#unstaged()
    let conflicted = gina#component#status#conflicted()
    let statuses = [staged, unstaged, conflicted]
    let status = ''

    for i in range(3)
      if !empty(statuses[i])
        let status .= printf('%s%s ', symbols[i], statuses[i])
      endif
    endfor

    if !empty(status)
      let status = printf('%s', status[:-2])
    endif

    " let status = gina#component#status#preset('fancy')
    " return 'showGinaStatus'
    return status
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

  " --------------------------------------------------------------------------------------------------------
  "  ALE Indicators
  " --------------------------------------------------------------------------------------------------------
  let s:indicator_warnings = get(g:, 'MyALEWarnings', 'W:')
  let s:indicator_errors = get(g:, 'MyALEErrors', 'E:')
  let s:indicator_ok = get(g:, 'MyALEOk', 'OK')
  let s:indicator_checking = get(g:, 'MyALEChecking', '...')

  function! MyALEWarnings() abort
    if !MyALELinted()
      return ''
    endif
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:all_non_errors == 0 ? '' : printf(s:indicator_warnings . '%d', all_non_errors)
  endfunction

  function! MyALEErrors() abort
    if !MyALELinted()
      return ''
    endif
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:all_errors == 0 ? '' : printf(s:indicator_errors . '%d', all_errors)
  endfunction

  function! MyALEOk() abort
    if !MyALELinted()
      return ''
    endif
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts.total == 0 ? s:indicator_ok : ''
  endfunction

  function! MyALEChecking() abort
    return ale#engine#IsCheckingBuffer(bufnr('')) ? s:indicator_checking : ''
  endfunction

  function! MyALELinted() abort
    return get(g:, 'ale_enabled', 0) == 1
      \ && getbufvar(bufnr(''), 'ale_linted', 0) > 0
      \ && ale#engine#IsCheckingBuffer(bufnr('')) == 0
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
