require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.vimls.setup{}
-- local sign_define = vim.fn.sign_define

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = false,
--     signs = true,
--     update_in_insert = false,
--     virtual_text = {
--       spacing = 4,
--       prefix = "~"
--     }
--   }
-- )

-- sign_define(
--   "LspDiagnosticsSignError",
--   {text = "", texthl = "LspDiagnosticsError"}
-- )

-- sign_define(
--   "LspDiagnosticsSignWarning",
--   {text = "", texthl = "LspDiagnosticsWarning"}
-- )

-- sign_define(
--   "LspDiagnosticsSignInformation",
--   {text = "", texthl = "LspDiagnosticsInformation"}
-- )

-- sign_define(
--   "LspDiagnosticsSignHint",
--   {text = "", texthl = "LspDiagnosticsHint"}
-- )
