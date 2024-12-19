vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Toggleterm keymaps
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua _float_term_toggle()<CR>', { noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local default_opts = { noremap = true, silent = true }
-- Better escape using jk in insert and terminal mode
vim.keymap.set('i', 'jj', '<ESC>', default_opts)

-- Center search results
vim.keymap.set('n', 'n', 'nzz', default_opts)
vim.keymap.set('n', 'N', 'Nzz', default_opts)
-- Better indent
vim.keymap.set('v', '<', '<gv', default_opts)
vim.keymap.set('v', '>', '>gv', default_opts)

-- Paste over currently selected text without yanking it
vim.keymap.set('v', 'p', '"_dP', default_opts)
-- Switch buffer
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', default_opts)
vim.keymap.set('n', '<S-l>', ':bnext<CR>', default_opts)

-- Resizing panes
vim.keymap.set('n', '<Left>', ':vertical resize +1<CR>', default_opts)
vim.keymap.set('n', '<Right>', ':vertical resize -1<CR>', default_opts)
vim.keymap.set('n', '<Up>', ':resize -1<CR>', default_opts)
vim.keymap.set('n', '<Down>', ':resize +1<CR>', default_opts)
