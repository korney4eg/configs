local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jj", "<ESC>", default_opts)
keymap("t", "jj", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

-- reload current file into neovim setup. Lua or Vim
keymap("n", "<leader>x", "<cmd>source %<cr>| <cmd>echo 'reloaded'<cr>", default_opts)
-- Telescope
--
-- === Files
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })

-- === Buffers
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Find existing [b]uffers' })

-- ==== Dotfiles operations
vim.keymap.set('n', '<leader>cf', function()
  require('telescope.builtin').find_files({ cwd = "~/configs/" })
end,
  { desc = 'Search in [c]onfig [f]iles' })
vim.keymap.set('n', '<leader>csw', function()
  require('telescope.builtin').grep_string({ file_ignore_patterns = { "**/nvim/lsp-rules/*" }, cwd = "~/configs/" })
end, { desc = '[c]onfigs [s]earching for [w]ord under cursor' })
vim.keymap.set('n', '<leader>cs', function()
  require('telescope.builtin').grep_string({ file_ignore_patterns = { "nvim/lsp-rules" }, cwd = "~/configs/" })
end, { desc = '[c]onfigis [s]earching for string' })

-- ===
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string({ hidden = true, search = vim.fn.expand("<cword>") })
end,
  { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>s', function()
  require('telescope.builtin').live_grep({ hidden = true })
end,
  { desc = '[S]earch by [G]rep' })

-- Debug
vim.keymap.set('n', '<leader>db', require 'dap'.toggle_breakpoint, { desc = 'Toggle [d]ebug [b]reakpoint' })
vim.keymap.set('n', "<leader>dc", function()
  require("dap").set_breakpoint(vim.fn.input "[DAP] Condition > ")
end, { desc = 'Set [d]ebug [c]onditional breakpoint' })
vim.keymap.set('n', '<leader>ds', require 'dap'.continue, { desc = '[D]ebug [S]tart' })
vim.keymap.set('n', '<leader>dq', require 'dap'.close, { desc = '[D]ebug [Q]uit' })
vim.keymap.set('n', '<leader>dt', require 'dapui'.toggle, { desc = '[D]ebug UI [T]oggle' })

local map = function(lhs, rhs, desc)
  if desc then
    desc = "[DAP] " .. desc
  end

  vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
end
map("<F1>", require("dap").step_back, "step_back")
map("<F2>", require("dap").step_into, "step_into")
map("<F3>", require("dap").step_over, "step_over")
map("<F4>", require("dap").step_out, "step_out")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = 0, desc = desc })
end

nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

nmap('C-]', vim.lsp.buf.definition, '[G]oto [D]efinition')
nmap('C-[', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
-- TODO: checkout out workspaces


-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
-- nmap('<leader>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, '[W]orkspace [L]ist Folders')


nmap('<leader>g', ':Neogit<cr>','open [g]it menu')
nmap('<leader>gs', ':Neogit<cr>','open [g]it menu')

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _float_term_toggle()<CR>", {noremap = true, silent = true})
