set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" Setup fzf
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


"Set theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark    " Setting dark mode

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
let g:NERDTreeWinPos = "left"

" New splits to the right  and bottom
set splitbelow
set splitright
"Show line numbers
set number
set encoding=utf8
if (has("termguicolors"))
  set termguicolors
endif

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>'] "Use CTRL+Y or Enter to selct a auto-complete recommendation
nmap <C-D> :YcmCompleter GoTo <CR>

" Mappings
" Split navigation
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


nmap <CS-F> :Rg <CR>
nmap <CS-P> :Files <CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction
nmap <C-T> :call ToggleNerdTree()<CR>




