syntax on
"colorscheme benokai
"colorscheme falcon

let mapleader = "-"

" reload (source) this config file while editing another one, so I don't
"have to restart vim
nnoremap <leader>sv :source $MYVIMRC<cr>

vmap <C-c> "+y

set hlsearch

"enable syntax highligthing for vulkan keywords
autocmd FileType cpp,c source ~/.vim/syntax/vulkan1.0.vim
"extra c, cpp syntax (like u8, u64, etc. types)
"autocmd FileType cpp,c source ~/.vim/syntax/extra_c_types.vim

"show existing tabs with 4 spaces width
set tabstop=4
"when new line keep same indentation
set autoindent

set shiftwidth=4
set softtabstop=4

"expand tabs to spaces
set expandtab

"shift-tab to place actual tab char instead of 4 spaces
inoremap <S-Tab> <C-V><Tab>

set encoding=utf-8

"show line numbers
set number
"enable mouse usage
set mouse=a

"something something, this was on the README for vim-airline "set laststatus=2
"set the fonts for the special symbols used in vim-airline
let g:airline_powerline_fonts = 1

"because of delay between insert and normal mode
"set ttimeoutlen=50
"dont allow auto commeting
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"always move display lines instead of physical lines (useful because of wrapping lines)
nnoremap j gj
nnoremap k gk

"function for trimming trailing whitespace
fun! Trim()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

"keybindings to move between tabs
noremap <C-h> :tabprevious<CR>
noremap <C-l> :tabnext<CR>

fun! Run()
    write
    let extension = expand('%:e')
    if extension == 'tex'
        silent !pdflatex % -synctex=1
        silent !rm *.aux *.log
    elseif extension == 'py'
        silent !python % 
    elseif extension == 'c'
        silent !make
    endif
    redraw!
endfun
map <F5> :call Run() <return>

"for shorter messages when running external command
:set shortmess=a

let g:tex_flavor="latex"

"disable auto formating on save (for zig files)
"let g:zig_fmt_autosave = 0

function RunClangFormat()
    execute "silent !clang-format -i % -style=\"{
        \ IndentWidth: 4,
        \ SpaceAfterCStyleCast: true,
        \ IndentPPDirectives: BeforeHash
    \}\""
    set nomodified
    let save_cursor = getcurpos()
    e
    call setpos(".", save_cursor)
    redraw!
endfun

" we need to wrap this autocmd in a command group that clears itself. this solves the
" problem of having the command run multiple times when we source the multiple times
" in the same session.
"augroup clang_format_group
"    autocmd!
"    autocmd BufWriteCmd *.c,*.h call RunClangFormat()
"augroup END
