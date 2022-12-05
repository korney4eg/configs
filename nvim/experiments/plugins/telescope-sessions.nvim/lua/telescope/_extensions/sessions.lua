local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
-- our picker function: colors

local sessions_func = function()
  local i, t, popen = 0, {}, io.popen
  local pfile = popen('ls  ~/.vim/sessions/| grep -v lock| sed "s/\\.vim//"')
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

local colors = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Sessions",
    finder = finders.new_table {
      results = sessions_func()
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd('OpenSession ' .. selection[1])
      end)
      return true
    end,

  }):find()
end

-- to execute the function
-- colors()
-- colors(require("telescope.themes").get_dropdown {})
