if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')

    call dein#begin('~/.cache/dein')


    " Remove disabled plugins
    " call dein#disable('dbext.vim')
    " call map(dein#check_clean(), "delete(v:val, 'rf')")
    " call dein#recache_runtimepath()

    " 
    
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim') " plugin management
    call dein#add('Shougo/deoplete.nvim') " completer
    call dein#add('Shougo/denite.nvim') " file, grep and buffer management
    " call dein#add('neoclide/denite-extra')
    call dein#add('scrooloose/nerdtree') " file management / explorer
    call dein#add('w0rp/ale') " linter
    call dein#add('scrooloose/nerdcommenter') " commeting
    " call dein#add('vim-airline/vim-airline') " status bar
    " call dein#add('vim-airline/vim-airline-themes') " status bar themes
    call dein#add('mhinz/vim-startify') " start screen
    call dein#add('thaerkh/vim-workspace')
    call dein#add('morhetz/gruvbox') " theme
    call dein#add('gioele/vim-autoswap') " automatically delete swp files
    call dein#add('junegunn/fzf.vim') " fuzzy finder
    call dein#add('mhinz/vim-signify') " git gutter
    call dein#add('tpope/vim-fugitive') " git gutter
    call dein#add('tpope/vim-rhubarb') " extension to fugitive
    call dein#add('easymotion/vim-easymotion') " motion on speed
    call dein#add('ap/vim-css-color') " preview colors on hex
    call dein#add('Yggdroot/indentLine') " visual indentation guides
    call dein#add('xolox/vim-session') " session management
    call dein#add('xolox/vim-misc') " required for vim-session
    call dein#add('sheerun/vim-polyglot') " language
    call dein#add('tpope/vim-surround') " quick surrounding with quotes or brackets
    call dein#add('tpope/vim-repeat') " repeat surround commands
    " call dein#add('ervandew/supertab') " completer
    call dein#add('Shougo/junkfile.vim') " snippets
    call dein#add('Shougo/neosnippet') " snippets
    call dein#add('Shougo/neosnippet-snippets') " snippets templates
    call dein#add('joker1007/vim-ruby-heredoc-syntax') " color syntax for ruby between 'x = <<-SQL ... SQL'
    call dein#add('majutsushi/tagbar') " class functions
    call dein#add('lifepillar/pgsql.vim') " postgresql syntax
    call dein#add('chadwtaylor/dbext.vim') " db connection
    " call dein#add('vim-scripts/dbext.vim') " db connection
    call dein#add('tpope/vim-rails') " rails-powered
    call dein#add('itchyny/lightline.vim') " status bar
    call dein#add('maximbaz/lightline-ale') " linter stuff for lightline
    call dein#add('tpope/vim-endwise') " adding end stuff to blocks
    call dein#add('tpope/vim-endwise') " adding end stuff to blocks
    call dein#add('lambdalisue/gina.vim') " git

    " call dein#add('powerline/powerline-fonts')
    " call dein#add('nathanaelkane/vim-indent-guides') " visual indentation guides
    " call dein#add('tpope/vim-vinegar')

    " tmux-inspired stuff but am using this plugin to get the visual selected lines 
    " and use it into the keybinding command (refer to keybindings.vim for how it's used)
    " call dein#add('epeli/slimux') 

    " call dein#add('justinmk/vim-sneak') " motion (ewilliam)
    " mundo " undo app (ewilliam)
    " supertab " complete (ewilliam)
    " golden-ratio " window splitter (ewilliam)
    " rainbow " bracket coloring (ewilliam)
    " commentary-vim # commenting (ewilliam)

    " RAILS and RUBY STUFF
    call dein#add('thoughtbot/vim-rspec') " rspec testing

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
