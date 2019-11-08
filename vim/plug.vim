call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Yggdroot/indentLine'

" git
" gitk for vim
Plug 'gregsexton/gitv'
" post gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" langs
 "langs pack
Plug 'sheerun/vim-polyglot'
  " support for textual sinppeets
Plug 'garbas/vim-snipmate'
 "snippets pack for many langs.
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
 "syntax checking
Plug 'vim-syntastic/syntastic'
" Nav
Plug 'christoomey/vim-tmux-navigator'

" ruby/rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'

" scala
Plug 'derekwyatt/vim-scala'

" search
 "print numbers of matches
Plug 'vim-scripts/IndexedSearch'
 "search by selected text in the file
Plug 'nelstrom/vim-visual-star-search'

" vim awesome
Plug 'tpope/vim-surround'
 " create pair tags
Plug 'tpope/vim-ragtag'
 " auto add to structure code ex. if end
Plug 'tpope/vim-endwise'
 "easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'
 " yank history
Plug 'skwp/YankRing.vim'
 " change code only to selected region
Plug 'chrisbra/NrrwRgn'
 "tabularizeee :D
Plug 'godlygeek/tabular'
 "change content inside surroudings
Plug 'briandoll/change-inside-surroundings.vim'
 "auto completion for quotes, parens, brackets
Plug 'Raimondi/delimitMate'
 "split multiline and single line
Plug 'AndrewRadev/splitjoin.vim'
" commentary
Plug 'tpope/vim-commentary'

" colorschema
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

" text-object
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-indent'

" ack
Plug 'mileszs/ack.vim'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'


"Python
Plug 'nvie/vim-flake8'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
