set nocp
set nocompatible
filetype on
filetype plugin on
filetype indent on
set number
set textwidth=80
set cursorline
set cursorcolumn
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.pptx,*.exe,*.png,*.jpg,*.gif,*.pdf,*.pyc,*.img,*.xlsx
set tabstop=4
set shiftwidth=4
set statusline=
set statusline+=\ %F\ %M\ %y\ %r
set statusline+=%=
set statusline+=\ line\ %l,\ col\ %c;\ %p%%\ 
set laststatus=2
set termguicolors
syntax on

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vantreeseba/coc-haxe'
	Plug 'preservim/nerdtree'
	Plug 'jdonaldson/vaxe'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'davisdude/vim-love-docs'
call plug#end()

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

let g:cpp_function_highlight = 1
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

" For this theme to work, you have to compile Vim with Lua support (On Gentoo,
" just enable the 'lua' USE flag on app-editors/vim, idk how to do it anywhere
" else)
colorscheme catppuccin-mocha
