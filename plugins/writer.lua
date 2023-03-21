return {
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
