local null_ls = require("null-ls")

local sources = {
	-- null_ls.builtins.formatting.prettier,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.goimports,
	-- null_ls.builtins.formatting.lua_format,
	-- null_ls.builtins.formatting.shellharden,
	-- null_ls.builtins.formatting.stylua,
	-- null_ls.builtins.formatting.terraform_fmt,
	null_ls.builtins.formatting.trim_newlines,
	null_ls.builtins.formatting.trim_whitespace,
	null_ls.builtins.diagnostics.golangci_lint,
	-- null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.diagnostics.vint,
	null_ls.builtins.diagnostics.yamllint,
	null_ls.builtins.diagnostics.write_good,
}

null_ls.setup({ sources = sources, on_attach = on_attach })
