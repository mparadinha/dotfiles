syntax on
"colorscheme skittles_dark_mine
"colorscheme BlackSea_modified
"colorscheme NeonBrainFuck
colorscheme jeng

"show existing tabs with 4 spaces width
set tabstop=4

set shiftwidth=4
set softtabstop=4

"expand tabs to spaces
set expandtab

set encoding=utf-8

"show line numbers
set number
"something something, this was on the README for vim-airline
"set laststatus=2
"set the fonts for the special symbols used in vim-airline
"let g:airline_powerline_fonts=1

"because of delay between insert and normal mode
"set ttimeoutlen=50
"dont allow auto commeting
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"function for trimming trailing whitespace
fun! Trim()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

"keybindings to move between tabs
noremap <C-h> :tabprevious<CR>
noremap <C-l> :tabnext<CR>
"alias for creating new tabs
nmap :tabnew :tn

"is nice for running python scripts
fun! Run()
    silent !python % 
    redraw!
endfun
map <F5> :call Run() <return>

"for shorter messages when running external command
:set shortmess=a
