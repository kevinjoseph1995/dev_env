set nocompatible
filetype off

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'preservim/nerdtree'
call plug#end()


set autoread              " Reload files that have not been modified
set backspace=2           " Makes backspace not behave all retarded-like
set laststatus=2          " Always show the status bar
set number
set t_Co=256              " Use 256 colors
set scrolloff=999         " Keep the cursor centered in the screen
set showmatch             " Highlight matching braces
set showmode              " Show the current mode on the open buffer
set splitbelow            " Splits show up below by default
set splitright            " Splits go to the right by default
set title                 " Set the title for gvim
set encoding=utf8


" Format on save
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/tools/clang-format.py
endfunction
autocmd BufWritePre *.cuh,*.cu,*.h,*.cc,*.cpp call Formatonsave()

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
let g:NERDTreeWinPos = "left"

nmap <C-T> :NERDTreeFind<CR>
nmap <C-f> :Rg <CR>
nmap <C-p> :Files <CR>
nmap <C-h> :tabprevious <CR>
nmap <C-l> :tabnext  <CR>
nmap <C-n> :tabnew <CR>
