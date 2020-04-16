
let g:startify_session_dir = '~/.nvim/sessions'

let g:startify_lists = [
  \ { 'type':'sessions',    'header':['   Sessions'] },
  \ { 'type':'files',       'header':['   Files - Most Recent'] },
  \ { 'type':'dir',         'header':['   Files - Most Recent - '. getcwd()] },
  \ { 'type':'bookmarks',   'header':['   Bookmarks'] },
  \ ]

let g:startify_bookmarks = [
            \ '~/Dropbox/web_projects/linguabee/api',
            \ '~/Dropbox/web_projects/linguabee/skep',
            \ '~/Dropbox/web_projects/linguabee/nectar',
            \ '~/Dropbox/web_projects/linguabee/hive',
            \ '~/Dropbox/web_projects/linguabee/webapp',
            \ '~/.config/nvim/config',
            \ ]

" let g:startify_session_persistence = 1

" let g:startify_session_before_save = [
"   \ 'echo "Cleaning up before saving..."',
"   \ 'silent! NERDTreeClose'
"   \ ]
