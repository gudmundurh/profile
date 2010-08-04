" Comments or uncomments lines with single line comments,
" identified by cmt_char. Lines are commented out unless 
" every line in the range starts with a comment.
"
" gh@mbl.is / 2006-10-19
function! LineCmt(cmt_char) range
  let n = a:firstline
  let ins = 0 " assume that all lines are comments
  while n <= a:lastline 
    if getline(n) !~ '^' . a:cmt_char
      let ins = 1 " we found a line which isn't a comment
      break
    endif
    let n = n + 1
  endwhile

  let n = a:firstline
  while n <= a:lastline
    if ins 
      call setline(n, a:cmt_char . " " . getline(n))
    else
      call setline(n, substitute(getline(n), "^" . a:cmt_char . " ", "", ""))
    endif
    let n = n + 1
  endwhile
endfunction

function! SetLineCmtChar()
  if &filetype == "vim"
    let b:linecmtchar='"'
  elseif &filetype == "javascript" || &filetype == "html" || &filetype == "xhtml"
    let b:linecmtchar='//'
  elseif &filetype == "psql" || &filetype == "sql"
    let b:linecmtchar='--'
  else " perl, mason, sh...
    let b:linecmtchar='#'
  endif
endfunction

let b:linecmtchar='#'
au FileType * call SetLineCmtChar()

" these mappings work best with visual selections, for custom
" ranges you need to call :{range}call LineCmt("#") manually
map <F8> :call LineCmt(b:linecmtchar)<Enter>
map <F7> :call LineCmt("%#")<Enter>
