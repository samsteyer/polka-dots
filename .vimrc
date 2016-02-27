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
set guifont=droid\ sans\ mono\ 8
set wrap
set linebreak
set nolist
set colorcolumn=100
"set textwidth=100
"set wrapmargin=0
colorscheme twilight

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

"nnoremap <C-w>     :tabclose<CR>
"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <F7> mzgg=G`z<CR>
nmap <F8> :TagbarToggle<CR>
map <F9> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.space="\u3000"
