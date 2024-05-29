let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/playground/neovim-ide-test
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts
badd +12 index.html
badd +67 src/scenes/ourClasses/index.tsx
badd +14 src/scenes/home/index.tsx
badd +9 src/files/debugMe.js
badd +29 src/scenes/navbar/index.tsx
badd +5 src/files/functions.ts
badd +13 src/files/ts-file.ts
badd +14 src/index.css
badd +2 ~/Code/web/playground/neovim-ide-test/src/trial.css
argglobal
%argdel
tabnew +setlocal\ bufhidden=wipe
tabrewind
edit ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts
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
exe 'vert 1resize ' . ((&columns * 126 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 127 + 127) / 254)
argglobal
balt index.html
let s:l = 6 - ((5 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 016|
wincmd w
argglobal
if bufexists(fnamemodify("src/files/debugMe.js", ":p")) | buffer src/files/debugMe.js | else | edit src/files/debugMe.js | endif
if &buftype ==# 'terminal'
  silent file src/files/debugMe.js
endif
balt src/scenes/navbar/index.tsx
let s:l = 9 - ((4 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 126 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 127 + 127) / 254)
tabnext
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
balt src/files/functions.ts
let s:l = 29 - ((28 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 29
normal! 040|
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts", ":p")) | buffer ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts | else | edit ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts
endif
balt src/files/debugMe.js
let s:l = 5 - ((0 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 017|
wincmd w
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
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
