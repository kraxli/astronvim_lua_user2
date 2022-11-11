return {
  ["goolord/alpha-nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },

  ["andymass/vim-matchup"] = { after = "nvim-treesitter" },
  ["arsham/indent-tools.nvim"] = {
    requires = "arsham/arshlib.nvim",
    config = function() require "user.plugins.indent-tools" end,
  },
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    module = "neogen",
    cmd = "Neogen",
    config = function() require "user.plugins.neogen" end,
  },
  ["EdenEast/nightfox.nvim"] = { config = function() require "user.plugins.nightfox" end },
  ["ethanholz/nvim-lastplace"] = { config = function() require "user.plugins.nvim-lastplace" end },
  ["hrsh7th/cmp-calc"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-calc" end },
  ["hrsh7th/cmp-emoji"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-emoji" end },
  ["hrsh7th/cmp-omni"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-omni" end },
  ["jayp0521/mason-nvim-dap.nvim"] = {
    after = { "mason.nvim", "nvim-dap" },
    config = function() require "user.plugins.mason-nvim-dap" end,
  },
  ["jc-doyle/cmp-pandoc-references"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-pandoc-references" end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.typescript" end,
  },
  ["junegunn/vim-easy-align"] = {},
  ["kdheepak/cmp-latex-symbols"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-latex-symbols" end,
  },
  -- ["machakann/vim-sandwich"] = {},
  ["mfussenegger/nvim-dap"] = {},
  ["mtikekar/nvim-send-to-term"] = {
    cmd = "SendHere",
    config = function() require "user.plugins.nvim-send-to-term" end,
  },
  ["mxsdev/nvim-dap-vscode-js"] = {
    after = "mason-nvim-dap.nvim",
    config = function() require "user.plugins.nvim-dap-vscode-js" end,
  },
  ["nanotee/sqls.nvim"] = { module = "sqls" },
  ["nvim-telescope/telescope-bibtex.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-bibtex" end,
  },
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-file-browser" end,
  },
  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-hop" end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-media-files" end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    config = function() require "user.plugins.telescope-project" end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["p00f/clangd_extensions.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.clangd_extensions" end,
  },
  ["rcarriga/nvim-dap-ui"] = { after = "nvim-dap", config = function() require "user.plugins.dapui" end },
  ["sindrets/diffview.nvim"] = {
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function() require "user.plugins.diffview" end,
  },
  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    config = function() require "user.plugins.nvim-dap-virtual-text" end,
  },
  ["vitalk/vim-simple-todo"] = {  -- Micah seems to have removed vim-simple-tod
    keys = {
      "<Plug>(simple-todo-above)",
      "<Plug>(simple-todo-below)",
      "<Plug>(simple-todo-mark-as-done)",
      "<Plug>(simple-todo-mark-as-undone)",
      "<Plug>(simple-todo-mark-switch)",
      "<Plug>(simple-todo-new-list-item)",
      "<Plug>(simple-todo-new-list-item-start-of-line)",
    },
    config = function() require "user.plugins.vim-simple-todo" end,
  },
  -- ["wakatime/vim-wakatime"] = { event = "BufEnter" },
  ["ziontee113/syntax-tree-surfer"] = {
    cmd = {
      "STSSwapUpNormal",
      "STSSwapDownNormal",
      "STSSelectCurrentNode",
      "STSSelectMasterNode",
      "STSSelectParentNode",
      "STSSelectChildNode",
      "STSSelectPrevSiblingNode",
      "STSSelectNextSiblingNode",
      "STSSwapNextVisual",
      "STSSwapPrevVisual",
    },
    config = function() require "user.plugins.syntax-tree-surfer" end,
  },

	-- -------------------------------------------------------
	-- KRAXLI ADDINGS:
	-- -------------------------------------------------------

	-- cmp
	{"hrsh7th/cmp-cmdline", after = "nvim-cmp", },

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
  -- see also metakirby5/codi.vim !
  --
  -- { 'dccsillag/magma-nvim',
  --   run = 'UpdateRemotePlugins',
  --   config = function()
  --     vim.cmd([[
  --       nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
  --       nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
  --       xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
  --       nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
  --       nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
  --       nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>
  --
  --       let g:magma_automatically_open_output = v:false
  --       let g:magma_image_provider = "ueberzug"
  --     ]])
  --   end
  -- },
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
		disable = true
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
