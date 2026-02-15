return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  keys = {
    {
      '<leader>sw',
      function()
        require('fzf-lua').grep_cword({
          rg_opts =
          "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!vendor/' -e"
        })
      end,
      desc = '[S]earch current [w]ord',
    },
    {
      '<leader>sW',
      function()
        require('fzf-lua').grep_cWORD({
          rg_opts =
          "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!vendor/' -e"
        })
      end,
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>sf',
      function() require('fzf-lua').files() end,
      desc = '[S]earch [f]iles',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep({
          rg_opts =
          "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!vendor/' -e"
        })
      end,
      desc = '[S]earch for word [g]lobally',
    },
    {
      '<leader>sh',
      function() require('fzf-lua').helptags() end,
      desc = '[S]earch [H]elp',
    },
    {
      '<leader>sk',
      function() require('fzf-lua').keymaps() end,
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sr',
      function() require('fzf-lua').resume() end,
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>s.',
      function() require('fzf-lua').oldfiles() end,
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader>sb',
      function() require('fzf-lua').buffers() end,
      desc = '[S]earch [B]uffers',
    },
    {
      '<leader><leader>',
      function() require('fzf-lua').buffers() end,
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>sn',
      function()
        require('fzf-lua').find_files({
          cwd = vim.fn.stdpath 'config'
        })
      end,
      desc = '[S]earch [N]eovim files',
    },
    ---@diagnostic enable: missing-fields
  }
}
