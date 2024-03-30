vim.cmd("set number")
vim.cmd("set nocp")
vim.cmd("set nocompatible")
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("set textwidth=80")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set cursorcolumn")
vim.cmd("set wildmenu")
vim.cmd("set wildmode=list:longest")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
--vim.cmd("set statusline=")
--vim.cmd("set statusline+=\\ %F\\ %M\\ %y\\ %r")
--vim.cmd("set statusline+=%=")
--vim.cmd("set statusline+=\\ line\\ %l,\\ col\\ %c;\\ %p%%\\ ")
vim.cmd("set laststatus=2")
vim.cmd("set termguicolors")

vim.wo.relativenumber = true

vim.opt.showmode = false

local lazypath = vim.fn.stdpath("data") .. "/plugins/lazy.nvim"
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

local plugins = {
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'tamago324/cmp-zsh' },
	{ 'Shougo/deol.nvim' },
	{ 'nvim-tree/nvim-tree.lua' },
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'romgrk/barbar.nvim' },
	{
		'catppuccin/nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{ 'mfussenegger/nvim-dap' },
	{ 'rcarriga/nvim-dap-ui' },
	{ 'mfussenegger/nvim-lint' },
	{ 'mhartington/formatter.nvim' },
	{ 'jayp0521/mason-nvim-dap.nvim' },
	{ 'jayp0521/mason-null-ls.nvim' },
	{ 'RubixDev/mason-update-all' },
	{ 'hrsh7th/cmp-vsnip' },
	{ 'hrsh7th/vim-vsnip' },
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	{ 'tpope/vim-fugitive' },
}
require("lazy").setup(plugins)

require("mason-update-all").setup{}
require("nvim-tree").setup{}
require("mason").setup{}
require("lualine").setup{}
require("nvim-treesitter.configs").setup{
	highlight = {
		enable = true,
	},
}
require("ibl").setup()
require("toggleterm").setup{
	open_mapping = '<C-g>',
	direction = 'horizontal',
	size = function(term)
		if term.direction == 'horizontal' then
			return 10
		elseif term.direction == 'vertical' then
			return 50
		end
	end,
	shade_terminals = true,
}

  -- Set up nvim-cmp.
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'zsh' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
    })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
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
  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup{
		capabilities = capabilities,
		cmd = { "clangd", "-header-insertion=never" },
  }

--  require('lspconfig')['haxe_language_server'].setup{
-- 	cmd = {"node", "/home/blopes/haxe-language-server/bin/server.js"},
--  }

  require'lspconfig'.lua_ls.setup{
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}
  require'lspconfig'.luau_lsp.setup{
	capabilities = capabilities
  }

  require'lspconfig'.bashls.setup{
	  capabilities = capabilities
  }

  require'lspconfig'.rust_analyzer.setup{}
	require'lspconfig'.omnisharp.setup{
		cmd = { '/usr/bin/OmniSharp' --[[ "dotnet", "/usr/share/omnisharp-roslyn-1.39.11/OmniSharp.dll" --]] }
	}

	require'lspconfig'.gdscript.setup{}

--require("mason").setup()
  -- disable netrw at the very start of your init.lua
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

-- Formatter setup
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
	cpp = {
		require('formatter.filetypes.cpp').clangd,
	},

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
