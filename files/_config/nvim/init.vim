" editing options
set shiftwidth=4
set expandtab
set textwidth=0
set timeoutlen=600
" indentation settings
set copyindent
set cinoptions=:0,l1,b1,g0,i0,(1s,U1,Ws,m1,j1,J1
set cinkeys+=0=break
" search and display
set showmatch
set hlsearch
set incsearch
set showcmd
set cursorline
" windowing
set hidden
set number
set scrolloff=3
set ruler
set title
" misc
set nobackup
set noerrorbells
set novisualbell
set shortmess+=I

" color scheme
let g:airline_theme='catppuccin'
colorscheme catppuccin-frappe

" leader keys
let mapleader="\<Space>"
let maplocalleader="\\"

" window movement mappings
noremap <C-h> <C-w>h
inoremap <C-h> <C-o><C-w>h
noremap <C-j> <C-w>j
inoremap <C-j> <C-o><C-w>j
noremap <C-k> <C-w>k
inoremap <C-k> <C-o><C-w>k
noremap <C-l> <C-w>l
inoremap <C-l> <C-o><C-w>l
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <S-j> :bnext<CR>
nnoremap <S-k> :bprevious<CR>

" custom leader commands
nnoremap <Leader>w :bdelete<CR>
nnoremap <Leader>W :bdelete!<CR>
nnoremap <Leader>q :hide<CR>
nnoremap <Leader>e :enew<CR>
nnoremap <Leader>d :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>/ :nohlsearch<CR>

" vertical movements by screen line
nnoremap j gj
nnoremap k gk

" save-as-root hack
" http://unix.stackexchange.com/a/251063/1664
cnoremap w!! call SudoSaveFile()
function! SudoSaveFile() abort
    execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee sudo -e % >/dev/null'
    let &modified = v:shell_error
endfunction

" accidential aliases
cnoreabbrev W w
cnoreabbrev Q q

" airline statusline
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"

" indenthtml settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
