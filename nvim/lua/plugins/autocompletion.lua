---@module 'blink.cmp'
return {

  {
    -- enabled = false,
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        -- dev = true,
        "giuxtaposition/blink-cmp-copilot",
      },
    },
    version = false,
    opts = {
      keymap = { preset = 'default' },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = {
          border = "single",
          draw = {
            align_to_component = "label", -- or 'none' to disable
            padding = 1,
            gap = 4,
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        documentation = {
          auto_show = true,
        },
        ghost_text = {
          enabled = true,
        },
      },
      sources = {
        -- default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot" },
        completion = {
          enabled_providers = { "lsp", "copilot", "path", "snippets", "buffer" },
        },
        providers = {
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },
      signature = {
        enabled = true,
      },
      appearance = {
        kind_icons = {
          Array = "",
          Boolean = "",
          Class = '󱡠',
          Color = '󰏘',
          Constant = '󰏿',
          Constructor = '󰒓',
          Copilot = "",
          Enum = "",
          EnumMember = "",
          Event = '󱐋',
          Field = '󰜢',
          File = '󰈔',
          Folder = '󰉋',
          Function = '󰊕',
          Interface = '󱡠',
          Key = "",
          Keyword = '󰻾',
          Macro = "", -- Macro
          Method = '󰊕',
          Module = '󰅩',
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Operator = '󰪚',
          Package = "",
          Property = '󰖷',
          Reference = '󰬲',
          Snippet = '󱄽',
          String = "",
          Struct = '󱡠',
          Text = "",
          TypeParameter = "",
          Unit = '󰪚',
          Value = '󰦨',
          Variable = "",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false, auto_trigger = true, keymap = { accept = "<M-CR>" } },
        panel = { enabled = false },
        filetypes = {
          ["*"] = true,
        },
      })
    end,
  },


}
