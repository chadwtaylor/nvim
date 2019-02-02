
let g:startify_session_dir = '~/.nvim/session'

let g:startify_lists = [
  \ { 'type':'sessions',    'header':['   Sessions'] }, 
  \ { 'type':'bookmarks',   'header':['   Bookmarks'] },
  \ { 'type':'files',       'header':['   Files - Most Recent'] },
  \ { 'type':'dir',         'header':['   Files - Most Recent - '. getcwd()] },
  \ ]

let g:startify_bookmarks = [
            \ '~/Dropbox/web_projects/linguabee/api',
            \ '~/Dropbox/web_projects/linguabee/hive',
            \ '~/Dropbox/web_projects/linguabee/webapp',
            \ '~/.config/nvim/config/_plugins.vim',
            \ '~/.config/nvim/config/keybindings.vim',
            \ ]

let g:startify_session_persistence = 1

let g:startify_session_before_save = [
  \ 'echo "Cleaning up before saving..."', 
  \ 'silent! NERDTreeClose'
  \ ]
