local function notify_output(command, opts)
  local output = ""
  local notification
  local notify = function(msg, level)
    local notify_opts = vim.tbl_extend(
      "keep",
      opts or {},
      { title = table.concat(command, " "), replace = notification }
    )
    notification = vim.notify(msg, level, notify_opts)
  end
  local on_data = function(a, data)
    output = output .. table.concat(data, "\n")
    -- P(data)
  end
  vim.fn.jobstart(command, {
    on_stdout = function(_, data)
      P(data)
    end,
    on_stderr = on_data,
    on_exit = function(_, code)
      if #output == 0 then
        notify("No output of command, exit code: " .. code, "warn")
      else
        notify(output, "info")
      end
    end,
  })
end

notify_output({ 'echo', 'hello there' })
