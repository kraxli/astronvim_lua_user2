vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_browser = ""
vim.g.mkdp_page_title = "${name}"
vim.g.mkdp_filetypes = { "markdown", "vimwiki", "markdown.vimwiki" }
vim.api.nvim_create_user_command("Mp", "MarkdownPreview", { bang = true, desc = "Markdown preview" })
vim.api.nvim_create_user_command("Pv", "MarkdownPreview", { bang = true, desc = "Markdown preview" })
