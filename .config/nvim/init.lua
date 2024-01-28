-- Install lazy.nvim automatically
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'kovetskiy/sxhkd-vim',
    'lervag/vimtex',
    'nvim-lualine/lualine.nvim', dependencies = {'kyazdani42/nvim-web-devicons' },

   {
    'hrsh7th/nvim-cmp', 
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
	 'hrsh7th/cmp-buffer',
	 'hrsh7th/cmp-path',
     --LuaSnip
     'L3MON4D3/LuaSnip',
     'saadparwaiz1/cmp_luasnip',
     'rafamadriz/friendly-snippets',
	},
   },
   
    {"morhetz/gruvbox", priority = 1000 },
   
})

vim.cmd('colorscheme gruvbox')

require('lualine').setup {
  options = {
    theme = 'gruvbox'
  }
}

-- Luasnip Tab completion related config 
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Set up nvim-cmp.
vim.opt.completeopt = "menu,menuone,noselect"

require("luasnip.loaders.from_vscode").lazy_load()

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
local select_opts = {behavior = cmp.SelectBehavior.Select}

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
        
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Snippets
	  ['<C-f>'] = cmp.mapping(function(fallback)
	    if luasnip.jumpable(1) then
	      luasnip.jump(1)
	    else
	      fallback()
	    end
	  end, {'i', 's'}),

	  ['<C-b>'] = cmp.mapping(function(fallback)
	    if luasnip.jumpable(-1) then
	      luasnip.jump(-1)
	    else
	      fallback()
	    end
	  end, {'i', 's'}),

    -- Completion with tab
	  ['<Tab>'] = cmp.mapping(function(fallback)
	    local col = vim.fn.col('.') - 1
	  
	    if cmp.visible() then
	      cmp.select_next_item(select_opts)
	    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
	      fallback()
	    else
	      cmp.complete()
	    end
	  end, {'i', 's'}),
  
	  ['<S-Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
	      cmp.select_prev_item(select_opts)
	    else
	      fallback()
	    end
	  end, {'i', 's'}),
   },

    sources = {
      { name = 'path'},
      { name = 'nvim_lsp', keyword_length = 1},
      { name = 'buffer', keyword_length = 3},
      { name = 'luasnip', keyword_length = 2}, -- For luasnip users.
    },
})

local opt = vim.opt

-- Set Options
opt.confirm = true
opt.history = 1000
opt.ignorecase = true
opt.mouse = ""
opt.number = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.splitbelow = true
opt.title = true
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
opt.wrap = true
opt.linebreak = true
opt.showbreak = '▸'  -- You can change this to any character you prefer
opt.breakindent = true

-- Vimtex
vim.cmd("filetype plugin indent on")
opt.conceallevel = 1
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_latexmk = {
  out_dir = 'build'
}

vim.api.nvim_set_keymap('x', '<C-r>', '"hy:s/<C-r>h/', { noremap = true, silent = true })
