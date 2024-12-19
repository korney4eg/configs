local setup_ui = function()
  vim.cmd 'colorscheme nightfox'
  vim.cmd 'hi Comment gui=none'
end
return {
  -- COLOR SCHEMES
  --
  { 'bluz71/vim-moonfly-colors', name = 'moonfly', lazy = false,   priority = 1000 },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      setup_ui()
    end
  },
  { 'folke/tokyonight.nvim',     lazy = false,     priority = 1000 },
}
