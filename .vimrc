execute pathogen#infect()
syntax on
filetype plugin indent on
set bs=2
set smartindent
set ts=4
set sw=4
set nocompatible
set history=9999
set incsearch
set splitbelow
set splitright
set showcmd
set matchtime=5
set showmatch
set noswapfile
set nobackup
set nowritebackup
set wildmenu
set nu
set autochdir
set tags=./tags;/
set wrap
set linebreak
set nolist
set colorcolumn=100
colorscheme twilight

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <F7> mzgg=G`z<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
