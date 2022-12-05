-- vim settings
local opt = vim.opt

-- ui
opt.list = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true

-- code
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.cursorline = true
opt.hidden = true

-- searching
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true


opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.autoread = true
opt.termguicolors = true
opt.updatetime = 100 -- mainly for trld.nvim which utilize CursorHold autocmd
opt.formatoptions:append('cro') -- continue comments when going down a line
opt.sessionoptions:remove('options') -- don't save keymaps and local options
opt.foldlevelstart = 99 -- no auto folding
opt.mouse = 'a' -- Enable mouse when guest are using my nvim
opt.signcolumn = 'yes:1' -- Enable 1 signs in the column
opt.laststatus = 3
