syntax on
syntax enable

if has('nvim')
    let g:airline_theme='onedark'
    colo onedark
    let g:onedark_terminal_italics = 1

    " syntax highlighting font style
    hi Comment cterm=italic gui=italic guifg=#5C6370 ctermfg=59
    hi String cterm=italic gui=italic
    let g:python3_host_prog='/home/tdo/.pyenv/versions/py39/bin/python3'
endif

" vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" vim-go
let g:go_highlight_structs                = 1
let g:go_highlight_methods                = 1
let g:go_highlight_operators              = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_functions              = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_types                  = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_variable_declarations  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_fold_enable                      = ['block', 'import', 'varconst', 'package_comment']

" vim-airline
let g:airline#extensions#tabline#enabled          = 1
let g:airline_powerline_fonts                     = 1
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline#extensions#tabline#buffer_idx_mode  = 1
let g:airline#extensions#coc#enabled              = 1
let g:airline#extensions#tabline#formatter        = 'default'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols - defaults to this for non patched fonts
let g:airline_left_sep           = '»'
let g:airline_left_sep           = '▶'
let g:airline_right_sep          = '«'
let g:airline_right_sep          = '◀'
let g:airline_symbols.crypt      = '🔒'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.linenr     = '␤'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.maxlinenr  = '☰'
let g:airline_symbols.maxlinenr  = ''
let g:airline_symbols.branch     = '⎇'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.paste      = 'Þ'
let g:airline_symbols.paste      = '∥'
let g:airline_symbols.spell      = 'Ꞩ'
let g:airline_symbols.notexists  = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols - defaults to this for patched fonts
let g:airline_left_sep         = ''
let g:airline_left_alt_sep     = ''
let g:airline_right_sep        = ''
let g:airline_right_alt_sep    = ''
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = ''

" vim-markdown-composer
let g:markdown_composer_autostart=0

" ctrl-p
if executable('rg')
	set grepprg=rg\ --color=never
	let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	let g:ctrlp_use_caching  = 0
endif

" rainbow
let g:rainbow_active = 1

" Tabular
nmap <leader>a :Tab /
vmap <leader>a :Tab /

" vim-devicons
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" gitlab
let g:fugitive_gitlab_domains = ['https://git.kopismobile.org']

" rust
let g:rustfmt_autosave          = 1
let g:rust_clip_command         = 'xclip -selection clipboard'

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

let g:gitgutter_grep = 'rg --color=never'

set statusline^=%{FugitiveStatusline()}

call plug#begin('~/.config/nvim/bundle')

    Plug 'neovim/nvim-lsp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-markdown'
    Plug 'tpope/vim-capslock'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-eunuch'

    Plug 'glts/vim-radical' " number converter, gA, crd, crx, cro, crb - decimal, hex, octa, binary respectively
    Plug 'glts/vim-magnum'

    Plug 'rust-lang/rust.vim'
    Plug 'mattn/webapi-vim'
    Plug 'cespare/vim-toml'

    Plug 'shumphrey/fugitive-gitlab.vim'
    Plug 'godlygeek/tabular'
    Plug 'airblade/vim-gitgutter'
    Plug 'fatih/vim-go'
    Plug 'luochen1990/rainbow'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'majutsushi/tagbar'
    Plug 'ap/vim-css-color'
    Plug 'euclio/vim-markdown-composer', {'do': function('BuildComposer')}

    Plug 'joshdick/onedark.vim'
    Plug 'KeitaNakamura/neodark.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

:lua << EOF
    local nvim_lsp = require'nvim_lsp'
    nvim_lsp.pyls.setup{}
    nvim_lsp.rust_analyzer.setup{}
    nvim_lsp.sqlls.setup{}
    nvim_lsp.vimls.setup{}
    nvim_lsp.bashls.setup{}
    nvim_lsp.jsonls.setup{}
    nvim_lsp.yamlls.setup{}
EOF
