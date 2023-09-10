return {
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	-- {
	-- 	"AckslD/swenv.nvim",
	-- 	ft =  {'python'},
	-- 	config = function ()
	-- 		require('swenv').setup({
 --  		-- Should return a list of tables with a `name` and a `path` entry each.
 --  		-- Gets the argument `venvs_path` set below.
 --  		-- By default just lists the entries in `venvs_path`.
 --  		get_venvs = function(venvs_path)
 --    		return require('swenv.api').get_venvs(venvs_path)
 --  		end,
 --  		-- Path passed to `get_venvs`.
 --  		venvs_path = vim.fn.expand('~/venvs'),
 --  		-- Something to do after setting an environment, for example call vim.cmd.LspRestart
 --  		post_set_venv = nil,
 --  		sections = {
 --    		lualine_a = 'swenv', -- uses default options
 --    		-- lualine_x = { 'swenv', icon = '🐍' }, -- passing lualine component options
	-- 		},
	-- 		})
	-- 	end,
	-- },
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
	-- {
	-- 	"rafi/neoconf-venom.nvim",
	-- 	-- enabled = false,
	-- 	dependencies = { 'nvim-lua/plenary.nvim', 'folke/neoconf.nvim' },
	-- 	-- ft =  {'python'},
	-- 	-- event = { 'BufReadPre', 'BufNewFile' },
	-- 	config = function ()
	-- 		require('venom').setup({
 --  			echo = true,
 --  			symbol = '🐍',
 --  			venv_patterns = { 'venv', '.venv', '.python-version' },
 --  			use_tools = true,
 --  			tools = {
 --    			pipenv = { 'pipenv', '--venv' },
 --    			poetry = { 'poetry', 'env', 'info', '-p' },
 --  			},
 --  			plugins = {
 --    			pyright = function(venv_path)
 --      			return {
 --        			python = {
 --          			pythonPath = table.concat({ venv_path, 'bin', 'python' }, '/')
 --        			},
 --      			}
 --    			end,
 --    			pylsp = function(venv_path)
 --      			return {
 --        			pylsp = {
 --          			plugins = { jedi = { environment = venv_path } }
 --        			},
 --      			}
 --    			end,
 --  			},
	-- 		})
	-- 	end
	-- },
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
    enabled = vim.fn.has('unix') == 1,
	},
  -- {
  -- 	'Vigemus/iron.nvim',
  -- 	-- tag = 'v3.0',
  -- 	enabled = false,
  -- },
}
