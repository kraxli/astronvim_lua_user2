return {
	{
		"famiu/bufdelete.nvim",
		cmd = {'Bdelete','Bwipeout'},
	},
	{
		"stevearc/aerial.nvim",
		version = "1.3.0",
	},
	{
		"rcarriga/nvim-dap-ui",
		opts = function(_, opts)
			opts.layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.25,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 15,
				},
			}
		end,
    enabled = vim.fn.has('win64') == 0,  -- vim.fn.has('unix') == 1 and 
	},

	-- the first parameter is the plugin specification
	-- the second is the table of options as set up in Lazy with the `opts` key
	-- config = function(plugin, opts)
	--   -- run the core AstroNvim configuration function with the options table
	--   require("plugins.configs.nvim-dap-ui")(plugin, opts)
	--
	--   local dap_ui = require "nvim-dap-ui"
	--   dap_ui.layouts = { {
	--     elements = {  {
	--         id = "stacks",
	--         size = 0.25
	--       },
	--       -- {
	--       --   id = "watches",
	--       --   size = 0.25
	--       -- }
	--       },
	--   } }
	-- end,
	-- }
}
