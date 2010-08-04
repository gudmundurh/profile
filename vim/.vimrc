" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set ts=4
set sw=4
set sts=4

syntax on
set nu
set mouse=a
set expandtab 

"auto BufEnter * let &titlestring = hostname() . "/" . expand("%:p")
"set title titlestring=%<%F%=%l/%L-%P titlelen=70
set title

set ruler
set backspace=start,indent,eol

set hlsearch

" fix til að VIM birti titilinn undir screen (notar sömu gildi og fyrir xterm)
" Ath.: nota C-V x  til að fá escape staf fyrir x
if &term == 'screen'
  set t_ts=]2;
  set t_fs=
endif

"color darkblue

"function! PoundComment()
"  map - 0i# 
"  map _ :s/^\s*# \=//g<Enter>
"  set comments=:#
"endfunction
"autocmd FileType perl call PoundComment()
"autocmd BufEnter * doautocmd FileType

" Slökkva/kveikja á mús og ýmsu til að auðvelda afritun í xterm 
function! ToggleMouse()
  if &mouse == 'a' 
    set paste
    set nonu
    set mouse=
  else
    set mouse=a
    set nu
    set nopaste
  endif
endfunction

map <F12> :set indentexpr= ft=mason<Enter>
map <F11> :nohlsearch<Enter>
map <F10> :call ToggleMouse()<Enter>
map <F9> 100

map _a :set indentexpr= ft=mason<Enter>
map __ :nohlsearch<Enter>
map _s :call ToggleMouse()<Enter>



set ignorecase

source ~/.vim/line_cmt.vim

"au Filetype html,xml,xsl source ~/vimfile/closetag.vim

set nohidden
