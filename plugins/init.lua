return {
  ["famiu/bufdelete.nvim"] = { disable = true },
  -- ["goolord/alpha-nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["numToStr/Comment.nvim"] = { disable = true },

  ["EdenEast/nightfox.nvim"] = require "user.plugins.nightfox",
  ["akinsho/git-conflict.nvim"] = require "user.plugins.git-conflict",
  ["andweeb/presence.nvim"] = require "user.plugins.presence",
  ["andymass/vim-matchup"] = require "user.plugins.vim-matchup",
  ["danymat/neogen"] = require "user.plugins.neogen",
  ["dhruvasagar/vim-table-mode"] = require "user.plugins.vim-table-mode",
  ["echasnovski/mini.nvim"] = require "user.plugins.mini",
  ["ethanholz/nvim-lastplace"] = require "user.plugins.nvim-lastplace",
  ["folke/zen-mode.nvim"] = require "user.plugins.zen-mode",
  ["hrsh7th/cmp-calc"] = require "user.plugins.cmp-calc",
  ["hrsh7th/cmp-emoji"] = require "user.plugins.cmp-emoji",
  ["hrsh7th/cmp-omni"] = require "user.plugins.cmp-omni",
  ["jayp0521/mason-nvim-dap.nvim"] = require "user.plugins.mason-nvim-dap",
  ["jbyuki/nabla.nvim"] = require "user.plugins.nabla",
  ["jc-doyle/cmp-pandoc-references"] = require "user.plugins.cmp-pandoc-references",
  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["kdheepak/cmp-latex-symbols"] = require "user.plugins.cmp-latex-symbols",
  ["lukas-reineke/headlines.nvim"] = require "user.plugins.headlines",
  ["mfussenegger/nvim-dap"] = require "user.plugins.dap",
  ["mickael-menu/zk-nvim"] = require "user.plugins.zk",
  ["mtikekar/nvim-send-to-term"] = require "user.plugins.nvim-send-to-term",
  ["mxsdev/nvim-dap-vscode-js"] = require "user.plugins.nvim-dap-vscode-js",
  ["nanotee/sqls.nvim"] = require "user.plugins.sqls",
  ["nvim-telescope/telescope-bibtex.nvim"] = require "user.plugins.telescope-bibtex",
  ["nvim-telescope/telescope-file-browser.nvim"] = require "user.plugins.telescope-file-browser",
  ["nvim-telescope/telescope-hop.nvim"] = require "user.plugins.telescope-hop",
  ["nvim-telescope/telescope-media-files.nvim"] = require "user.plugins.telescope-media-files",
  ["nvim-telescope/telescope-project.nvim"] = require "user.plugins.telescope-project",
  ["nvim-treesitter/nvim-treesitter-textobjects"] = require "user.plugins.nvim-treesitter-textobjects",
  ["p00f/clangd_extensions.nvim"] = require "user.plugins.clangd_extensions",
  ["phaazon/hop.nvim"] = require "user.plugins.hop",
  ["rcarriga/nvim-dap-ui"] = require "user.plugins.dapui",
  ["theHamsta/nvim-dap-virtual-text"] = require "user.plugins.nvim-dap-virtual-text",
  ["vitalk/vim-simple-todo"] = require "user.plugins.vim-simple-todo",
  -- ["wakatime/vim-wakatime"] = require "user.plugins.vim-wakatime",
  ["ziontee113/syntax-tree-surfer"] = require "user.plugins.syntax-tree-surfer",


  -- -------------------------------------------------------
  -- KRAXLI ADDINGS:
  -- -------------------------------------------------------
  
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-context" },
  {
  	"romainl/vim-cool", -- disables search highlighting when you are done
  	event = { "CursorMoved", "InsertEnter" },
  },
  {
  	"folke/todo-comments.nvim",
  	requires = "nvim-lua/plenary.nvim",
  	config = function()
  		require("user.plugins.todo_comments").config()
  	end,
  	event = "BufRead",
  },
  --	{
  --		"tknightz/telescope-termfinder.nvim",
  --		after = { "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
  --		config = function()
  --			require("telescope").load_extension("termfinder")
  --		end,
  --	},
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
  	"sindrets/diffview.nvim",
  	opt = true,
  	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  	module = "diffview",
  	keys = "<leader>gd",
  	setup = function()
  		-- require("which-key").register { ["<leader>gd"] = "diffview: diff HEAD" }
  	end,
  	config = function()
  		require("diffview").setup({
  			enhanced_diff_hl = true,
  			key_bindings = {
  				file_panel = { q = "<Cmd>DiffviewClose<CR>" },
  				view = { q = "<Cmd>DiffviewClose<CR>" },
  			},
  		})
  	end,
  },
  {
  	"tpope/vim-fugitive",
  	cmd = "Git",
  },
  {
  	"junegunn/gv.vim",
  	cmd = "GV",
  },
  {
  	"TimUntersberger/neogit",
  	requires = { "nvim-lua/plenary.nvim", "diffview.nvim" },
  	cmd = "Neogit",
  	config = function()
  		require("user.plugins.neogit.config")
  	end,
  },
  -- {
  -- 	"tanvirtin/vgit.nvim",
  -- 	event = "BufWinEnter",
  -- 	cmd = "VGit",
  -- 	config = function()
  -- 		require("vgit").setup()
  -- 	end,
  -- },
  {
  	"ahmedkhalf/project.nvim",
  	event = "BufRead",
  	config = function()
  		require("project_nvim").setup({
  			-- configurations
  			require("telescope").load_extension("projects"),
  		})
  	end,
  },
  {
  	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
  	event = "BufReadPost", -- FileType BufRead
  	cmd = { "ToggleDiag" },
  },
  -- simple-diagnostics removes the noise of every line error, and only show the current line error.
  -- {
  -- 	"casonadams/simple-diagnostics.nvim",
  -- 	config = function()
  -- 		vim.diagnostic.config({
  -- 			virtual_text = false,
  -- 			underline = true,
  -- 			float = { source = "always" },
  -- 			severity_sort = true,
  -- 			signs = true,
  -- 			update_in_insert = false,
  -- 		})
  -- 		require("simple-diagnostics").setup({
  -- 			show_virtual_text = true,
  -- 			show_message_area = false,
  -- 		})
  -- 	end,
  -- 	setup = function()
  -- 		vim.diagnostic.config({
  -- 			virtual_text = false,
  -- 		})
  -- 	end,
  -- },
  {
  	"rafi/vim-venom",
  	ft = { "python" },
  	config = function()
  		require("user.plugins.venom")
  	end,
  	-- config = 'require("venom").setup()',  # for lua version which is inferior as of 2022-10-08
  	-- setup = function() vim.g.venom_loaded = 1 end ,  # for lua version which is inferior as of 2022-10-08
  },
  {
  	"folke/trouble.nvim",
  	config = function()
  		require("trouble").setup({
  			auto_open = false,
  			auto_close = true,
  			padding = false,
  			height = 10,
  			use_diagnostic_signs = true,
  		})
  	end,
  	cmd = { "Trouble", "TroubleToggle" },
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
  	disable = true,
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
  {
  	"SidOfc/mkdx",
  	ft = { "markdown", "text", "vimwiki" }, -- vimwiki.markdown
  	setup = function()
  		require("user.plugins.markdown.mkdx")
  	end,
  },
  {
  	"machakann/vim-sandwich",
  	keys = { "s" },
  	event = "BufReadPost",
  	config = function()
  		require("user.plugins.sandwich")
  	end,
  },
  {
  	"iamcco/markdown-preview.nvim",
  	run = function()
  		vim.fn["mkdp#util#install"]()
  	end,
  	-- run = "cd app && npm install",  -- does not seem to work on windows
  	ft = "markdown",
  	config = function()
  		require("user.plugins.markdown.markdown_preview")
  	end,
  },
  -- {
  -- 	"renerocksai/calendar-vim", -- TODO: lazy loading ft or cmd
  -- 	cmd = { "Calendar" },
  -- 	config = function()
  -- 		require("user.plugins.calendar-vim")
  -- 	end,
  -- },
  -- -- { 'mracos/mermaid.vim', ft = {'markdown', 'vimwiki', 'mermaid'} },
  -- { "chazmcgarvey/vim-mermaid", ft = { "markdown", "vimwiki", "mermaid" } },
  -- {
  -- 	"godlygeek/tabular",
  -- 	ft = { "markdown", "vimwiki" },
  -- },
  --
  -- -- TODO:
  {
  	"renerocksai/telekasten.nvim",
  	ft = { "markdown", "vimwiki", "text" },
  	cmd = { "Telekasten", "Tk" },
  	keys = { "<leader>z" },
  	config = function()
  		vim.cmd([[
         command! Tk :Telekasten
       ]])
  		require("user.plugins.telekasten")
  	end,
  },
  {
  	"lervag/vimtex",
  	ft = "tex",
  	setup = function()
  		require("user.plugins.vimtex")
  	end,
  },
  {
  	"ekickx/clipboard-image.nvim",
  	cmd = "PasteImg",
  	ft = { "markdown", "text", "vimwiki" },
  	config = function()
  		require("user.plugins.clipboard-image")
  	end,
  },
  
  -- {
  -- 	"nvim-orgmode/orgmode",
  -- 	ft = { "org" },
  -- 	after = "nvim-treesitter",
  -- 	config = function()
  -- 		require("user.plugins.orgmode")
  -- 		-- require('orgmode').setup{}
  -- 	end,
  -- 	disable = true,
  -- },
  -- {
  -- 	"nvim-neorg/neorg",
  -- 	config = function()
  -- 		require("neorg").setup({})
  -- 	end,
  -- },
  
  -- Colorschemes:
  { "Th3Whit3Wolf/one-nvim" }, -- lazy by nature
  { "sonph/onehalf", rtp = "vim" },
  { "NLKNguyen/papercolor-theme" },
  { "sainnhe/edge" },
  { "sainnhe/everforest" },
}

-- ====================================================
-- {
-- "gfeiyou/command-center.nvim",
-- requires = { "nvim-telescope/telescope.nvim" }
-- },  
