
"------------------------------------------------------------------------------ 
" My vim config
"------------------------------------------------------------------------------ 

" [ General config. ] {{{

let mapleader=","                                " Leader key: comma

" }}}

" [ Plug ] {{{
call plug#begin()

Plug 'scrooloose/syntastic'

" [ Plug | Navigation ] {{{

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' } 
" }}}

" [ Plug / Style ] {{{

Plug 'dracula/vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" }}}

call plug#end()
" }}}

" [ Declutter ] {{{

" No annoying sound on errors.
set noerrorbells " Don't play sounds
set novisualbell " Don't flash the screen

" }}}

" [ Navigation ] {{{

" Force yourself not to use the arrow keys. At least for the NORMAL mode.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Visual autocomplete for command menu.
set wildmenu

" [ Navigation | NERD Tree ] {{{

" Use C-n to toggle the tree
map <C-n> :NERDTreeToggle<CR>

" }}}

" [ Navigation | Splits ] {{{

" More natural splitting
set splitbelow
set splitright

" }}}

" }}}

" [ Code editing ] {{{

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" [ Indentation ] {{{

" Tabs
set expandtab                                    " Tabs are spaces.
set tabstop=4                                    " Show tabs as 4 spaces.
set softtabstop=4                                " Insert 4 spaces.

filetype indent on                               " load filetype-specific 
                                                 " indent files.

" Max width
set textwidth=78                                 " Use 78 cols of text
set colorcolumn=+1                               " highlight column after
                                                 " 'textwidth'
" }}}

" [ Code folding ] {{{

set foldenable                                   " Enable code folding
set foldnestmax=10                               " 10 nested fold max.
set foldmethod=marker                            " Fold based on markers. 

" }}}

" [ Style ] {{{

" Color Scheme 
syntax enable                                    " Enable syntax highlighting.
set background=dark                              " Use a dark background.
colorscheme dracula                              " I like that color scheme.

" Airline
let g:airline_powerline_fonts = 1                " Use fancy symbols
let g:airline_theme = 'dracula'                  " Use the same color scheme. 

let g:airline#extensions#tabline#enabled = 1     " Tab bar
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" }}}
