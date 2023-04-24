local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }
  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
    end
  }


  -- code actions ??
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    -- after = {'copilot_cmp'},
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
      "onsails/lspkind-nvim" },

  }
  -- copilot
  use {
    "zbirenbaum/copilot.lua",
    cmp = "Copilot",
    after = "nvim-lspconfig",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = {
          enabled = false,
          layout = {
            position = "bottom",
            size = 0.4
          }
        },
      })
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup({
        clear_after_cursor = true,
        completion_fn = 'getPanelCompletions'
      })
    end
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function()
      require 'config.treesitter'
    end
  }

  use { 'nvim-treesitter/playground' }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use 'farmergreg/vim-lastplace'

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'tpope/vim-rhubarb'
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
      require("scrollbar.handlers.gitsigns").setup()
    end
  }

  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'JoosepAlviste/palenightfall.nvim'
  use 'tjdevries/colorbuddy.nvim'
  -- use 'tjdevries/gruvbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'

  use {
    'https://gitlab.com/__tpb/monokai-pro.nvim',
    as = 'monokai-pro.nvim'
  }

  use { 'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup()
    end
  } -- Fancier statusline
  use {
    'linrongbin16/lsp-progress.nvim',
    event = { 'VimEnter' },
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lsp-progress').setup()
    end
  }

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        char = '┊',
        show_trailing_blankline_indent = false,
      }

    end } -- Add indentation guides even on blank lines
  use { 'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end } -- "gc" to comment visual regions/lines

  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use { 'RRethy/vim-illuminate' }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

    end
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        show = true,
      })
    end
  }


  -- Debug adapter protocol
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"

  --  Adaparter configuration for specific languages
  use { "leoluz/nvim-dap-go" }
  use { "mfussenegger/nvim-dap-python" }

  use 'meain/vim-jsontogo'
  use { 'stevearc/dressing.nvim' }

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
