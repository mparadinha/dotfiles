syntax on
colorscheme BlackSea_modified

execute pathogen#infect()
filetype plugin on

"something something, this was on the README for vim-airline
set laststatus=2

"because of delay between insert and normal mode
set ttimeoutlen=50
"dont allow auto commeting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
