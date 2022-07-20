let mapleader=","

call plug#begin()    
  Plug 'lervag/vimtex'
  Plug 'dylanaraps/wal.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme wal

set clipboard+=unnamedplus
set conceallevel=1
set confirm
set history=1000
set ignorecase
set mouse=a
set noexpandtab
set number
set shiftwidth=4
set smartcase
set splitbelow
set tabstop=2
set shiftwidth=2
set title
filetype plugin indent on

"Coc.nvim settings"
set shortmess+=c
set signcolumn=number

let g:vimtex_view_method='zathura'
let g:tex_conceal='abdmg'
let g:vimtex_quickfix_mode=2
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_autoclose_after_keystrokes=2
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}

augroup vimtex
  au!
  au User VimtexEventView call b:vimtex.viewer.xdo_focus_vim()
	au User VimtexEventInitPost VimtexCompile
  au User VimtexEventCompileSuccess VimtexView
augroup END

" Close viewers when VimTeX buffers are closed
function! CloseViewers()
  if executable('xdotool')
      \ && exists('b:vimtex.viewer.xwin_id')
      \ && b:vimtex.viewer.xwin_id > 0
    call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
  endif
endfunction

augroup vimtex_event_2
  au!
  au User VimtexEventQuit call CloseViewers()
augroup END


let g:lightline = {
    \ 'colorscheme': 'wal',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename'] ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',         
    \ },
    \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
    \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction


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
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
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

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

"Custom mappings"
nmap <silent>  <leader>v  :tabedit $MYVIMRC<CR>
nmap <leader>r :so $MYVIMRC<CR>
noremap <leader>e :PlugInstall<CR>


