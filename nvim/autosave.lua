local output_bufnr, command = 3,
		{ "diff","-r", "helm_tests/master/", "helm_tests/SRE-994/" }
-- { "helm", "template", "-n", "default", "helm/broker/", "-f", "helm/broker/values.yaml", "-f",
-- 	"helm/broker/values-devint.yaml" }

-- local diffs = {}
-- diffs[9] = { "diff", "helm_tests/master/devint.yaml", "helm_tests/test_canary_changes/devint.yaml" }
-- diffs[17] ={ "diff", "helm_tests/master/qa.yaml", "helm_tests/test_canary_changes/qa.yaml" }
-- diffs[18] = { "diff", "helm_tests/*/prod_asia.yaml" }
-- diffs[19] = { "diff", "helm_tests/*/prod_canaray.yaml" }

-- local attach_to_buffer = function(output_bufnr, pattern, command)

	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = "**.yaml",
		group = vim.api.nvim_create_augroup("helmTester", { clear = true }),
		callback = function()
			local append_data = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end

			end
			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, {"diffs:"})
			vim.fn.jobstart("./helm_tests/generate.sh",{
				stdout_buffered = true,
				on_stderr = append_data
		})
			vim.fn.jobstart(command, {
				stdout_buffered = true,
				on_stdout = append_data,
				on_stderr = append_data
			})
		end
	})
-- end

-- for bufnr, cmd in pairs(diffs) do
-- 		attach_to_buffer(bufnr, "**/helm/**.yaml", cmd)
-- end
