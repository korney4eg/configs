local signs = {
----Another icons   
  Error = " ",
----Another icons     
  Warn = " ",
----Another icons    
  Hint = " ",
----Another icons      
  Info = " " 
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

---- Set Default Prefix.
---- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- virtual_text = {
  --   prefix = " ",
  -- },
  virtual_text = false,
  signs = true,
  underline = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})
