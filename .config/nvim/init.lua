
return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'    
    use 'dylanaraps/wal.vim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'lervag/vimtex'

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

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require('lualine').setup({
    options = { 
        theme = custom_wal,
    },
})

-- Set up nvim-cmp.
vim.opt.completeopt = "menu,menuone,noselect"
local cmp = require('cmp')
local luasnip = require('luasnip')
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({

    formatting = {
	  format = function(entry, vim_item)
	    -- Kind icons
	    vim_item.kind = string.format(' %s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	   	return vim_item
	  end
	},
    
    snippet = {   -- REQUIRED
      expand = function(args) 
        require('luasnip').lsp_expand(args.body) 
      end,
    },

    window = {
      documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
        -- they way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
  
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      }),

    sources = cmp.config.sources({
      { name = 'path'},
      { name = 'nvim_lsp', keyword_length = 1},
      { name = 'buffer', keyword_length = 3},
      { name = 'luasnip', keyword_length = 2}, -- For luasnip users.
    })
  })

  -- Use cmdline & path source for ':' 
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

