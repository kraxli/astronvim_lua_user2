return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = function(_, opts)
		-- require("lugins.configs.neo-tree")(plugin, opts)
		opts.window = {
			mappings = {
				["<C-PageUp>"] = "prev_source",
				["<C-PageDown>"] = "next_source",
			},
		}
		return opts
	end,
}
