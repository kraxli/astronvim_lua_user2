M = {}

-- if vim.g["mkdx#settings"] then
-- 	vim.g["mkdx#settings"] = {}
-- end

vim.cmd([[
		if !exists("g:mkdx#settings")
			let g:mkdx#settings = {}
		end
		let g:mkdx#settings.checkbox = { 'initial_state' : ' ' }
		let g:mkdx#settings = { 'toc': { 'text': 'TOC' } }
		let g:mkdx#settings = { 'highlight': { 'enable': 1 } }
		let g:mkdx#settings = { 'fold': { 'enable': 1 } }
		let g:mkdx#settings = { 'fold': { 'components': ['toc', 'fence'] } }
		let g:mkdx#settings.highlight = { 'enable' : 0 }

		" pefix!
		let g:mkdx#settings = { 'map': { 'prefix': 'm' } }

		fun! s:MkdxRemap()
    	nmap <buffer><silent> m<space> <Plug>(mkdx-checkbox-next-n)
    	vmap <buffer><silent> m<space> <Plug>(mkdx-checkbox-next-v)
		endfun

		augroup Mkdx
    	au!
    	au FileType markdown,mkdx call s:MkdxRemap()
		augroup END
	]])
