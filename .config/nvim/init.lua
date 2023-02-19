
return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'    
    use 'dylanaraps/wal.vim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'lervag/vimtex'

    use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"


local custom_wal = require'lualine.themes.pywal'
-- Change the background of lualine_b section for normal mode
custom_wal.normal.b.bg = '#252525'

require('lualine').setup({
    options = { 
        theme = custom_wal,
    },
})


vim.opt.completeopt = "menu,menuone,noselect"
-- Set up nvim-cmp.
local cmp = require'cmp'
require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    view = {                                                        
      entries = {name = 'custom', selection_order = 'near_cursor' } 
    },                                                               
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


vim.cmd([[
    colorscheme wal
	set clipboard+=unnamedplus
	set conceallevel=1
	set confirm
	set history=1000
	set ignorecase
	set mouse=a
	set number
	set expandtab
	set shiftwidth=4
	set softtabstop=4
	set tabstop=4
	set smartcase
	set smartindent
	set smarttab
	set splitbelow
	set title
	filetype plugin indent on
	filetype on
	let g:markdown_fenced_languages = ['bash']

    hi LineNr ctermbg=NONE ctermfg=238
    hi Pmenu ctermbg=233 ctermfg=7

	let g:vimtex_view_method='zathura'
	let g:tex_conceal='abdmg'
	let g:vimtex_quickfix_mode=0
	let g:vimtex_compiler_latexmk = {
	            \ 'build_dir' : 'build',
	            \}
	" vimtex
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

]])

end)

