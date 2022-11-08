return {
	disabled = { "sumneko_lua" }, -- disable languager servers / linters
	format_on_save = {
		-- enabled = false, -- enable format on save
		ignore_filetypes = { -- disable format on save for specified filetypes
			"lua",
		},
		-- allow_filetypes = { }, -- only allow formatting on save for these filetypes
	},
}
