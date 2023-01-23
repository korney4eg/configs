vim.diagnostic.disable(0)
vim.defer_fn(function()
	vim.diagnostic.reset(nil, 0)
end, 1000)
