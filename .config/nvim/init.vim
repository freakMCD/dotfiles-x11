let mapleader=","

call plug#begin()    
    Plug 'lervag/vimtex'
    Plug 'dylanaraps/wal.vim'
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set confirm
filetype plugin indent on

colorscheme wal


"Custom mappings"
nmap <silent>  <leader>v  :e $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR>
noremap <leader>e :PlugInstall<CR>

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
set conceallevel=1
syntax enable
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_open_on_warning=0

"Coc.nvim settings"
set hidden
set shortmess+=c
set signcolumn=number

"Map TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
