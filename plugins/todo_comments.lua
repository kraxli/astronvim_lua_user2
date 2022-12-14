local M = {}

local icons = {
	FIX = "律",
	TODO = " ",
	HACK = " ",
	WARN = "裂",
	PERF = "龍",
	NOTE = " ",
	ERROR = " ",
	REFS = "",
}
-- local icons = require("user.plugins.lspkind").todo_comments

M.config = function()
	local status_ok, todo = pcall(require, "todo-comments")
	if not status_ok then
		return
	end

	todo.setup({
		keywords = {
			FIX = { icon = icons.FIX },
			TODO = { icon = icons.TODO, alt = { "WIP" } },
			HACK = { icon = icons.HACK, color = "hack" },
			WARN = { icon = icons.WARN },
			PERF = { icon = icons.PERF },
			NOTE = { icon = icons.NOTE, alt = { "INFO", "NB" } },
			ERROR = { icon = icons.ERROR, color = "error", alt = { "ERR" } },
			REFS = { icon = icons.REFS },
		},
		highlight = { max_line_len = 120 },
		colors = {
			error = { "DiagnosticError" },
			warning = { "DiagnosticWarn" },
			info = { "DiagnosticInfo" },
			hint = { "DiagnosticHint" },
			hack = { "Function" },
			ref = { "FloatBorder" },
			default = { "Identifier" },
		},
	})
end

return M
