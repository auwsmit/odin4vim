" Forked from https://github.com/habamax/vim-odin
" License: VIM LICENSE

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = 'setlocal commentstring<'
      \ . '| setlocal comments<'
      \ . '| setlocal suffixesadd<'
      \ . '| exe "nunmap <buffer> ]]"'
      \ . '| exe "xunmap <buffer> ]]"'
      \ . '| exe "nunmap <buffer> [["'
      \ . '| exe "xunmap <buffer> [["'

setlocal suffixesadd=.odin
setlocal commentstring=//\ %s
setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal errorformat=%f(%l:%c)\ %m

function! s:SearchProc(count, ...) abort
  let direction = a:0 ? a:1 : ''
  let cnt = a:count

  while cnt != 0 && search('\v<\w*>(\s*::\s*proc)@=', direction . 'W') > 0
    let cnt -= 1
  endwhile
endfunction

nnoremap <buffer> ]] :<C-u>call <SID>SearchProc(v:count1)<CR>
xnoremap <buffer> ]] :<C-u>call <SID>SearchProc(v:count1)<CR>
nnoremap <buffer> [[ :<C-u>call <SID>SearchProc(v:count1, 'b')<CR>
xnoremap <buffer> [[ :<C-u>call <SID>SearchProc(v:count1, 'b')<CR>

let &cpo = s:cpo_save
unlet s:cpo_save
