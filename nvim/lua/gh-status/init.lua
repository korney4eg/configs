vim.notify = require("notify")

local M = {}
M.command = function(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

M.echo = function(cmd)
  print(cmd)
end

M.owner = M.command('git remote -v|grep fetch| sed "s/^.*://"|sed "s/\\.git.*$//"| sed "s/\\/.*//"')
M.repo = M.command('git remote -v|grep fetch| sed "s/^.*://"|sed "s/\\.git.*$//"| sed "s/^.*\\///"')
M.full_repo = M.command('git remote -v'):match("(.*)")

M.get_full_repo = function()
  local git_output = M.command('git remote -v')
  local remote = git_output:match(".*(github.com.+) .*")
  remote = remote:gsub(":", "/")
  remote = remote:gsub(".git", "")
  return remote

end

M.pushr = function()
  local output = M.command('git push 2>&1', true)
  if output.find(output, 'https') then
    local remote = output:match(".*remote: +(https[^\n]+)\n.*")
    print(remote)
    remote = M.command("open " .. remote)
    vim.notify("Creating PR", "info")
  else
    vim.notify("PR exists", "info")
  end
  if vim.bo.filetype == 'fugitive' then
    vim.api.nvim_win_close(0, true)
  end
end


M.push = function()
  -- notify_output({ "git", "pushr" })
  vim.notify(M.command('git push 2>&1', true), "info")
end

M.checks = function()
  -- gh api /repos/openx/delivery-gateway-server/commits/96f65e3d3471b252ef626fffa8e6f984e6855fda/check-runs
  local current_commit = M.command('git log -n 1 --pretty=format:"%h"')
  -- current_commit = '96f65e3d3471b252ef626fffa8e6f984e6855fda'
  local command = 'gh api /repos/' .. M.owner .. '/' .. M.repo .. '/commits/' .. current_commit .. '/check-runs 2>&1'
  local command_output = vim.fn.json_decode(M.command(command, true))
  local output = ''
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
    output = output .. conclusion .. ' ' .. check_run["name"] .. ':  ' .. check_run["details_url"] .. '\n'
  end
  local notify_opts = vim.tbl_extend(
    "keep",
    opts or {},
    { title = "Check-runs on current commit " .. current_commit }
  )
  vim.notify(output, "info", notify_opts)

end

return M
