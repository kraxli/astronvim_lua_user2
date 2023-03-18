return {
	{"hrsh7th/cmp-cmdline", after = "nvim-cmp", },
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"romainl/vim-cool", -- disables search highlighting when you are done
		event = { "CursorMoved", "InsertEnter" },
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
		"tknightz/telescope-termfinder.nvim",
		requires = { "nvim-telescope/telescope.nvim", "akinsho/toggleterm.nvim" },
		config = function()
			require("telescope").load_extension("termfinder")
		end,
	  -- Telescope termfinder find
	},
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		event = "BufReadPost", -- FileType BufRead
		cmd = { "ToggleDiag" },
	},
	{
	  "tpope/vim-abolish",
		ft = { "markdown", "text", "vimwiki" },
		config = function()
			vim.cmd([[
  			Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
  			Abolish {infal}{a,}{tion,ted} {infl}{a}{}
			]])
		end,
	},
}
