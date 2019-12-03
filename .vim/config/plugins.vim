syntax on
syntax enable

if has('nvim')
	let g:airline_theme='onedark'
	" colo space-vim-dark
    colo onedark
    hi Comment guifg=#5C6370 ctermfg=59

	" enables transparent background; disable for conventional spacemacs theme
	if $TERM_PROGRAM =~ 'iTerm'
		hi Normal ctermbg=NONE guibg=NONE
		hi LineNr ctermbg=NONE guibg=NONE
		hi SignColumn ctermbg=NONE guibg=NONE
	endif

	let g:python_host_prog='/Users/tdo/.pyenv/versions/py2nvim/bin/python'
	let g:python3_host_prog='/Users/tdo/.pyenv/versions/py3nvim/bin/python3'

else
	if has("termguicolors")
		set termguicolors
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif

    " onedark dark background
	if (has("autocmd") && !has("gui_running"))
        let g:onedark_terminal_italics = 1
        augroup colors
            autocmd!
            let s:background = {"gui": "#202020", "cterm": "235", "cterm16": "0"}
            autocmd ColorScheme * call onedark#set_highlight("Normal", {"bg": s:background })
        augroup END
	endif

	colo onedark
	let g:airline_theme='onedark'
endif

" ale
let b:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'python': ['pylint']
    \ }

" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" syntax highlighting font style
hi Comment cterm=italic
hi String cterm=italic gui=italic

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#buffer_idx_mode=1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols - defaults to this for non patched fonts
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

" airline symbols - defaults to this for patched fonts
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" vim-markdown
let g:mkdp_auto_start=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
    \ }
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1                                           " Remove help text from NERDTree
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1
let g:NERDTreeStatusline=''
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" ctrl-p
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command= 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching=0
endif
let g:ctrlp_show_hidden=1

" rainbow
let g:rainbow_active=1

" Tabular
nmap <leader>a= :Tab /=<CR>
vmap <leader>a= :Tab /=<CR>

" vim-better-whitespace
nmap <leader>s :StripWhitespace<CR>
let g:show_spaces_that_precede_tabs=1
let g:better_whitespace_skip_empty_lines=1

set statusline^=%{FugitiveStatusline()},%{coc#status()},%{get(b:,'coc_current_function','')}

" vim-devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

function SemshiDark()
    hi semshiLocal           ctermfg=209 guifg=#ff875f
    hi semshiGlobal          ctermfg=215 guifg=#E5C07B
    hi semshiImported        ctermfg=214 guifg=#E5C07B cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#61AFEF cterm=italic gui=italic
    hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#c678dd
    hi semshiBuiltin         ctermfg=207 guifg=#c678dd
    hi semshiAttribute       ctermfg=49  guifg=#56B6C2
    hi semshiSelf            ctermfg=249 guifg=#E5C07B cterm=bold gui=bold
    hi semshiUnresolved      ctermfg=226 guifg=#D19A66 cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#be5046
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#be5046
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#be5046
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call SemshiDark()
autocmd ColorScheme * call SemshiDark()

" better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" echodoc
let g:echodoc#enable_at_startup=1
let g:semshi#active=1

" gitlab
let g:fugitive_gitlab_domains = ['https://git.kopismobile.org']

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.file/.vim/bundle')

	Plug 'Shougo/neco-vim'
	Plug 'Shougo/echodoc.vim'

	Plug 'neoclide/coc-neco'
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-markdown'
    Plug 'tpope/vim-vividchalk'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-eunuch'

    Plug 'glts/vim-radical'
    Plug 'glts/vim-magnum'

    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'godlygeek/tabular'
    Plug 'airblade/vim-gitgutter'
    Plug 'fatih/vim-go'
    Plug 'luochen1990/rainbow'
    Plug 'dense-analysis/ale'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'jiangmiao/auto-pairs'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'ryanoasis/vim-devicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'kien/ctrlp.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'lervag/vimtex'
    Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()
