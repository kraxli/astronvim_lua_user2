local utils = require "user.utils"

return {
  n = {
    ["<leader>"] = {
      b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
      r = { "<cmd>SendHere<cr>", "Set REPL" },
      N = { "<cmd>tabnew<cr>", "New Buffer" },
      ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
      ["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },

      a = {
        name = "Annotate",
        ["<cr>"] = { function() require("neogen").generate() end, "Current" },
        c = { function() require("neogen").generate { type = "class" } end, "Class" },
        f = { function() require("neogen").generate { type = "func" } end, "Function" },
        t = { function() require("neogen").generate { type = "type" } end, "Type" },
        F = { function() require("neogen").generate { type = "file" } end, "File" },
      },

      d = {
        name = "Diff View",
        ["<cr>"] = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
        h = { "<cmd>DiffviewFileHistory %<cr>", "Open DiffView File History" },
        H = { "<cmd>DiffviewFileHistory<cr>", "Open DiffView Branch History" },
      },

      f = {
        name = "Telescope",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
        B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
        e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
        h = { "<cmd>Telescope oldfiles<cr>", "History" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        M = { "<cmd>Telescope media_files<cr>", "Media" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        p = { "<cmd>Telescope project<cr>", "Projects" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
		-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
		-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
		-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
		-- commands
		-- tags
      },

      m = {
        name = "Compiler/Make",
        k = {
          function()
            vim.cmd "silent! write"
            local filename = vim.fn.expand "%:t"
            utils.async_run(
              { "compiler", vim.fn.expand "%:p" },
              function() utils.quick_notification("Compiled " .. filename) end
            )
          end,
          "Compile",
        },
        a = {
          function()
            vim.notify "Autocompile Started"
            utils.async_run(
              { "autocomp", vim.fn.expand "%:p" },
              function() utils.quick_notification "Autocompile stopped" end
            )
          end,
          "Auto Compile",
        },
        v = { function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end, "View Output" },
        b = {
          function()
            local filename = vim.fn.expand "%:t"
            utils.async_run({
              "pandoc",
              vim.fn.expand "%",
              "--pdf-engine=xelatex",
              "--variable",
              "urlcolor=blue",
              "-t",
              "beamer",
              "-o",
              vim.fn.expand "%:r" .. ".pdf",
            }, function() utils.quick_notification("Compiled " .. filename) end)
          end,
          "Compile Beamer",
        },
        p = {
          function()
            local pdf_path = vim.fn.expand "%:r" .. ".pdf"
            if vim.fn.filereadable(pdf_path) == 1 then vim.fn.jobstart { "pdfpc", pdf_path } end
          end,
          "Present Output",
        },
        l = { function() utils.toggle_qf() end, "Logs" },
        t = { "<cmd>TexlabBuild<cr>", "LaTeX" },
        f = { "<cmd>TexlabForward<cr>", "Forward Search" },
      },

      w = { -- or w
        name = "Document",
        n = { "<cmd>enew<cr>", "New File" },
        s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
        t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
        p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
        b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
        c = { function() utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal") end, "Toggle Conceal" },
        w = { function() utils.vim_opt_toggle("wrap", true, false, "Soft Wrap") end, "Toggle Soft Wrapping" },
        W = { function() utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap") end, "Toggle Hard Wrapping" },
        m = { function() require("nabla").popup() end, "Preview Math" },
      },

      -- h = {
      --   name = "Hop",
      --   c = { "<cmd>HopChar1<cr>", "Character" },
      --   C = { "<cmd>HopChar2<cr>", "2 Characters" },
      --   l = { "<cmd>HopLine<cr>", "Line" },
      --   p = { "<cmd>HopPattern<cr>", "Pattern" },
      --   w = { "<cmd>HopWord<cr>", "Word" },
      -- },

      s = {
        name = "Surf",
        s = { "<cmd>STSSelectMasterNode<cr>", "Surf" },
        S = { "<cmd>STSSelectCurrentNode<cr>", "Surf Node" },
      },

      x = {
        name = "Debugger",
        b = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
        B = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" },
        c = { function() require("dap").continue() end, "Continue" },
        i = { function() require("dap").step_into() end, "Step Into" },
        l = { function() require("dapui").float_element "breakpoints" end, "List Breakpoints" },
        o = { function() require("dap").step_over() end, "Step Over" },
        q = { function() require("dap").close() end, "Close Session" },
        Q = { function() require("dap").terminate() end, "Terminate" },
        r = { function() require("dap").repl.toggle() end, "REPL" },
        s = { function() require("dapui").float_element "scopes" end, "Scopes" },
        t = { function() require("dapui").float_element "stacks" end, "Threads" },
        u = { function() require("dapui").toggle() end, "Toggle Debugger UI" },
        w = { function() require("dapui").float_element "watches" end, "Watches" },
        x = { function() require("dap.ui.widgets").hover() end, "Inspect" },
      },
			D = { "<cmd>Dashboard<CR>", "Dashboard" },

			-- Git, enhance base functionality
			g = {
				L = {"<cmd>Git blame<cr>", "Git blame file"},
				m = { "<cmd>Neogit<CR>", "Magit" }, -- noremap=true
        v = { "<cmd>DiffviewOpen<cr>", "Diffview open" },
        q = { "<cmd>DiffviewClose<cr>", "Diffview close" },
				y = {
					"<cmd>lua require('core.utils').toggle_term_cmd({cmd = 'lazygit', count = 1, direction = 'float'})<CR>",
					"Lazygit",
				},
				-- g = {"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>", 'Lazygit'},
			},

			u = {
				name = "Utils",
				w = { "<cmd>keeppatterns %substitute/\\s\\+$//e<CR>", "Clear postspace" },
			},
			i = { -- micah has redundatn double mapping (only one leaf)
				name = "Treesitter",
				v = {function() require("syntax-tree-surfer").targeted_jump({ "variable_declaration" }) end, "Go to Variables", }, 

				f = { function() require("syntax-tree-surfer").targeted_jump({ "function" }) end, "Go to Functions", },
				i = { function() require("syntax-tree-surfer").targeted_jump({
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
						}) end, "Go to If Statements", },
				r = { function() require("syntax-tree-surfer").targeted_jump({ "for_statement" }) end, "Go to If Statements", },
				w = { function() require("syntax-tree-surfer").targeted_jump({ "white_statement" }) end, "Go to While Statements", },
				s = { function() require("syntax-tree-surfer").targeted_jump({ "switch_statement" }) end, "Go to Switch Statements", },
				t = { function() require("syntax-tree-surfer").targeted_jump({ "function",
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
							"for_statement",
							"while_statement",
							"switch_statement",
						})
					end, "Go to Statement", },
			},

    },
    ["]"] = {
      f = "Next function start",
      x = "Next class start",
      F = "Next function end",
      X = "Next class end",
    },
    ["["] = {
      f = "Previous function start",
      x = "Previous class start",
      F = "Previous function end",
      X = "Previous class end",
    },
    g = {
      t = {
        name = "Treesitter",
        v = {
          function() require("syntax-tree-surfer").targeted_jump { "variable_declaration" } end,
          "Go to Variables",
        },
        f = {
          function() require("syntax-tree-surfer").targeted_jump { "function" } end,
          "Go to Functions",
        },
        i = {
          function()
            require("syntax-tree-surfer").targeted_jump {
              "if_statement",
              "else_clause",
              "else_statement",
              "elseif_statement",
            }
          end,
          "Go to If Statements",
        },
        r = {
          function() require("syntax-tree-surfer").targeted_jump { "for_statement" } end,
          "Go to If Statements",
        },
        w = {
          function() require("syntax-tree-surfer").targeted_jump { "white_statement" } end,
          "Go to While Statements",
        },
        s = {
          function() require("syntax-tree-surfer").targeted_jump { "switch_statement" } end,
          "Go to Switch Statements",
        },
        t = {
          function()
            require("syntax-tree-surfer").targeted_jump {
              "function",
              "if_statement",
              "else_clause",
              "else_statement",
              "elseif_statement",
              "for_statement",
              "while_statement",
              "switch_statement",
            }
          end,
          "Go to Statement",
        },
      },
    },
    ["<localleader>"] = {

	-- TODO: commented out commands are not working - check rafi/vim-config for fix
	-- Telescope general pickers
	a = { "<Cmd>Neotree toggle dir=%:p:h<CR>", "Neotree toggle" }, -- Nvimtree /  Neotree focus
	b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
	c = { '<cmd>lua require("telescope.builtin").command_history()<CR>', "Command history" },
	d = { '<cmd>lua require"user.plugins.telescope".pickers.plugin_directories()<CR>', "Directories" },
	-- Trouble & Diagnostics --
	D = {
		name = "Diagnostics",
		c = { "<cmd>TroubleClose<cr>", "Close" },
		d = { "<cmd>ToggleDiag<cr>", "Toggle diagnostics" },
		D = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
		i = { "<cmd>TroubleToggle lsp_implementations<cr>", "Implementations" },
		f = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
		o = { "<cmd>cexpr system('refurb --quiet ' . shellescape(expand('%'))) | copen<CR><CR>", "Refurb" }, -- optimization suggestions
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
		R = { "<cmd>TroubleRefresh<cr>", "Refresh" },
		t = { "<cmd>TroubleToggle<cr>", "Trouble" },
		T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Types" },
		v = { "<Plug>(toggle-lsp-diag-vtext)<cr>", "Toggle vtext diagnostics" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
	},
	e = { "<Cmd>Neotree toggle<CR>", "Neotree toggle" },
	f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', "Files" },
	g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', "Live grep" },
	G = { "<cmd>lua require('user.plugins.telescope').pickers.grep_string_cursor()<cr>", "Grep cursor word" },
	h = { '<cmd>lua require("telescope.builtin").highlights()<CR>', "Highlights" },
	H = { '<cmd>lua require("telescope.builtin").search_history()<CR>', "Search history" },
	j = { '<cmd>lua require("telescope.builtin").jumplist()<CR>', "Jumplist" },
	-- k = {"<cmd>bd!<cr>", "Kill (del) buffer"},
	l = { name = "VimTex" },
	m = { '<cmd>lua require("telescope.builtin").marks()<CR>', "Marks" },
	n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" }, -- require("telescope").load_extension("notify")
	N = { '<cmd>lua require"user.plugins.telescope".pickers.notebook()<CR>', "Notebook" },
	-- o = {'<cmd>lua require("telescope.builtin").vim_options()<CR>', "Vim options"},
	-- p = {'<cmd>lua require("telescope.builtin").projects()<CR>', "Projects"},
	q = { "<cmd>bd!<cr>", "Kill (del) buffer" },
	R = { '<cmd>lua require("telescope.builtin").pickers()<CR>', "Pickers" },
	-- S = {'<cmd>lua require("telescope.builtin").session-lens search_session()<CR>', "Search session"},
	s = { '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', "Search current Buffer" },
	t = {
		'<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
		"LSP workspace symbols",
	},
	T = { "<Cmd>AerialToggle<CR>", "Code Outline" }, -- already mapped at <leader>lS
	u = { '<cmd>lua require("telescope.builtin").resume()<CR>', "Resume last" },
	v = { '<cmd>lua require("telescope.builtin").registers()<CR>', "Registers" },
	w = { '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', "Spell suggestions" },
	x = { '<cmd>lua require("telescope.builtin").oldfiles()<CR>', "Files old" },
	-- z = {'<cmd>Zoxide<CR>', "Zoxide"},
	["/"] = {
		'<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
		"Search current buffer",
	},
},
  w = {
	name = "Window", -- optional group name
	g = { "<cmd>call Toggle_background()<CR>", "Toggle background color" }, -- create a binding with label
	b = { "<cmd>buffer#<CR>", "Buffer alternate" },
	o = { "<cmd>only<CR>", "Only this" },
	c = { "<cmd>close<CR>", "Close" },
	d = { "<cmd>bdelete!<CR>", "Buffer delete" },
	q = { "<cmd>quit<CR>", "Quit" },
	w = { "<cmd>save %<CR>", "Save" },
	x = { "<cmd>call utils#window_empty_buffer()<CR>", "Buffer empty" },
	z = { "<cmd>call utils#zoom()<CR>", "Zoom" },

	-- h = { '<cmd>split<CR>', "Split horizontal"},
	-- v = { '<cmd>vsplit<CR>', "Split vertical"},
	--Split current buffer, go to previous window and previous buffer
	h = { "<cmd>split<CR>:wincmd p<CR>:e#<CR>", "Split horizontal" },
	v = { "<cmd>vsplit<CR>:wincmd p<CR>:e#<CR>", "Split vertical" },
	t = { "<cmd>tabnew<CR>", "Tab new" },
	N = { "<cmd>enew<CR>", "Buf new"},
	-- n = { "<cmd>tabnext<CR>", "Tab next" },
	-- p = { "<cmd>tabprev<CR>", "Tab previous" },
  n = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" },
  p = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" },
	f = { "<cmd>lcd %:p:h<CR>" },
},
["<F4>"] = { '=strftime("%Y-%m-%d")<CR>P', "Time stamp" }, -- '=strftime("%H:%M")<CR>P'
}, -- end normal mode

-- insert mode
  i = {
    ["<c-d>"] = {
      n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
      x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
      f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
      X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
      F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
      d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
    },
  },
  -- visual mode
  v = {
    ["<leader>"] = {
      x = {
        name = "Debugger",
        e = { function() require("dapui").eval() end, "Evaluate Line" },
      },
    },
  },

  -- x-mode (visual)
  x = {
  	["<localleader"] = {
  		g = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
  		G = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
  	},
  },
}
