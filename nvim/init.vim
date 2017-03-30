" Load up all the plugins
call plug#begin('~/.vim/plugged')
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'vim-syntastic/syntastic'
" Colorschemes
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'fcpg/vim-orbital'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
call plug#end()

syntax enable
filetype plugin indent on

colorscheme gruvbox
set background=dark

set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set bs=2
set ts=4
set sw=4
set nocompatible
set history=9999
set incsearch
set splitbelow
set splitright
set matchtime=5
set showmatch
set noswapfile
set nobackup
set nowritebackup
set wildmenu
set nu
set tags=./tags;/
set wrap
set linebreak
set nolist
set colorcolumn=100
set textwidth=100
set clipboard=unnamed

" Simple function to make it easier to toggle the background color
function BackgroundToggle()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <silent> <C-f> :BLines<CR>
map <silent> <C-n> :FZF!<CR>
map <silent> <F4> :call BackgroundToggle()<CR>
map <silent> <F12> :VimShell<CR>
map <F7> mzgg=G`z<CR>
map <silent> <F8> :TagbarToggle<CR>
map <silent> <F9> :NERDTreeToggle<CR>
map <silent> <ESC> :pclose<CR>:lclose<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50
let g:deoplete#enable_smart_case = 1

let g:neosnippet#enable_completed_snippet = 1

" Fixes for airline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'

let g:rustfmt_autosave = 1

let g:racer_cmd = "/home/jl/.cargo/bin/racer"
let g:racer_experimental_completer = 1
