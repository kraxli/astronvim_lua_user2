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
	{
  	"gaoDean/autolist.nvim",
		enabled = false,
  	ft = {
    	"markdown",
    	"text",
    	"tex",
    	"plaintex",
    	"norg",
  	},
  	config = function()
        require("autolist").setup()

        -- vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        -- vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
        -- vim.keymap.set("n", "<C-space>", "<cmd>AutolistToggleCheckbox<cr>")
        vim.keymap.set("n", "<leader>zt", "<cmd>lua require('user.utils').handle_checkbox_autolist()<CR>")
        vim.keymap.set("n", "<C-space>", "<cmd>lua require('user.utils').handle_checkbox_autolist()<CR>")
        -- vim.keymap.set("v", "<leader>zt", "<cmd>lua require('user.utils').handle_checkbox()<CR>")
        -- vim.keymap.set("v", "<C-space>", "<cmd>lua require('user.utils').handle_checkbox()<CR>")

        -- cycle list types with dot-repeat
        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

        -- if you don't want dot-repeat
        -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
        -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

        -- functions to recalculate list on edit
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "> ", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "< ", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
  	end,
	},
	{
		"dkarter/bullets.vim",
		enabled = true,
		ft = {
    	"markdown",
    	"text",
    	"tex",
    	"plaintex",
  	},
  	-- init
		config = function ()
			vim.cmd([[
			  let g:bullets_delete_last_bullet_if_empty = 1
			  let g:bullets_auto_indent_after_colon = 1
			  let g:bullets_max_alpha_characters = 2
			  let g:bullets_renumber_on_change = 1
			  let g:bullets_nested_checkboxes = 1
			  let g:bullets_checkbox_markers = ' .oOX'  " '✗○◐●✓'
			  let g:bullets_checkbox_partials_toggle = 1
			  let g:bullets_set_mappings = 0 " disable adding default key mappings, default = 1

				" default = []
				" N.B. You can set these mappings as-is without using this g:bullets_custom_mappings option but it
				" will apply in this case for all file types while when using g:bullets_custom_mappings it would
				" take into account file types filter set in g:bullets_enabled_file_types, and also
				" g:bullets_enable_in_empty_buffers option.
				let g:bullets_custom_mappings = [
  				\ ['imap', '<cr>', '<Plug>(bullets-newline)'],
  				\ ['inoremap', '<C-cr>', '<cr>'],
  				\
  				\ ['noremap', 'O', 'k<Plug>(bullets-newline)'],
  				\ ['nmap', 'o', '<Plug>(bullets-newline)'],
  				\
  				\ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
  				\ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
  				\
  				\ ['imap', '<C-t>', '<Plug>(bullets-demote)'],
  				\ ['nmap', '>>', '<Plug>(bullets-demote)'],
  				\ ['nmap', '> ', '<Plug>(bullets-demote)'],
  				\ ['vmap', '>', '<Plug>(bullets-demote)'],
  				\ ['imap', '<C-d>', '<Plug>(bullets-promote)'],
  				\ ['nmap', '<<', '<Plug>(bullets-promote)'],
  				\ ['vmap', '<', '<Plug>(bullets-promote)'],
  				\ ['vmap', '< ', '<Plug>(bullets-promote)'],
  				\ ]
  				" \ ['nmap', '<c-space>', '<Plug>(bullets-toggle-checkbox)'],
  				" \ ['nmap', 'zt', '<Plug>(bullets-toggle-checkbox)'],
  				" \

			  noremap O k<Plug>(bullets-newline)

				]])

        vim.keymap.set("n", "<leader>zt", "<cmd>lua require('user.utils').handle_checkbox_bullets()<CR>")
        vim.keymap.set("n", "<C-space>", "<cmd>lua require('user.utils').handle_checkbox_bullets()<CR>")

		end,
	},
	{
		"ekickx/clipboard-image.nvim",
		cmd = "PasteImg",
		ft = { "markdown", "text", "vimwiki" },
		config = function()
			require('clipboard-image').setup {
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
		-- enabled = false,
	},
	-- {
	-- 	"niuiic/cp-image.nvim",
	-- 	dependencies = {"niuiic-core.nvim"},
	-- 	cmd = "PasteImg",
	-- 	ft = { "markdown", "text", "vimwiki" },
	-- 	config = function()
	-- 		require("cp-image").setup(
 --    			-- default config
 --    			{
 --        			-- how to generate the image from clipboard and place it
 --        			-- image_type is the suffix of file name
 --        			cmd = function(path, image_type)
 --            			return string.format("xclip -selection clipboard -t image/%s -o > %s", image_type, path)
 --        			end,
 --        			---@diagnostic disable-next-line:unused-local
 --        			-- text to insert
 --        			-- relative_path is relative to the root path of the project
 --        			text = function(relative_path, file_name, file_type, full_path)
 --            			return string.format("![%s](%s)", file_name, relative_path)
 --        			end,
 --        			-- default directory path to store image
 --        			path = function(project_root)
 --            			return project_root
 --        			end,
 --        			-- used to search root path of the project
 --        			-- if .git does not exist, current directory path would be used
 --        			root_pattern = ".git",
 --        			-- command to create directory
 --        			create_dir = "mkdir -p",
 --    			}
	-- 		)
	-- 	end,
	-- 	enabled = false,
	-- },
	-- {
	-- 	"niuiic/niuiic-core.nvim",
	-- },
	{
  	'cnshsliu/smp.nvim',
  	build="cd $XDG_DATA_HOME/nvim/lazy/smp.nvim/lua/server && npm install",
	  ft = { "markdown" },
	 --  config = function() require("smp").setup({
		-- 		-- home = require("telekasten").Cfg.home or vim.fn.expand("~/zettelkasten"),
		-- 		-- home = vim.fn.expand("~/zettelkasten"),
		-- 		-- templates = home .. "/" .. "templates",
		-- 		-- smp_markdown_css = "~/.config/smp/my_markdown.css",
		-- 		-- smp_snippets_folder = "~/.config/smp/snippets",
		-- 	})
		-- end,
		enabled=false,
	},
	{
    "iamcco/markdown-preview.nvim",
  	-- version = "v0.0.10",
	  build = "cd $XDG_DATA_HOME/nvim/lazy/markdown-preview.nvim/app && npm install",  -- npm install && npm audit fix --force",
    -- build = function() vim.fn["call mkdp#util#install"]() end,
	  ft = { "markdown" },
	  setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
	  -- enabled=false,
	},
}
