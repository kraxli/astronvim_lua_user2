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
		-- opts.sort_function = require('neo-tree.sources.common.commands').order_by_modified({VIM_BUFFER_MODIFIED_SET = "vim_buffer_modified_set",})
		return opts
	end,
}
