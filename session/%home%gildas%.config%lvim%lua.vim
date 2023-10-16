let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/lvim/lua
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +26 ~/.config/lvim/config.lua
badd +203 user/plugins.lua
badd +40 user/colorscheme.lua
badd +12 user/autocmds.lua
badd +20 user/dashboard.lua
badd +29 user/filetype.lua
badd +20 user/keymaps.lua
badd +128 user/kind.lua
badd +172 user/lsp.lua
badd +41 user/builtins.lua
badd +2 user/statusline.lua
badd +68 user/which-key.lua
argglobal
%argdel
edit user/plugins.lua
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
balt user/autocmds.lua
let s:l = 33 - ((32 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 33
normal! 04|
wincmd w
argglobal
if bufexists(fnamemodify("user/lsp.lua", ":p")) | buffer user/lsp.lua | else | edit user/lsp.lua | endif
if &buftype ==# 'terminal'
  silent file user/lsp.lua
endif
balt user/plugins.lua
let s:l = 133 - ((43 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 133
normal! 02|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 126 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 127 + 127) / 254)
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
