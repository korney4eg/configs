local setup_ui = function()
  vim.cmd 'colorscheme oldworld'
  vim.cmd 'hi Comment gui=none'
end
return {
  -- COLOR SCHEMES
  --
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false,    priority = 1000 },
  { 'EdenEast/nightfox.nvim',    lazy = false,     priority = 1000, },
  { 'folke/tokyonight.nvim',     lazy = false,     priority = 1000 },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      setup_ui()
    end
  },
  {
    'UtkarshVerma/molokai.nvim',
    lazy = false,
    priority = 1000,
  },
}
