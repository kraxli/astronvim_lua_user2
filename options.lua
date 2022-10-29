-- IS_WINDOWS = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)

-- variables specific to this repo
CONFIGS = {}
CONFIGS.toggleterm = {
	filetype2exclude = { "alpha" },
	default = { repl = "zsh" },
	python = { repl = "ipython", exe_file_terminal = "ipython", exe_file_opt = "-i", exe_cmd = [[\%run]] },
	-- lua = {repl = 'lua5.1'},
}

-- vim.o.cmdheigs=2
-- vim.opt.completeopt = { "menuone", "noselect" }

return {
	opt = {
		conceallevel = 2, -- enable conceal
		foldenable = false,
		foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
		foldmethod = "expr",
		linebreak = true, -- linebreak soft wrap at words
		list = true, -- show whitespace characters
		listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
		shortmess = vim.opt.shortmess + { I = true },
		showbreak = "↪ ",
		-- spellfile = "~/.config/astronvim/spell/en.utf-8.add",
		thesaurus = "~/.config/astronvim/spell/mthesaur.txt",
		-- dictionary = {"~/.config/nvim/lua/user/spell/de.utf-8.spl"},
		wrap = true, -- soft wrap lines
		relativenumber = false, -- Show relative numberline
		number = true,
		timeoutlen = 300, --- Time out on mappings
		ttimeoutlen = 10, --- Time out on key codes
		updatetime = 200, --- Idle time to write swap and trigger CursorHold
		redrawtime = 2000, --- Time in milliseconds for stopping display redraw
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		colorcolumn = "99999", -- fixes indentline for now
		fileencoding = "utf-8", -- the encoding written to a file
		foldlevel = 99,
		hidden = true, -- required to keep multiple buffers and open multiple buffers
		hlsearch = true, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		smartcase = true,
	},
	g = {
		maplocalleader = ",",
		matchup_matchparen_deferred = 1,
	},
	wo = {
		number = true,
	},
}
