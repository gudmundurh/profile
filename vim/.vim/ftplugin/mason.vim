" Indentation for Mason code: Takes care of lines starting with '%'
" 
" gh@mbl.is / 2006-12-13
"
" BUGS: 
"   1. Should use &shiftwidth instead of &tabstop, as VIM does by default
"   2. The mappings for < and > don't behave exactly like VIM's defaults
function! IndentString(dir, s) 
  let tc = '\t'
  if &expandtab
    let i = 0
    let tc = ''
    while i < &tabstop
      let tc .= ' '
      let i += 1
    endwhile
  endif
   
  if a:dir == 1 
    return tc . a:s
  else
    if a:s =~ "^\t" 
      return a:s[1:] 
    elseif a:s =~ '^' . tc
      return a:s[len(tc):]
    else 
      return a:s
    endif 
  endif
endfunction


function! MasonIndent(dir) range
  let n = a:firstline

  while n <= a:lastline 
    let l = getline(n)
    if l =~ "^%"
      call setline(n, "%" . IndentString(a:dir, l[1:]))
    else
      call setline(n, IndentString(a:dir, l))
    endif
    let n = n + 1
  endwhile

endfunction


noremap <buffer> <unique> <F5> :call MasonIndent(-1)<Enter>
noremap <buffer> <unique> <F6> :call MasonIndent(1)<Enter>
