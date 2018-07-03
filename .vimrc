set nocompatible      " Disable vi compatibility.  When unset, various options are set to make vim
                      " more useful.  This option should be listed first in .vimrc.
filetype on           " Enable file type detection (recommended when nocp is set).
filetype plugin on    " Enable plugin files for specific file types.
set backupcopy=yes    " On write: Make a copy of the file and overwrite the original one.
set hidden            " Buffers become hidden when abandoned rather than being unloaded.
"set updatetime=1000   " Milliseconds of inactivity before the swap file is written to disk.

"---------
" Mapping 
"---------

"let mapleader = ','   " Defines the key mapped to <leader>.  Default is '\'.
"let maplocalleader = mapleader
nn <leader>sv :source $MYVIMRC<cr>
                      " Source / reload .vimrc.
"{}
"  ino     {<CR>       {<CR>}<Esc>ko<Tab>
"  ino     {<Space>    {<Space><Space>}<Left><Left>
"[]
"  ino     [           []<Left>
"  ino     [[          []<Left>
"  ino     []          []<Left>
"()
"  ino     (           ()<Left>
"  ino     ((          ()<Left>
"  ino     ()          ()<Left>
"<>
"  ino     <           <><Left>
"  ino     </          </><Left>
"''
"  ino     '           ''<Left>
"  ino     ''          ''<Left>
"""
"  ino     "           ""<Left>
"  ino     ""          ""<Left>

"-----------------------------
" Abbreviations / Autocorrect 
"-----------------------------

iabbrev vopd void     

"------------------
" Airline Settings 
"------------------

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 0       " disable tabline at top of window.
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'jellybeans'

"----------------
" Color Settings 
"----------------

set background=dark   " Enable the dark version of the current colorscheme.
                      " Below settings may be necessary for displaying 256 colors in vim while 
                      " using tmux / putty.  
                      " Note 1: Set these as well as termguicolors before setting a colorscheme.
                      " Note 2: <Ctrl-V><Esc> inserts an escape character ().
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum
set termguicolors     " Enable 24-bit color.
set t_ut=             " Use the current background color when unset (fix striping issue in themes). 
 
" colorscheme base16-atelier-cave
" colorscheme base16-dracula
" colorscheme base16-hopscotch
" colorscheme base16-paraiso
colorscheme base16-solarflare
" colorscheme bvemu 
" colorscheme Mustang

"----------------------
" Commands / Functions 
"----------------------

command! Jsonpretty %!python -m json.tool
command! Prettyjson Jsonpretty

nnoremap <s-l> :set list!<CR>
nnoremap <s-tab> :call RevealTabs()<CR>

let g:syntax_state = 1
autocmd VimEnter * :let g:original_syntax=&syntax
function! RevealTabs()
  if g:syntax_state
    setlocal syntax=whitespace
    let g:syntax_state = 0
  else
    execute 'set syntax=' . g:original_syntax
    let g:syntax_state = 1
  endif
endfunction

"---------------
" Fold Settings 
"---------------

"set foldenable        " Enable folding.
"set foldlevelstart=10 " Set the fold level.
"set foldmethod=indent " Fold based on indent level.
"set foldnestmax=10    " Set the max nesting level of folds.
"nnoremap <space> za
                       " Open / close folds.

"----------------------
" Indentation Settings 
"----------------------

filetype indent on    " Enable language specific indentation schemes based on filetype.
set autoindent        " Copy indentation from the previous line when starting a new line.
set shiftwidth=2      " The number of columns that text will be indented when using reindent
                      " operations.
set shiftround        " Round indent to a multiple of shiftwidth when using > and < commands.

"-----------------
" Search Settings 
"-----------------

set hlsearch          " Matches are highlighted.
set ignorecase        " Case is ignored when searching.
set incsearch         " Live search that updates as each character is typed.
set smartcase         " Override ignorecase when the search pattern contains uppercase characters
nnoremap <leader><space> :nohlsearch<CR> 
                      " Clear search highlights (hold \ and press space).

"---------------------
" Syntax highlighting 
"---------------------

syntax on             " Enable syntax highlighting.
set showmatch         " Highlight matching pairs - [], {}, and ().

"--------------
" Tab Settings 
"--------------

set backspace=2       " Allow backspacing over autoident, line breaks, and start of insert.
set expandtab         " Expand <Tab> characters into spaces.
set softtabstop=2     " The number of spaces that are inserted when pressing tab or backspace.
set tabstop=2         " The number of spaces shown per <Tab> character.

"-------------
" UI Settings 
"-------------

"set cmdheight=2       " Set the height of the command mode entry area.
set laststatus=2      " Always show the statusline (needed to display airline status continuously).
"set lazyredraw        " Disable screen redraw when executing non-typed commands.
                      " (e.g. macros or registers)
set mouse=a           " Enable mouse for normal, visual, insert and command-line modes
set nowrap            " Disable line wrapping for lines longer than the width of the window.
set number            " Show line numbers.
map <2-LeftMouse> :se nonu!<CR>
                      " Toggle line numbers by double left-clicking.
set ruler             " Show line and column numbers in the status bar.
"set shortmess=a       " Abbreviate file messages.
set showcmd           " Show the last command entered (bottom right).
set signcolumn=yes    " Show the sign column (for vim-gitgutter).
set title             " Set the title bar string.
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
set wildignore=*.swp  " Ignore these file types.
set wildmenu          " Display a menu when tab completing partially entered commands.

"-------------------
" Pathogen Settings 
"-------------------
"call pathogen#infect()
"call pathogen#helptags()

"-----------
" Syntastic 
"-----------

"autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
"let g:syntastic_disabled_filetypes=['java']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_error_symbol = "✗"

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1                  " Check for syntax errors on open
"let g:syntastic_check_on_wq = 0                    " Check for syntax errors on save (0 = disabled)

"----------
" Vim-Plug 
"----------

call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  "Plug 'Valloric/YouCompleteMe'
  Plug 'tpope/vim-surround'
  Plug 'majutsushi/tagbar'
call plug#end()
