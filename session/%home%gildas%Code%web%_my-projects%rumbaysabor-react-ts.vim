let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/_my-projects/rumbaysabor-react-ts
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +21 ~/Code/web/_my-projects/rumbaysabor-react-ts/src/hooks/useMediaQuery.ts
badd +1 ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/Link.tsx
badd +24 ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx
badd +1 ~/Code/web/_my-projects/rumbaysabor-react-ts/src/shared/types.ts
badd +14 ~/Code/web/_my-projects/rumbaysabor-react-ts/src/index.css
badd +10 ~/Code/web/_my-projects/rumbaysabor-react-ts/index.html
argglobal
%argdel
edit ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx
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
balt ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/Link.tsx
let s:l = 24 - ((23 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx", ":p")) | buffer ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx | else | edit ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/_my-projects/rumbaysabor-react-ts/src/scenes/navbar/index.tsx
endif
balt ~/Code/web/_my-projects/rumbaysabor-react-ts/src/index.css
let s:l = 24 - ((23 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 0
wincmd w
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
