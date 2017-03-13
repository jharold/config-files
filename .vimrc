"----------------
" Color Schemes |
"----------------
" colorscheme bvemu 
" colorscheme Mustang
" colorscheme base16-atelier-cave
" colorscheme base16-dracula
" colorscheme base16-hopscotch
colorscheme base16-solar-flare

" Theme randomizer:
"
"let schemes = 'base16-apathy base16-atelier-cave base16-atelier-heath base16-atelier-lakeside base16-dracula base16-hopscotch base16-paraiso base16-solar-flare base16-summerfruit-dark base16-unikitty-dark cgpro chance-of-storm'

"let seconds = str2nr(strftime('%S'))
 
"execute 'colorscheme '.split(schemes)[seconds%11]
"redraw

"---------------
" Tab Settings |
"---------------
set backspace=2       " Change the behavior of BS.  Same as :set backspace=indent,eol,start
set expandtab         " Expand <TAB> characters into spaces.
set shiftwidth=2      " The number of columns text will be indented using reindent operations.
set softtabstop=2     " Insert this many spaces when tab or backspace is pressed while in insert mode.
set tabstop=2         " The number of spaces/columns that are shown per <TAB> character.
                      " To see <TAB> characters visually, type "set list."

"--------------
" UI Settings |
"--------------
filetype indent on    " Enable language specific indentation schemes based on filetype.
set background=dark   " Enable the dark version of the current colorscheme
set backupcopy=yes    " On write: Make a copy of the file and overwrite the original one
set laststatus=2      " Show statusline always, needed to display airline status persistently.
"set lazyredraw       " Redraw the screen sparingly.
set number            " Show line numbers.
set showcmd           " Show the last command entered (bottom right.)
set showmatch         " Highlights matching [, {, or (.
set termguicolors     " Enable 24-bit color
set wildmenu          " Visual tab completion for command menu.
syntax on             " Turn on syntax highlighting.

"------------------
" Search Settings |
"------------------
set incsearch         " Live search that updates as each character is entered.
set hlsearch          " Matches are highlighted.
nnoremap <leader><space> :nohlsearch<CR> 
                      " Turn off search highlighting (hold \ and press space).
"----------------
" Fold Settings |
"----------------
"set foldenable        " Enable folding.
"set foldlevelstart=10 " Sets the fold level to a reasonable default.
"set foldmethod=indent " Fold based on indent level.
"set foldnestmax=10    " Sets the max number of folds.
"nnoremap <space> za   " Opens/closes folds.

filetype on
filetype plugin indent on 
set autoindent
set autowrite
set hidden
set ignorecase
set mouse=a
set nocp              " No compatible.
set ruler             " Show line and column numbers in the status bar.
set smartcase
" set paste            " Setting this will cause 'set ruler' to not load properly from .vimrc, 
                       " as well as insert unwanted metacharacters when pressing <TAB>.

"--------------------
" Pathogen Settings |
"--------------------
call pathogen#infect()
call pathogen#helptags()

"-------------------
" Airline Settings |
"-------------------

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 0       " disable tabline at top of window.
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'raven'

"------------
" Syntastic | 
"------------

autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
"let g:syntastic_disabled_filetypes=['java']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_error_symbol = "✗"

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1                  " Check for syntax errors on open
"let g:syntastic_check_on_wq = 0                    " Check for syntax errors on save (0 = disabled)
