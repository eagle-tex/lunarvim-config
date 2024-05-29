let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/_my-projects/rumbaysabor-react-ts-v0
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/index.css
badd +2 ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/main.css
badd +2 ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/main.tsx
badd +3 ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/App.tsx
argglobal
%argdel
edit ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/index.css
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
balt ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/main.css
let s:l = 2 - ((1 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/App.tsx", ":p")) | buffer ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/App.tsx | else | edit ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/App.tsx | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/App.tsx
endif
balt ~/Code/web/_my-projects/rumbaysabor-react-ts-v0/src/main.tsx
let s:l = 3 - ((2 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 035|
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
