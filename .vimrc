syntax on
set t_Co=256
colorscheme ir_dark_gray

" Tabs as spaces, width 4
set expandtab
set shiftwidth=4
set softtabstop=4

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

inoremap jj <ESC>

" Use space to toggle folding
map <Space> za
map <C-n> :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 

call plug#end()

let g:pandoc#modules#disabled = [ "spell" ] " no spell checking for pandoc
let g:pandoc#formatting#mode = "hA"
let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#folding#level = 0
let g:pandoc#folding#mode = "relative"
