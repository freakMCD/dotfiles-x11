
let mapleader=","

call plug#begin()
    Plug 'dylanaraps/wal.vim'
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

set clipboard+=unnamedplus
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

lua << EOF
EOF

"Custom mappings"
nmap <silent>  <leader>v  :e $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR>
noremap <leader>e :PlugInstall<CR>






