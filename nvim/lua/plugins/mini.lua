return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }
    -- my word

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup {
      content = {
        -- Content for active window
        active = nil,
        -- Content for inactive window(s)
        inactive = nil,
      },
      use_icons = vim.g.have_nerd_font
    }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end



    -- winbar renderer (global so statusline expression can call it)
    _G.MyWinbar = function()
      local ms = require('mini.statusline')
      local parts = {}

      -- Left: file name
      -- table.insert(parts, ms.section_filename({ trunc_width = 120 }))

      -- Middle: breadcrumbs from nvim-navic (if available)
      local ok, navic = pcall(require, 'nvim-navic')
      if ok and navic.is_available() then
        -- Use a subtle separator; navic returns proper statusline items
        table.insert(parts, navic.get_location())
      end

      -- Assemble with Mini’s helper to keep spacing/HL consistent
      local content = ms.combine_groups({
        { hl = 'MiniStatuslineFilename', strings = { parts[1] or '' } },
      })

      return content
    end

    -- Set the winbar. You can also use window-local: vim.wo.winbar = ...
    vim.o.winbar = "%{%v:lua.MyWinbar()%}"


    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
