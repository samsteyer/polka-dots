" Load up all the plugins
call plug#begin('~/.vim/plugged')
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'python/black'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'vim-scripts/excel.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'chr4/nginx.vim'
Plug 'janko-m/vim-test'
Plug 'neomake/neomake'
Plug 'gbigwood/Clippo'
" Colorschemes
Plug 'flazz/vim-colorschemes' " One to rule them all?
Plug 'freeo/vim-kalisi'
Plug 'morhetz/gruvbox'
Plug 'fcpg/vim-orbital'
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
call plug#end()

syntax enable
filetype plugin indent on

colorscheme hybrid_material
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
set tags=~/.tags;/
set wrap
set linebreak
set nolist
set colorcolumn=100
set textwidth=100
set clipboard=unnamed
let g:prettier#config#tab_width = 2
let g:prettier#config#print_width = 80

" Simple function to make it easier to toggle the background color
" function BackgroundToggle()
"     if &background == "light"
"         set background=dark
"     else
"         set background=light
"     endif
" endfunction

nnoremap <C-S-k> ddkP
nnoremap <C-S-j> ddp
vnoremap <C-S-k> xkP`[V`]
vnoremap <C-S-j> xp`[V`]

nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Super tab navigation!
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>e :tabedit<space>
nnoremap <C-t>d :tabclose<CR>
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt
" For now, comment this out, as it tends to duplicate the first tab
" autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

" Terminal customizations
tnoremap <Esc> <C-\><C-n>
map <silent> <C-\> :vsplit term://bash<CR> i

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open location panel
        lopen
    endif
endfunction

function! ToggleTests()
    let old_last_winnr = winnr('$')
    cclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open quickfix panel
        copen
    endif
endfunction

" Location/quickfix list customizations
nnoremap <silent> <C-e> :<C-u>silent! call ToggleErrors()<CR>
nnoremap <silent> <C-q> :<C-u>silent! call ToggleTests()<CR>

map <silent> <C-f> :Lines<CR>
map <silent> <C-t> :Tags<CR>
map <silent> <C-n> :FZF<CR>
map <silent> <F4> :call BackgroundToggle()<CR>
map <F7> mzgg=G`z<CR>
map <silent> <F8> :TagbarToggle<CR>
map <silent> <F9> :NERDTreeToggle<CR>
map <silent> <ESC> :pclose<CR> :lclose<CR> :cclose<CR>

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * Neomake
autocmd BufWritePre *.py execute ':Black'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier
autocmd! BufWritePost * Neomake
autocmd BufWritePost *.py PyTest
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType yml setlocal ts=2 sts=2 sw=2

let g:python_host_prog = '/usr/local/bin/python2'
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python2'
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50
let g:deoplete#enable_smart_case = 1

let g:neosnippet#enable_completed_snippet = 1

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
let g:airline_theme = "hybrid"

set statusline+=%#warningmsg#
set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_tabs_not_buffers = 1
" The most jarring, obnoxious part of jedi-vim
let g:jedi#smart_auto_mappings = 0

let g:fzf_tags_command = 'ctags -R -a -f ~/.tags'
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'esc': 'close',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:neomake_open_list = 0
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_python_flake8_maker = { 'args': ['--max-line-length=100'], }
" let g:neomake_javascript_enabled_makers = ['eslint']
let test#strategy = 'neomake'
let test#python#runner = 'pytest'
let g:test#runner_commands = ['PyTest']

let g:rustfmt_autosave = 1

let g:racer_cmd = '/home/jl/.cargo/bin/racer'
let g:racer_experimental_completer = 1

let g:jedi#completions_enabled = 0
