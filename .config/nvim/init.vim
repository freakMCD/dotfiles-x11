
let mapleader=","

call plug#begin()
Plug 'dylanaraps/wal.vim'
call plug#end()

set mouse=a
set shiftwidth=4
set noexpandtab 
set number
set splitbelow
set history=1000
set ignorecase
set smartcase
set conceallevel=2
set confirm
colorscheme wal

"Custom mappings"
nmap <silent>  <leader>v  :e $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR>
noremap <leader>e :PlugInstall<CR>






