local refurb = require("user.lsp.diagnostics.refurb")

return function(config)
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	local vale = null_ls.builtins.diagnostics.vale
	vale["filetypes"] = { "markdown", "tex", "asciidoc", "html" }
	config.sources = {
		null_ls.builtins.code_actions.shellcheck,
		-- Set a linter
		diagnostics.actionlint,
		diagnostics.eslint,
		-- diagnostics.fish,
		diagnostics.gitlint,
		diagnostics.luacheck,
		diagnostics.markdownlint,
		-- diagnostics.mypy,
		diagnostics.shellcheck,
		vale,
		null_ls.builtins.diagnostics.vulture,
		null_ls.builtins.diagnostics.yamllint,
		refurb,
		-- Set a formatter
		formatting.stylua,
		formatting.black,
		formatting.prettierd.with({
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc.json"),
			},
		}),
		formatting.shfmt,
		-- formatting.shellharden
		formatting.jq,
	}
	config.on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_augroup("format_on_save", { clear = true })
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	desc = "Auto format before save",
			-- 	group = "format_on_save",
			-- 	pattern = "<buffer>",
			-- 	callback = function()
			-- 		-- vim.lsp.buf.formatting_sync({ async = true })
			-- 	end,
			-- })
		end
	end
	return config
end
