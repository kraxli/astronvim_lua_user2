-- Links and text formatting is concealed
vim.g.vim_markdown_conceal = 2
-- disable math conceal with LaTeX math syntax enabled,
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
-- Enable TOC window auto-fit
vim.g.vim_markdown_toc_autofit = 1
-- Text emphasis restriction to single/multi-lines
vim.g.vim_markdown_emphasis_multiline = 1
-- Fenced code block languages
vim.g.vim_markdown_fenced_languages = {
	"c++=cpp",
	"viml=vim",
	"bash=sh",
	"ini=dosini",
	"js=javascript",
	"json=javascript",
	"jsx=javascriptreact",
	"tsx=typescriptreact",
	"docker=Dockerfile",
	"makefile=make",
	"py=python",
}
-- turn on/off syntax extensions
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1
vim.g.vim_markdown_no_default_key_mappings = 1
vim.g.vim_markdown_autowrite = 0
vim.g.vim_markdown_auto_extension_ext = {'md', 'txt'}

vim.cmd([[
       let g:vim_markdown_frontmatter = 1
       let g:vim_markdown_strikethrough = 1
       let g:vim_markdown_folding_disabled = 1
       let g:vim_markdown_conceal = 1
       let g:vim_markdown_conceal_code_blocks = 1
       let g:vim_markdown_new_list_item_indent = 0
       let g:vim_markdown_auto_insert_bullets = 0
       let g:vim_markdown_toc_autofit = 0
       let g:vim_markdown_follow_anchor = 0
       let g:vim_markdown_no_extensions_in_markdown = 1
       let g:vim_markdown_edit_url_in = 'vsplit'
]])


-- map asdf <Plug>Markdown_MoveToParentHeader
-- To disable a map use:
-- map <Plug> <Plug>Markdown_MoveToParentHeader

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "]]", "<Plug>Markdown_MoveToNextHeader", { noremap = false })
vim.api.nvim_set_keymap("v", "]]", "<Plug>Markdown_MoveToNextHeader", { noremap = false })
vim.api.nvim_set_keymap("v", "[[", "<Plug>Markdown_MoveToPreviousHeader", { noremap = false })
vim.api.nvim_set_keymap("n", "[[", "<Plug>Markdown_MoveToPreviousHeader", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-CR>", "<Plug>Markdown_FollowLink", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<Plug>Markdown_CreateLink", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>Markdown_CreateLink", { noremap = true })
-- Example: vim.api.nvim_set_keymap("n", "<F6>", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})


--       call <sid>MapNotHasMapTo('][', 'Markdown_MoveToNextSiblingHeader', 'nv')
--       call <sid>MapNotHasMapTo('[]', 'Markdown_MoveToPreviousSiblingHeader', 'nv')
--       call <sid>MapNotHasMapTo(']u', 'Markdown_MoveToParentHeader', 'nv')
--       call <sid>MapNotHasMapTo(']c', 'Markdown_MoveToCurHeader', 'nv')
--       call <sid>MapNotHasMapTo('<TAB>', 'Markdown_Fold', 'n')
--       call <sid>MapNotHasMapTo('<TAB>', 'Markdown_Jump', 'i')

return {
  {'dkarter/bullets.vim',  -- kaymmm/bullets.nvim
    ft= {'markdown' , 'text', 'scratch', 'gitcommit', 'tex'},
    setup = function ()
      vim.cmd([[
        let g:bullets_nested_checkboxes = 0 
        " let g:bullets_checkbox_markers = '✗○◐●✓'
        let g:bullets_set_mappings = 0 " disable adding default key mappings, default = 1
        let g:bullets_mapping_leader = '<leader>L'  "'<M-b>'

        " default = []
        " N.B. You can set these mappings as-is without using this g:bullets_custom_mappings option but it
        " will apply in this case for all file types while when using g:bullets_custom_mappings it would
        " take into account file types filter set in g:bullets_enabled_file_types, and also
        " g:bullets_enable_in_empty_buffers option.
        let g:bullets_custom_mappings = [
          \ ['imap', '<cr>', '<Plug>(bullets-newline)'],
          \ ['inoremap', '<C-cr>', '<cr>'],
          \
          \ ['nmap', 'o', '<Plug>(bullets-newline)'],
          \ ['nmap', 'O', 'k<Plug>(bullets-newline)'],
          \
          \ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
          \ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
          \
          \ ['nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'],
          \ ['nmap', '>', '<Plug>(bullets-demote)'],
          \ ['vmap', '>', '<Plug>(bullets-demote)'],
          \ ['nmap', '<', '<Plug>(bullets-promote)'],
          \ ['vmap', '<', '<Plug>(bullets-promote)'],
          \ ]
        ]])
          -- \ ['imap', '<C-t>', '<Plug>(bullets-demote)'],
          -- \ ['imap', '<C-d>', '<Plug>(bullets-promote)'],
    end
  },
	{
		"renerocksai/calendar-vim", -- TODO: lazy loading ft or cmd
		cmd = { "Calendar", "Telekasten", "Tk", "CalendarH", "CalendarT" },
		ft = { "markdown", "vimwiki", "text", "telekasten" },
		config = function()
			vim.g.calendar_no_mappings=0
		end,
	},
	{
		"ekickx/clipboard-image.nvim",
		cmd = "PasteImg",
		ft = { "markdown", "text", "vimwiki" },
		config = function()
			require'clipboard-image'.setup {
  			default = {
					img_dir = 'img',
					img_dir_txt = 'img',
    			img_name = function ()
      			-- local img_dir = 'img' -- require'clipboard-image.config'.get_config().img_dir()
      			return os.date('%Y-%m-%d-%H-%M-%S')
    			end,
    			affix = '![](%s)',
  			},
  			-- markdown = {
  			--   img_dir = 'src/assets/img',
  			--   img_dir_txt = '/assets/img',
  			--   affix = '![](%s)',
  			-- },
			}
		end,
	},
}

-- {'jakewvincent/mkdnflow.nvim',
--       rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
--       config = function()
--           require('mkdnflow').setup({})
--       end,
--   	enable = false,
-- },
