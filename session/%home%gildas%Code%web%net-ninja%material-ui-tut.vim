let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/net-ninja/material-ui-tut
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +20 src/App.js
badd +2 src/index.css
badd +2 src/index.js
badd +37 package.json
badd +44 src/pages/Create.js
badd +11 data/db.json
badd +43 src/pages/Notes.js
badd +42 ~/Code/web/net-ninja/material-ui-tut/src/components/NoteCard.js
badd +87 ~/Code/web/net-ninja/material-ui-tut/src/components/Layout.js
argglobal
%argdel
edit src/pages/Notes.js
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
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
argglobal
balt src/pages/Create.js
let s:l = 43 - ((42 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 43
normal! 04|
wincmd w
argglobal
if bufexists(fnamemodify("data/db.json", ":p")) | buffer data/db.json | else | edit data/db.json | endif
if &buftype ==# 'terminal'
  silent file data/db.json
endif
balt src/pages/Create.js
let s:l = 18 - ((17 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
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
