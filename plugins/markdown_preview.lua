return	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		-- run = "cd app && npm install",  -- does not seem to work on windows
		ft = "markdown",
		config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_filetypes = { "markdown", "vimwiki", "markdown.vimwiki", "telekasten" }
      vim.api.nvim_create_user_command("Mp", "MarkdownPreview", { bang = true, desc = "Markdown preview" })
      vim.api.nvim_create_user_command("Pv", "MarkdownPreview", { bang = true, desc = "Markdown preview" })
		end,
	},

