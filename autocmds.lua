vim.api.nvim_create_augroup("autocomp", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
	desc = "Stop running auto compiler",
	group = "autocomp",
	pattern = "*",
	callback = function()
		vim.fn.jobstart({ "autocomp", vim.fn.expand("%:p"), "stop" })
	end,
})

vim.api.nvim_create_augroup("dapui", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	desc = "Make q close dap floating windows",
	group = "dapui",
	pattern = "dap-float",
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close!<cr>")
	end,
})

vim.api.nvim_create_augroup("mini", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen", "FileType alpha" }, {
	desc = "Disable indent scope for conent types",
	group = "mini",
	callback = function()
		vim.b.miniindentscope_disable =
			vim.tbl_contains({ "help", "terminal", "nofile", "prompt", "alpha" }, vim.bo.buftype)
	end,
})

-- -------------------------------------------------------
-- kraxli:
-- -------------------------------------------------------

-- autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup="IncSearch", timeout=150})   -- higroup = 'Visual'
vim.api.nvim_create_augroup("TextYankPost", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text while yanking",
	group = "TextYankPost",
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({ higroup = "IncSearch", timeout = 150 })
	end, -- higroup = 'Visual'
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- augroup("_terminal", {})
-- autocmd("TermEnter term://*toggleterm#*",{
--   desc="ToggleTerm with <c-t> in terminal mode",
--   group='_terminal',
--   command='tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>',
-- })

augroup("FloatingWindow", { clear = true })
autocmd("TermEnter term://*toggleterm#*", {
	desc = "Close floating window",
	group = "FloatingWindow",
	-- pattern = "*",
	command = "nnoremap <silent><buffer> q :close<CR>",
	-- command='tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>',
})

-- augroup("MarkdownBuf", { clear = true })
-- autocmd({ "BufRead", "BufEnter", "BufWinEnter", "BufNew", "VimEnter", "InsertEnter" }, {
-- 	group = "MarkdownBuf",
-- 	desc = "Buffer markdown",
-- 	pattern = { "*.md", "*.wiki" },
-- 	callback = function()
-- 		require("user.highlight").markdown()
-- 	end,
-- 	-- command = "lua require('user.highlight').markdown()",
-- })

vim.cmd([[
	
	augroup _MarkdownBuf
	autocmd!

  autocmd BufRead,BufEnter,BufWinEnter,BufNew,VimEnter *.md,*.wiki setlocal filetype=markdown " vimwiki.markdown
  autocmd BufRead,BufEnter,BufWinEnter,BufNew,BufWrite,VimEnter,InsertEnter *.md,*.wiki lua require('user.highlight').markdown()
  " autocmd FileType vimwiki.markdown,vimwiki,markdown,text set foldmethod=expr foldexpr=MkdFoldSimple()
  autocmd FileType vimwiki.markdown,vimwiki,markdown,text setl spell spelllang=en,de

  augroup end

  augroup _General
  autocmd!
  
	autocmd WinClosed,WinEnter * if winnr('$') == 1 && &ft == "neo-tree" | q | endif
  autocmd FileType toggleterm,qf,help,man,lspinfo,TelescopePrompt nnoremap <silent><buffer> q :close!<CR>
  autocmd FileType toggleterm,qf,help,man,lspinfo,TelescopePrompt nnoremap <silent><buffer> <localleader>c :close!<CR>
  " set file types
  
  augroup end
  
  augroup _Alpha
    autocmd!
		autocmd FileType alpha set nospell
  	"   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

]])
