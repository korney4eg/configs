local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("This plugin requires nvim-telescope/telescope.nvim")
end

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
-- our picker function: colors
local cmd = function(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local M = {}
local checks = function()
  -- gh api /repos/openx/delivery-gateway-server/commits/96f65e3d3471b252ef626fffa8e6f984e6855fda/check-runs
  local current_commit = cmd('git log -n 1 --pretty=format:"%h"')
  -- current_commit = '96f65e3d3471b252ef626fffa8e6f984e6855fda'
  local owner = cmd('git remote -v|grep fetch| sed "s/^.*://"|sed "s/\\.git.*$//"| sed "s/\\/.*//"')
  local repo = cmd('git remote -v|grep fetch| sed "s/^.*://"|sed "s/\\.git.*$//"| sed "s/^.*\\///"')
  local command = 'gh api /repos/' .. owner .. '/' .. repo .. '/commits/' .. current_commit .. '/check-runs 2>&1'
  local command_output = vim.fn.json_decode(cmd(command, true))
  local checks = {}
  for check_run_number = 1, #(command_output['check_runs']) do
    local conclusion = ''
    local check_run = command_output['check_runs'][check_run_number]
    if check_run["status"] == 'completed'
    then
      if check_run["conclusion"] == 'success'
      then
        conclusion = "✅"
      elseif check_run["conclusion"] == 'failure'
      then
        conclusion = '❌'
      else
        conclusion = '➖'
      end
    else
      conclusion = '🔄'
    end
    -- print(vim.inspect(check_run))
    table.insert(checks, { conclusion .. ' ' .. check_run['name'], check_run['details_url']:gsub("&", '\\&'), check_run['output']['summary'] })
  end
  return checks
  -- local notify_opts = vim.tbl_extend(
  --   "keep",
  --   opts or {},
  --   { title = "Check-runs on current commit "..current_commit }
  -- )

end

M.check_runs = function(opts)
  telescope_opts = vim.tbl_extend("keep", telescope_opts or {},
    require("telescope.themes").get_dropdown {})

  opts = opts or {}
  pickers.new(telescope_opts, {
    prompt_title = "Check runs",
    finder = finders.new_table {
      results = checks(),
      entry_maker = function(entry)
        print(vim.inspect(entry))
        return { value = entry[2], display = entry[1], ordinal = entry[1], content = entry[3] }
      end
    },
    initial_mode = 'normal',
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd('! open ' .. selection['value'])
      end)
      return true
    end,
    -- previewer = previewers.new_buffer_previewer({
    --   define_preview = function(self, entry)
    --     print(vim.inspect(entry))
    --     local output = entry['content']
    --     vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, output)
    --   end
    -- }),

  }):find()
end

-- return M

return telescope.register_extension {
  setup = function(opts) return opts end,
  exports = { check_runs = M.check_runs }
}

-- to execute the function
-- check_runs(require("telescope.themes").get_dropdown {})
-- colors(require("telescope.themes").get_dropdown {})
