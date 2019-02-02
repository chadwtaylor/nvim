" Workspace Setup
" inspired by https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9
" nvim -c DefaultWorkspace
" ----------------
"function! DefaultWorkspace()

    "" Rough num columns to decide between laptop and big monitor screens
    "let numcol = 2

    "if winwidth(0) >= 220
        "let numcol = 3
    "endif

    "if numcol == 3
        "e term://fish
        "file Shell\ Two
        "vnew
    "endif

    "vsp " term://~/chadwtaylor/Dropbox/webprojects/linguabee/api
    "file Context
    "sp term://fish
    "file Shell\ One
    "wincmd k
    "resize 4
    "wincmd h

"endfunction

function! DefaultWorkspace() 

  let numcol = 2

  sp term://
  resize 20 
  vsp

endfunction

command! -register DefaultWorkspace call DefaultWorkspace()
