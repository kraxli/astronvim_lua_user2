vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

-- -------------------------------------------------------
-- kraxli:
-- -------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


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

  autocmd FileType vimwiki.markdown,vimwiki,markdown,text,telekasten setl spell spelllang=en,de filetype=markdown syntax=markdown

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


-- text like documents enable wrap and spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex", "tex", "vimwiki.markdown", "vimwiki", "telekasten" },
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
