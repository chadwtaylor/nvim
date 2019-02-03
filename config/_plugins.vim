if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')

    call dein#begin('~/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('neoclide/denite-extra')
    call dein#add('w0rp/ale')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    " call dein#add('powerline/powerline-fonts')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('arkwright/vim-whiplash')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('mhinz/vim-startify')
    call dein#add('thaerkh/vim-workspace')
    call dein#add('morhetz/gruvbox') " theme
    call dein#add('gioele/vim-autoswap') " automatically delete swp files
    call dein#add('junegunn/fzf.vim') " fuzzy finder
    call dein#add('mhinz/vim-signify') " git gutter
    call dein#add('tpope/vim-fugitive') " git gutter
    call dein#add('tpope/vim-rhubarb') " extension to fugitive
    call dein#add('easymotion/vim-easymotion') " motion on speed
    call dein#add('ap/vim-css-color') " preview colors on hex
    " call dein#add('nathanaelkane/vim-indent-guides') " visual indentation guides
    call dein#add('Yggdroot/indentLine') " visual indentation guides

    " RAILS and RUBY STUFF
    call dein#add('thoughtbot/vim-rspec') " rspec testing
    call dein#add('majutsushi/tagbar') " class functions


    " TO UPDATE, call ,pu (or :call dein#update)

    " Add or remove your plugins here:
    " call dein#add('Shougo/neosnippet')
    " call dein#add('Shougo/neosnippet-snippets')
    " call dein#add('sheerun/vim-polyglot')
    " call dein#add('Shougo/vimshell')
    " call dein#add('Shougo/neoinclude.vim')
    " call dein#add('Shougo/neco-vim')
    " call dein#add('icymind/NeoSolarized') " Does not work
    " call dein#add('tmhedberg/SimpylFold')
    " call dein#add('Konfekt/FastFold')
    " call dein#add('Shougo/neoinclude.vim')
    " call dein#add('cloudhead/neovim-fuzzy')
    " call dein#add('neomutt/neomutt.vim')
    " call dein#add('christoomey/vim-tmux-navigator')
    " call dein#add('plasticboy/vim-markdown')
    " call dein#add('jamessan/vim-gnupg')

    call dein#add('autozimu/LanguageClient-neovim', {
            \ 'rev': 'next',
            \ 'build': 'bash install.sh',
            \ })

    " Required:
    call dein#end()
    call dein#save_state()

endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------
