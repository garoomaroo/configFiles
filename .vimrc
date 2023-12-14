set nocp
filetype on
filetype plugin on
set number
set textwidth=80
set cursorline
set cursorcolumn
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.pptx,*.exe,*.png,*.jpg,*.gif,*.pdf,*.pyc,*.img,*.xlsx
set tabstop=4
set statusline=
set statusline+=\ %F\ %M\ %y\ %r
set statusline+=%=
set statusline+=\ line\ %l,\ col\ %c,\ %p%%
set laststatus=2

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vantreeseba/coc-haxe'
	Plug 'preservim/nerdtree'
	Plug 'jdonaldson/vaxe'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

inoremap <expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"

colorscheme catppuccin-mocha
