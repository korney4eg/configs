local cmp = require("cmp")
require("lsp.color")
require("lsp.nullls")
-- LSP settings (for overriding per client)
local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}
local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

cmp.setup({
	snippet = { expand = function(args) end },
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = { { name = "nvim_lsp" }, { name = "path" }, { name = "buffer" } },
})

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_position_diagnostics({focusable=false})]])

require("lspconfig").groovyls.setup({
	cmd = {
		"java",
		"-jar",
		"~/.cache/nvim/lspconfig/groovyls/groovy-language-server/build/libs/groovy-language-server-all.jar",
	},
	-- on_attach=require'completion'.on_attach,
	-- settings = {
	--   groovy = {
	--     classpath = {
	--           "/usr/local/Cellar/groovy/3.0.8/libexec/lib/jenkins.war",
	--     }
	--   },
	-- },
	filetypes = { "groovy" },
})

require("lspconfig").bashls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
require("lspconfig").gopls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})
require("lspconfig").vimls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
require("lspconfig").sumneko_lua.setup({
	handlers = handlers,
	cmd = {
		"lua-language-server",
		"-E",
		"/usr/local/Cellar/lua-language-server/2.5.6/libexec/main.lua",
	},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.expand("~/configs/nvim/lua/")] = true,
				},
			},
		},
	},
})
require("lspconfig").pylsp.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
require("lspconfig").terraformls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
require("lspconfig").dockerls.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})
require("lspconfig").html.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

local nvim_lsp = require("lspconfig")

nvim_lsp["yamlls"].setup({
	settings = {
		yaml = {
			schemas = {
				["/Users/aliaksei.karneyeu/configs/nvim/lsp_rules/cloudbuild.json"] = ".ci/cloudbuild*.yaml", -- cloudbuild configuration
				["/Users/aliaksei.karneyeu/configs/nvim/lsp_rules/hadolint.json"] = ".hadolint.yaml",
			},
		},
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end
