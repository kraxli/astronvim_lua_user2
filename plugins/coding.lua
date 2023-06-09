return {
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"rafi/vim-venom",
		ft = { "python" },
		init = function()
			vim.g.venom_echo = 1
			vim.g.venom_quiet = 0
			vim.g.venom_symbol = "🐍"
			vim.g.venom_auto_activate = 1
			vim.g.venom_use_tools = 1
			vim.g.venom_tools = {
				poetry = "poetry env info -p",
				pipenv = "pipenv --venv",
			}
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
    enabled = vim.fn.has('unix') == 1,
	},
	{
    "mfussenegger/nvim-dap-python",
    after = "mason-nvim-dap.nvim",
    config = function ()
      -- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('dap-python').setup('/usr/bin/python3')

      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'launch',
        name = 'My custom launch configuration',
        program = '${file}',
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      })
    end,
    -- config = function() require "user.plugins.nvim-dap-vscode-js" end,
    enabled = false  -- vim.fn.has('unix') == 1,
  },
}
