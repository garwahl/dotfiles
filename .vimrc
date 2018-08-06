""""""""""""""""""""""""""""""""""
" Vim Editor Config
" Garwah Lam
" E: garwah.lam@team.telstra.com
"""""""""""""""""""""""""""""""""" 

""""""""""""""""""
" Editor Options 
""""""""""""""""""
set nocompatible 

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein package manager
"""""""""""""""""""""""""""""""""""""""""""""""""""
    if &compatible
        set nocompatible
    endif

    set runtimepath^=/home/garwah/.vim/bundles/repos/github.com/Shougo/dein.vim
    call dein#begin(expand('~/.vim/bundle'))
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'windows': 'tools\\update-dll-mingw',
        \     'cygwin': 'make -f make_cygwin.mak',
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })

""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""
" surrounds word with adjective
call dein#add('tpope/vim-surround')
" git wrapper
call dein#add('tpope/vim-fugitive')
" short cuts, [b ]b [e ]e
call dein#add('tpope/vim-unimpaired')
" commenting
call dein#add('tomtom/tcomment_vim')

" calls syntastic checkers
call dein#add('scrooloose/syntastic')
" NERDtree
call dein#add('scrooloose/nerdtree')
" laststatus=2
call dein#add('bling/vim-airline')
" fuzzy finder
call dein#add('ctrlpvim/ctrlp.vim')

" more % functions
call dein#add('tmhedberg/matchit')
" match html tags with soft highlight
call dein#add('valloric/MatchTagAlways')
" auto close tags
call dein#add('alvan/vim-closetag')

" ()
call dein#add('jiangmiao/auto-pairs')
" Graph style undo
call dein#add('sjl/gundo.vim')
" ctrl-n multi changing
call dein#add('terryma/vim-multiple-cursors')
" Easy moving
call dein#add('lokaltog/vim-easymotion')
" Editor settings
call dein#add('editorconfig/editorconfig-vim')

" EasyGrep for vim
call dein#add('dkprice/vim-easygrep')
" Camelcasing movement
call dein#add('vim-scripts/camelcasemotion')
" nav between tmux and vim splits with ctrl-hjkl
call dein#add('christoomey/vim-tmux-navigator')
" incremental searches
call dein#add('haya14busa/incsearch.vim')

"Theme 
call dein#add('vim-airline/vim-airline')

" Syntax
call dein#add('pangloss/vim-javascript', {'on_ft':['javascript', 'javascript.jsx']})
call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css', 'sass', 'html', 'javascript.jsx']})
call dein#add('othree/html5-syntax.vim', {'on_ft':['html', 'htmldjango', 'javascript.jsx']})
call dein#add('tpope/vim-markdown', {'on_ft':['markdown']})
call dein#add('tpope/vim-haml', {'on_ft':['haml']})
call dein#add('hdima/python-syntax', {'on_ft':['html']})
call dein#add('vim-jp/vim-cpp', {'on_ft':['c', 'cpp']})
call dein#add('wavded/vim-stylus', {'on_ft':['stylus']})
call dein#add('mxw/vim-jsx', {'on_ft':['javascript.jsx']})
call dein#add('justinmk/vim-syntax-extra', {'on_ft':['c']})
call dein#add('tpope/vim-cucumber', {'on_ft':['feature']})

call dein#end()

" Attempt to determine the file type and highlighting based on its name
filetype indent plugin on

" Install plugins on start up
if dein#check_install()
	call dein#install()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic options
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_error_symbol = '✖'
let g:syntastic_warning_symbol = '❢'

let g:syntastic_cucumber_checkers = ['syntastic-cucumber-cucumber']

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Using powerline font
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" tabline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree options
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""
" Ctrlp options
"""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"""""""""""""""""""
" Editor Options
"""""""""""""""""""

"Hide buffers instead of closing them
set hidden

"Enable syntax highlighting 
syntax enable

"Set relative line numbers and column, row coordinates
set rnu
set nu
set ruler

"Don't wrap long lines
set nowrap

"Reload files changed externally to vim
set autoread
set laststatus=2

"Display title of file being edited
set title

"Show editing mode
set showmode

"Report the number of lines changed
set report=0

" Show matching bracket
set showmatch

"Allow backspacing over autoindent, linebreaks and start of insert action
set backspace=indent,eol,start

" Change directory to the directory of the focused file
set autochdir

"Show partial commands in the last line of the screen
set showcmd

"Set screen to flash instead of beeping on notification
set visualbell t_vb=

"Tab auto completion when running a command
set wildmenu
set wildmode=longest,full

"""""""""""""""
" Searching
"""""""""""""""
" Ignore the case in search patterns
set ignorecase
set smartcase

" Highlights matching search terms
set hlsearch
" Allow for incremental searching
set incsearch

"""""""""""""""
" Mode Toggles
"""""""""""""""
" Turn paste mode on and off for pasting in text without auto indentation
set pastetoggle=<F2>

"""""""""""""""""""""""""
" Window Split Navigation
""""""""""""""""""""""""""
" Remap split screen navigation to easier keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Make split window moving easier 
map xh <C-w>H
map xj <C-w>J
map xk <C-w>K
map xl <C-w>L

" Open new split panes to the right and bottom
set splitbelow
set splitright

""""""""""""""
" netrw (File Browser) settings
""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 20

""""""""""""""""
" Indentation
""""""""""""""""
"set tabstop=4
"set shiftwidth=4

" Indent on a new line is equal to the indentation of the previous
set smartindent
set autoindent

""""""""""""""""""
" Color Scheme
""""""""""""""""""
set background=dark
colorscheme gruvbox 
let g:gruvbox=256
let g:gruvbox=1

