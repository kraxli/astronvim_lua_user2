vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler on leave",
  group = vim.api.nvim_create_augroup("quit_autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable wrap and spell for text like documents",
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- -------------------------------------------------------
-- kraxli:
-- -------------------------------------------------------

-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd("FileType", {
  desc = "settings for markdown and other 'writer' files",
  group = vim.api.nvim_create_augroup("_Markdown_FileType", { clear = true }),
  pattern = { "gitcommit", "markdown", "text", "plaintex", "vimwiki.markdown", "vimwiki", "markdown", "telekasten" },
  callback = function()
    vim.g.diagnostics_mode = 0
    vim.opt_local.wrap = true
    vim.opt_local.tabstop=2
    vim.opt_local.shiftwidth=2
    vim.opt_local.filetype="markdown"
    vim.opt_local.syntax="markdown"
  end,
})

-- text like documents enable  spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex", "tex", "vimwiki.markdown", "vimwiki", "telekasten" },
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "de,en"
  end,
})

-- auto hide tabline
vim.api.nvim_create_autocmd("User", {
  desc = "Auto hide tabline",
  group = vim.api.nvim_create_augroup("autohide_tabline", { clear = true }),
  pattern = "AstroBufsUpdated",
  callback = function()
    local new_showtabline = #vim.t.bufs > 1 and 2 or 1
    if new_showtabline ~= vim.opt.showtabline:get() then vim.opt.showtabline = new_showtabline end
  end,
})

vim.cmd([[

	if (has('win32') || has('win64'))
		augroup _Colors
			au! ColorScheme kanagawa hi link TelescopeSelection Normal
		augroup end
	end

	augroup _MarkdownBuf
	autocmd!

  " autocmd BufRead,BufEnter,BufWinEnter,BufNew,VimEnter *.md,*.wiki setlocal filetype=markdown " vimwiki.markdown
  autocmd BufRead,BufEnter,BufWinEnter,BufNew,BufWrite,VimEnter,InsertEnter *.md,*.wiki,*.txt lua require('user.highlight').markdown()
  " autocmd FileType vimwiki.markdown,vimwiki,markdown,text set foldmethod=expr foldexpr=MkdFoldSimple()

  " autocmd FileType vimwiki.markdown,vimwiki,markdown,text,telekasten setl spell spelllang=en,de filetype=markdown syntax=markdown wrap

  augroup end

  augroup _General
  autocmd!

	autocmd WinClosed,WinEnter * if winnr('$') == 1 && &ft == "neo-tree" | q | endif
  autocmd FileType toggleterm,qf,help,man,lspinfo nnoremap <silent><buffer> q :q!<CR>  " ,TelescopePrompt
  autocmd FileType toggleterm,qf,help,man,lspinfo nnoremap <silent><buffer> <localleader>c :close!<CR>  " ,TelescopePrompt
  " set file types

  augroup end

  augroup _Alpha
    autocmd!
		autocmd FileType alpha set nospell
  	"   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

]])


