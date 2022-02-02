local signs = {
	----Another icons   
	Error = " ",
	----Another icons    
	Warn = " ",
	----Another icons   
	Hint = " ",
	----Another icons    
	Info = " ",
}

vim.cmd([[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])


for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.cmd('hi DapBreakpoint guifg=#ff0000')
vim.fn.sign_define("DapBreakpoint", {
	text = "",
	texthl = "DapBreakpoint",
	linehl = "",
	numhl = "",
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

---- Set Default Prefix.
---- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- virtual_text = { prefix = " " },
	-- virtual_text = false,
	signs = true,
	underline = true,
	float = { show_header = true },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
