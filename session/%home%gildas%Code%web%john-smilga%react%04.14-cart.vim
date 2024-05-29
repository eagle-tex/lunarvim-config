let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/john-smilga/react/04.14-cart
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +12 ~/Code/web/john-smilga/react/04.14-cart/index.html
badd +204 ~/Code/web/john-smilga/react/04.14-cart/src/index.css
badd +0 ~/Code/web/john-smilga/react/04.14-cart/src/data.jsx
argglobal
%argdel
edit ~/Code/web/john-smilga/react/04.14-cart/src/data.jsx
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/Code/web/john-smilga/react/04.14-cart/src/index.css
let s:l = 5 - ((4 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/john-smilga/react/04.14-cart/src/index.css", ":p")) | buffer ~/Code/web/john-smilga/react/04.14-cart/src/index.css | else | edit ~/Code/web/john-smilga/react/04.14-cart/src/index.css | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/john-smilga/react/04.14-cart/src/index.css
endif
balt ~/Code/web/john-smilga/react/04.14-cart/index.html
let s:l = 17 - ((16 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 02|
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
