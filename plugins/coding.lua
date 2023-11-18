return {
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{ "jalvesaq/Nvim-R", ft = { "r", "R", "rmd" }, command = { "StartR" } },
	-- TODO: improve / refine setup and harpoon integration
	-- see also: is0n/jaq-nvim and numToStr/FTerm.nvim
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunClose", "RunProject", "CRFiletype", "CRProjects" },
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.code_runner")
		end,
	},
	-- TODO: activate
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = { "SnipRun", "SnipInfo" },
		build = "bash install.sh",
		config = function()
			require("sniprun").setup({
				display = {
					-- "Terminal",
					"Classic",
					"VirtualTextOk",
					-- "TempFloatingWindow",
					"Notification",
				},
			})
			vim.cmd([[
        nnoremap <silent> <LocalLeader>r  <Plug>SnipRun<cr>
        xnoremap <silent> <LocalLeader>r  <Plug>SnipRun<cr>
        " <cmd>lua require’sniprun’.run('v')<CR>
        " nnoremap <silent><expr> <LocalLeader>rs  :SnipRun<CR>
      ]])
		end,
    enabled = vim.fn.has('unix') == 1,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
		event = "BufRead",
		config = function()
			require("refactoring").setup({})
		end,
	},
	{
		"jbyuki/one-small-step-for-vimkind",
		dependendies = { "mfussenegger/nvim-dap" },
		ft = { "lua" },
		config = function ()
				local dap = require"dap"
				dap.configurations.lua = {
  				{
    				type = 'nlua',
    				request = 'attach',
    				name = "Attach to running Neovim instance",
  				}
				}

				dap.adapters.nlua = function(callback, config)
  				callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
				end
		end;
    enabled = vim.fn.has('win64') == 0,  -- vim.fn.has('unix') == 1 and 
	},
  -- {
  -- 	'Vigemus/iron.nvim',
  -- 	-- tag = 'v3.0',
  -- 	enabled = false,
  -- },
}
