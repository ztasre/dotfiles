" stuff to get Vundle to work

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/addexecmod.vim'
Plugin 'gabesoft/vim-ags'
Plugin 'scrooloose/nerdtree'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'kovisoft/slimv'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/lightline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
" Plugin 'ternjs/tern_for_vim'

" potentially useful stuff below
" Plugin 'mattn/gist-vim'
" Plugin 'chilicuil/vim-sprunge'
" Plugin 'scrooloose/syntastic'

call vundle#end()

filetype plugin indent on
" Vundle config ends here

" map leader
let mapleader = ","


"Basics
syntax on
set tabstop=4 shiftwidth=4 expandtab
set smarttab
set nu
set ruler
set hlsearch
set nobackup
set showcmd

" Files and backups
set noswapfile

" cursorline
set cursorline

" remove sounds on errors
set noerrorbells
set novisualbell

" spell checking
map <leader>ss :setlocal spell!<cr>

" tabs
map <leader>l :tabnext<cr>
map <leader>h :tabp<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>


" vimwiki 
let wiki_1 = {}
" default wiki
let wiki_1.path = '~/vimwiki'

" everything related to deep learning and machine learning goes here
let wiki_2 = {}
let wiki_2.path = '~/deeplearning'
let wiki_2.nested_syntaxes = { 'python': 'python'}

let g:vimwiki_list = [wiki_1, wiki_2]

"tslime config, using defaults
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_ensure_trailing_newlines=1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" for scheme to send to mit-scheme, works!
nmap ,x [[v)l<C-c><C-c>  
" below you want to send <c-c><c-x> to scheme using tslime
"autocmd BufRead,BufNewFile *.scm setlocal nmap ,d Send_keys_to_Tmux(<c-c><c-x>)

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" lisp stuff
"autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" slimv config
let g:slimv_repl_split = 3
let g:slimv_disable_scheme = 1
"let g:scheme_builtin_swank = 1

" Rainbow Parentheses config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" lightline
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \}

set laststatus=2

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
