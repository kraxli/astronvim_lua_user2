return{
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		-- event = { "BufRead", "BufNew" },
		config = function()
			require("lsp_signature").setup()
			-- require("user.plugins.lsp_signature").config()
		end,
	},
	{
		"rafi/vim-venom",
		ft = { "python" },
		config = function()
			require("user.plugins.venom")
		end,
		-- config = 'require("venom").setup()',  # for lua version which is inferior as of 2022-10-08
		-- setup = function() vim.g.venom_loaded = 1 end ,  # for lua version which is inferior as of 2022-10-08
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
		ft = { "lua" },
		-- setup = function() require("config.plugins.dap") end,
	},


}
