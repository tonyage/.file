execute pathogen#infect()
let mapleader="."
filetype plugin indent on

syntax enable
set nocompatible
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap .s :nohlsearch<CR>

set ruler
set number
set showcmd
set wildmenu
set showmatch
set cursorline
set wildmode=list:longest 

set encoding=utf-8
set tabstop=4
set softtabstop=4
set backspace=indent,eol,start

" list errors and warnings for current file
nmap <leader>e :Errors<CR>

" syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=0

" solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" vim-airline
let g:airline#extensions#tabline#enabled = 1  
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" enable folding
set foldmethod=indent
set foldlevel=99

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
						
" NERDTree
map <F3> :NERDTreeToggle<CR>
