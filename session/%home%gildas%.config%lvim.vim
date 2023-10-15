let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/lvim
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
badd +198 ~/.config/lvim/lua/user/plugins.lua
badd +40 ~/.config/lvim/lua/user/colorscheme.lua
badd +12 ~/.config/lvim/lua/user/autocmds.lua
badd +20 lua/user/dashboard.lua
badd +29 ~/.config/lvim/lua/user/filetype.lua
badd +20 ~/.config/lvim/lua/user/keymaps.lua
badd +128 ~/.config/lvim/lua/user/kind.lua
badd +172 ~/.config/lvim/lua/user/lsp.lua
badd +41 ~/.config/lvim/lua/user/builtins.lua
badd +2 ~/.config/lvim/lua/user/statusline.lua
badd +68 ~/.config/lvim/lua/user/which-key.lua
argglobal
%argdel
edit ~/.config/lvim/lua/user/plugins.lua
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
balt ~/.config/lvim/lua/user/autocmds.lua
let s:l = 203 - ((30 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 203
normal! 030|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/lvim/lua/user/lsp.lua", ":p")) | buffer ~/.config/lvim/lua/user/lsp.lua | else | edit ~/.config/lvim/lua/user/lsp.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/lvim/lua/user/lsp.lua
endif
let s:l = 169 - ((25 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 169
normal! 0
wincmd w
2wincmd w
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
