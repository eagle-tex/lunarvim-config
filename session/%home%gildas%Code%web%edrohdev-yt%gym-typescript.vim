let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/edrohdev-yt/gym-typescript
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +125 .eslintrc.cjs
badd +9 src/App.tsx
badd +27 src/scenes/navbar/index.tsx
badd +1 src/scenes/contactUs/index.tsx
badd +1 ~/Code/web/edrohdev-yt/gym-typescript/src/scenes/footer/index.tsx
badd +20 package.json
badd +25 ~/Code/web/edrohdev-yt/gym-typescript/tsconfig.json
badd +6 ~/Code/web/edrohdev-yt/gym-typescript/postcss.config.js
badd +1 ~/Code/web/edrohdev-yt/gym-typescript/src/main.tsx
badd +23 vite.config.ts
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit src/scenes/navbar/index.tsx
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
let s:l = 27 - ((26 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("src/scenes/navbar/index.tsx", ":p")) | buffer src/scenes/navbar/index.tsx | else | edit src/scenes/navbar/index.tsx | endif
if &buftype ==# 'terminal'
  silent file src/scenes/navbar/index.tsx
endif
let s:l = 27 - ((26 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
tabnext
edit vite.config.ts
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
balt ~/Code/web/edrohdev-yt/gym-typescript/src/main.tsx
let s:l = 23 - ((22 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 23
normal! 04|
wincmd w
argglobal
if bufexists(fnamemodify(".eslintrc.cjs", ":p")) | buffer .eslintrc.cjs | else | edit .eslintrc.cjs | endif
if &buftype ==# 'terminal'
  silent file .eslintrc.cjs
endif
let s:l = 109 - ((15 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 109
normal! 0
wincmd w
2wincmd w
wincmd =
tabnext 2
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
