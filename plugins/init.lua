return {
  ["goolord/alpha-nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },

  ["andymass/vim-matchup"] = { after = "nvim-treesitter" },
  ["arsham/indent-tools.nvim"] = {
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "indent-tools.nvim") end,
    requires = { "arsham/arshlib.nvim", module = "arshlib" },
    config = function() require "user.plugins.indent-tools" end,
  },
  ["danymat/neogen"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    module = "neogen",
    cmd = "Neogen",
    config = function() require "user.plugins.neogen" end,
  },
  ["EdenEast/nightfox.nvim"] = { module = "nightfox", config = function() require "user.plugins.nightfox" end },
  ["ethanholz/nvim-lastplace"] = {
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "nvim-lastplace") end,
    config = function() require "user.plugins.nvim-lastplace" end,
  },
  ["hrsh7th/cmp-calc"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-calc" end },
  ["hrsh7th/cmp-emoji"] = { after = "nvim-cmp", config = function() require "user.plugins.cmp-emoji" end },
  ["jc-doyle/cmp-pandoc-references"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-pandoc-references" end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.typescript" end,
  },
  ["junegunn/vim-easy-align"] = {
    opt = true,
    setup = function() table.insert(astronvim.file_plugins, "vim-easy-align") end,
  },
  ["kdheepak/cmp-latex-symbols"] = {
    after = "nvim-cmp",
    config = function() require "user.plugins.cmp-latex-symbols" end,
  },
  -- ["machakann/vim-sandwich"] = {
  --   opt = true,
  --   setup = function() table.insert(astronvim.file_plugins, "vim-sandwich") end,
  -- },
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
  ["lvimuser/lsp-inlayhints.nvim"] = {
    module = "lsp-inlayhints",
    config = function() require "user.plugins.lsp-inlayhints" end,
  },
  ["sindrets/diffview.nvim"] = {
    opt = true,
    setup = function() table.insert(astronvim.git_plugins, "diffview.nvim") end,
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
  -- ["wakatime/vim-wakatime"] = {
  --   opt = true,
  --   setup = function() table.insert(astronvim.file_plugins, "vim-wakatime") end,
  -- },
  ["ziontee113/syntax-tree-surfer"] = {
    module = "syntax-tree-surfer",
    config = function() require "user.plugins.syntax-tree-surfer" end,
  },

	-- -------------------------------------------------------
	-- KRAXLI ADDINGS:
	-- -------------------------------------------------------

  -- enable DAP:
  ["mfussenegger/nvim-dap"] = { disable = false },
  ["rcarriga/nvim-dap-ui"] = { disable = false },
  ["jayp0521/mason-nvim-dap.nvim"] = { disable = false },


  -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim

  -- File Explorer --
  -- {'prichrd/netrw.nvim'},

  -- quickfix / location list --

  -- {"ten3roberts/qf.nvim"},
  -- {"arsham/listish.nvim"},

  ["mfussenegger/nvim-dap-python"] = {
    after = "mason-nvim-dap.nvim",
    config = function ()
      -- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('dap-python').setup('/usr/bin/python3')
    end,
    -- config = function() require "user.plugins.nvim-dap-vscode-js" end,
  },

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
	{
		"machakann/vim-sandwich",
		keys = { "s" },
		event = "BufReadPost",
		config = function()
			require("user.plugins.sandwich")
		end,
	},
	-- {
 --    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
 --    event = "TermOpen",
 --    requires = {
 --       "akinsho/nvim-toggleterm.lua",
 --       "nvim-telescope/telescope.nvim",
 --       "nvim-lua/popup.nvim",
 --       "nvim-lua/plenary.nvim",
 --    },
 --    config = function()
 --       require("telescope").load_extension "toggleterm"
 --    end,
 --    -- Open buffer picker with :Telescope toggleterm or lua require('telescope-toggleterm').open()
 --  },
	{
		"tknightz/telescope-termfinder.nvim",
		requires = { "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
		config = function()
			require("telescope").load_extension("termfinder")
		end,
	  -- Telescope termfinder find
	},
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

  ---------------------------------------------------------------------
	-- Markdown
	-- https://github.com/rockerBOO/awesome-neovim/blob/main/README.md#markdown-and-latex
  ---------------------------------------------------------------------
  -- NFrid/markdown-togglecheck
  -- lervag/wiki.vim
  -- lervag/wiki-ft.vim

  -- {
  --   'ixru/nvim-markdown',
  --   ft='markdown',
  --   config = function () require('user.plugins.markdown.vim-markdown') end
  --   disable = true,
  -- },
    -- 'prashanthellina/follow-markdown-links',
  --   'jghauser/follow-md-links.nvim',
  {'dkarter/bullets.vim',  -- kaymmm/bullets.nvim
    ft= {'markdown' , 'text', 'scratch', 'gitcommit', 'tex'},
    setup = function ()
      vim.cmd([[
        let g:bullets_nested_checkboxes = 0 
        " let g:bullets_checkbox_markers = '✗○◐●✓'
        let g:bullets_set_mappings = 0 " disable adding default key mappings, default = 1
        let g:bullets_mapping_leader = '<leader>L'  "'<M-b>'

        " default = []
        " N.B. You can set these mappings as-is without using this g:bullets_custom_mappings option but it
        " will apply in this case for all file types while when using g:bullets_custom_mappings it would
        " take into account file types filter set in g:bullets_enabled_file_types, and also
        " g:bullets_enable_in_empty_buffers option.
        let g:bullets_custom_mappings = [
          \ ['imap', '<cr>', '<Plug>(bullets-newline)'],
          \ ['inoremap', '<C-cr>', '<cr>'],
          \
          \ ['nmap', 'o', '<Plug>(bullets-newline)'],
          \
          \ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
          \ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
          \
          \ ['nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'],
          \ ['nmap', '>', '<Plug>(bullets-demote)'],
          \ ['vmap', '>', '<Plug>(bullets-demote)'],
          \ ['nmap', '<', '<Plug>(bullets-promote)'],
          \ ['vmap', '<', '<Plug>(bullets-promote)'],
          \ ]
        ]])
          -- \ ['imap', '<C-t>', '<Plug>(bullets-demote)'],
          -- \ ['imap', '<C-d>', '<Plug>(bullets-promote)'],
    end
  },
  -- { 'gaoDean/autolist.nvim',
  --   ft= {'markdown' , 'text'},
  --   config = function()
  --     local autolist = require("autolist")
  --     autolist.setup()
  --     autolist.create_mapping_hook("i", "<CR>", autolist.new)
  --     autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
  --     autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent)
  --     -- autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
  --     autolist.create_mapping_hook("n", "<leader>Lr", autolist.force_recalculate)
  --     autolist.create_mapping_hook("n", "o", autolist.new)
  --     autolist.create_mapping_hook("n", "O", autolist.new_before)
  --     autolist.create_mapping_hook("n", "<leader>L>", autolist.indent)
  --     autolist.create_mapping_hook("n", "<leader>L<", autolist.indent)
  --     autolist.create_mapping_hook("n", "<leader>Lx", autolist.invert_entry, "")
  --     -- require('autolist').setup({
  --     --     normal_mappings = {
  --     --       invert = { "<c-d>+[catch]" },  -- or <c-r>
  --     --     },
  --     --   	insert_mappings = {
  --     --       indent = {
		-- 	   --      "<tab>+[catch]('>')",
		-- 	   --      "<s-tab>+[catch]('<')",
		--     --     },
		--     --   },
  --     -- })
  --   end,
  --   disable = true,
  -- },
  {'jakewvincent/mkdnflow.nvim',
      rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
      config = function()
          require('mkdnflow').setup({})
      end
  },
	-- {
	-- 	"SidOfc/mkdx",
	-- 	ft = { "markdown", "text", "vimwiki" }, -- vimwiki.markdown
	-- 	setup = function()
	-- 		require("user.plugins.markdown.mkdx")
	-- 	end,
	-- },
  {
    'davidgranstrom/nvim-markdown-preview',
    cmd = {'MarkdownPreview', 'Pv', 'Mp'},
    -- run = function() vim.cmd("PlugInstall") end,
  },

	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- 	-- run = "cd app && npm install",  -- does not seem to work on windows
	-- 	ft = "markdown",
	-- 	config = function()
	-- 		require("user.plugins.markdown.markdown_preview")
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
		ft = { "markdown", "vimwiki", "text", "telekasten" },
		cmd = { "Telekasten", "Tk" },
		keys = { "<leader>z" },
		setup = function()
			vim.cmd([[
         command! Tk :Telekasten
         au! FileType telekasten set filetype=markdown
         ]])
		end,
		config = function ()
		  require("user.plugins.telekasten")
		end
		-- disable = true,
	},
	{
		"renerocksai/calendar-vim", -- TODO: lazy loading ft or cmd
		cmd = { "Calendar", "Telekasten", "Tk", "CalendarH", "CalendarT" },
		ft = { "markdown", "vimwiki", "text", "telekasten" },
		config = function()
			require("user.plugins.calendar-vim")
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

  {"rebelot/kanagawa.nvim"},  -- prob the best
	{"olimorris/onedarkpro.nvim"},
  {"Mofiqul/vscode.nvim"},
  {"marko-cerovac/material.nvim"},
  {"Th3Whit3Wolf/Space-Theme"},
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
