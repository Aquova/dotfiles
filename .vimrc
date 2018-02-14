" Austin Bricker vimrc

set background=dark
let &t_Co=256 " Enables true color in Terminal
colorscheme solarized

" Enables Pathogen plugin helper
execute pathogen#infect()

syntax enable           " Turn on syntax highlighting
set encoding=utf-8

set tabstop=4           " Num of spaces in tab
set softtabstop=4       " Num of spaces in tab when editing
set shiftwidth=4        " Indenting with '>'
set expandtab           " Tabs are spaces
set breakindent         " Word wrap indents to prior indent spot

set number              " Shows line numbers
set showcmd             " Shows most recent command

set cursorline          " Highlights current line
filetype indent on      " Load filetype-specific indent files

set wildmenu            " Visual autocomplete for command menu
set lazyredraw          " Only redraw when needed

set showmatch           " Highlight matching [{()}]

set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

set mouse=a             " Enables the mouse in terminal Vim
set conceallevel=0      " All text is shown

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Moves vertically by visual line, not literal
nnoremap j gj
nnoremap k gk

" Remaps beginning/end of line
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

" Remap J and K to move between non-hidden buffers
nnoremap J :bp<CR>
nnoremap K :bn<CR>

" Now remap gJ to the old J function
nnoremap gJ J <CR>

" ' isn't working for marks by default for some reason
nnoremap ' `

" jk is escape
inoremap jk <esc>

" Q reruns last macro
nnoremap Q @@

" Easily add empty lines
nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Set leader to ,
let mapleader=","

" Loads vimrc bindings
nnoremap <leader>sv :source $MYVIMRC<CR>

" Center text after jumping to beginning/end of window
nnoremap L L<bar>zz <CR>
vnoremap L L<bar>zz <CR>
nnoremap H H<bar>zz <CR>
vnoremap H H<bar>zz <CR>

" Replace typing :noh
nnoremap <leader><space> :noh<CR>

" % is annoying
nnoremap <tab> %
vnoremap <tab> %

" Create function that removes trailing whitespace
fun! RemoveWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Can remove whitespace by calling ':RemoveWhitespace'
command! RemoveWhitespace call RemoveWhitespace

" Can call RemoveWhitespace with Leader-w
:noremap <Leader>w :call RemoveWhitespace()<CR>

" Calls RemoveWhitespace when buffer is written
autocmd BufWritePre * :call RemoveWhitespace()


" Vim plugin configs:
" Enables vim-airline buffer list by default
let g:airline#extensions#tabline#enabled = 1
" Custom tabline settings
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'Buf: %{bufnr("%")}'

" Commenting codes for commentary.vim:
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType htmldjango setlocal commentstring=<!--\ %s\ -->
autocmd FileType pico8 setlocal commentstring=--\ %s
autocmd FileType lua setlocal commentstring=--\ %s

" Different tab behavior for different filetype
autocmd FileType pico8 setlocal shiftwidth=1 tabstop=1 softtabstop=1

" Airline tab theme settings
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set guifont=Roboto\ Mono\ for\ Powerline:h11
" Fixes messed up symbols with powerline tab font
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
