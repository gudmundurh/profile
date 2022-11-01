set nocompatible
source ~/projects/profile/vim/skwp.vim

"Make * available in visual mode
vnoremap <silent> * y:let @/=@"<cr>:set hlsearch<cr>

"Make dot available in visual mode
vnoremap <silent> . :norm .<cr>

" Change regex search to use "magic", similar to how modern day regexes
" behave
nnoremap / /\v
vnoremap / /\v

" Clear search highlight
nnoremap <leader><space> :noh<cr>

" Persistent undo and auto save
au FocusLost * :wa
set undofile

" Exotic but relevant! (try it)
set relativenumber

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clipboard copy in visual:
vnoremap <C-c> "*y

" Clipboard paste in insert mode, preserving indent:
inoremap <C-v> <C-r><C-p>*

call plug#begin()
Plug 'junegunn/goyo.vim' " Focus mode ala iA Writer
Plug 'vim-airline/vim-airline' " status line
Plug 'vim-airline/vim-airline-themes' 
Plug 'markonm/traces.vim' " Highlight regex matches
Plug 'tpope/vim-surround'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

colorscheme codedark

" Configuring NERD Tree
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>l :NERDTreeFind<CR>

nnoremap <leader>g :Goyo<CR>

set mouse=a
