set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'closetag.vim'
Bundle 'ctrlp.vim'
Bundle 'phpfolding.vim'
Bundle 'snipMate'
Bundle 'vim-indent-object'

" original repos
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype plugin on
syntax on
set background=light
set t_Co=256
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set ai
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nu
set incsearch
set hlsearch
set ruler
set showcmd
set backspace=indent,eol,start
set nowrap
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [LEN=%L] 

map Y y$

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nnoremap <leader>T :set expandtab<cr>:retab!<cr>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

autocmd FileType html,jinjahtml,htmldjango let b:closetag_html_style=1
autocmd FileType html,jinjahtml,htmldjango source ~/.vim/bundle/closetag/plugin/closetag.vim
