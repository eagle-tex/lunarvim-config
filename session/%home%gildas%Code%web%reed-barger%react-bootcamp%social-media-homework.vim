let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/reed-barger/react-bootcamp/social-media-homework
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/index.css
badd +22 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/App.jsx
badd +11 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/index.js
badd +11 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/components/Header.jsx
badd +27 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/components/CreatePost.jsx
badd +15 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/components/Login.jsx
badd +2 src/components/Post.jsx
badd +5 src/components/PostList.jsx
badd +21 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/.editorconfig
badd +14 ~/Code/web/reed-barger/react-bootcamp/social-media-homework/package.json
argglobal
%argdel
edit ~/Code/web/reed-barger/react-bootcamp/social-media-homework/package.json
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
balt ~/Code/web/reed-barger/react-bootcamp/social-media-homework/.editorconfig
let s:l = 14 - ((8 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("src/components/PostList.jsx", ":p")) | buffer src/components/PostList.jsx | else | edit src/components/PostList.jsx | endif
if &buftype ==# 'terminal'
  silent file src/components/PostList.jsx
endif
balt ~/Code/web/reed-barger/react-bootcamp/social-media-homework/src/components/CreatePost.jsx
let s:l = 14 - ((13 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 03|
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