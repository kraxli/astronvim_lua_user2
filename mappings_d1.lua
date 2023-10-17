-------------------------------------------------------
-- dictionary mappings for which-key
-------------------------------------------------------

local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = {
  n = {
    ["<leader>fh"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,
    ["<leader>sb"] = false,
    ["<leader>sc"] = false,
    ["<leader>sh"] = false,
    ["<leader>sk"] = false,
    ["<leader>sm"] = false,
    ["<leader>sn"] = false,
    ["<leader>sr"] = false,
    [">b"] = false,
    ["<b"] = false,
    ["<leader>tp"] = false,
    -- ["<leader>ft"] = false,
    [">B"] = false,
    ["<B"] = false,
    [">F"] = false,
    ["<F"] = false,
    [">P"] = false,
    ["<P"] = false,

    ["M-right"] = {"C-i", desc="Move to prevous position"},

    -- general
    ["<C-s>"] = { ":w!<CR>", desc = "Save" },
	  -- recording
	  ["Q"] = { "q", desc = "Record" },
	  ["gQ"] = { "@q", desc = "Record" },
	  -- time stamps
	  ["<F4>"] = { '=strftime("%Y-%m-%d")<CR>P', desc = "Time stamp" },
	  -- spell
	  -- ["[z"] = { "[sz=", desc = "Correct previous spell", noremap = false, silent = true },
	  -- ["]z"] = { "]sz=", desc = "Correct next spell", noremap = false, silent = true },
	  -- Miscellenuous
	  ["<C-z>"] = { ":undo<cr>", desc = "Undo" },
    -- Terminal:
	  -- -- ["<c-t>"] = {'<Cmd>exe v:count1 . "ToggleTerm"<CR>', desc="Terminal toggle"},
	  -- ["<leader>ts"] = {function () require("toggleterm").send_lines_to_terminal("single_line", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) end, desc="Send line"},
	  -- ["<C-e>"] = {function () require("toggleterm").send_lines_to_terminal("single_line", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) end, desc="Send line"},

		["<leader>"] = {
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
			--
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
      v = {
	      name = "View", -- optional group name
	      b = { "<cmd>buffer#<CR>", "Buffer alternate" },
	      c = { "<cmd>close<CR>", "Close" },
	      d = { "<cmd>bdelete!<CR>", "Buffer delete" },
	      g = { "<cmd>call Toggle_background()<CR><ESC>", "Toggle background color" }, -- create a binding with label
	      o = { "<cmd>only<CR>", "Only this" },
	      q = { "<cmd>quit<CR>", "Quit" },
	      w = { "<cmd>save %<CR>", "Save" },
	      x = { "<cmd>call utils#window_empty_buffer()<CR>", "Buffer empty" },
	      z = { "<cmd>call utils#zoom()<CR>", "Zoom" },

	      -- h = { '<cmd>split<CR>', "Split horizontal"},
	      -- v = { '<cmd>vsplit<CR>', "Split vertical"},
	      --Split current buffer, go to previous window and previous buffer
	      h = { "<cmd>split<CR>:wincmd p<CR>:e#<CR>", "Split horizontal" },
	      v = { "<cmd>vsplit<CR>:wincmd p<CR>:e#<CR>", "Split vertical" },
	      t = { "<cmd>enew<CR>", "Buf new"},
	      T = { "<cmd>tabnew<CR>", "Tab new" },
	      -- n = { "<cmd>tabnext<CR>", "Tab next" },
	      -- p = { "<cmd>tabprev<CR>", "Tab previous" },
        n = { "<cmd>BufferLineMoveNext<cr>", "Move buffer tab right" },
        p = { "<cmd>BufferLineMovePrev<cr>",  "Move buffer tab left" },
	      f = { "<cmd>lcd %:p:h<CR>" },
      },
      z = {
        name = "Zettel / Md",
        ['#'] = {'<cmd>lua require("telekasten").show_tags({i = false})<CR>', 'Show tags'},
        b = {'<cmd>lua require("user.utils").insert_list_bullet()<CR>', 'Set bullet'},
        B = {'<cmd>lua require("user.utils").show_backlinks()<CR>', 'Show back links'},
        c = {'<cmd>lua require("user.utils").show_calendar()<CR>', 'Show calendar'},
        C = {'<cmd> CalendarT<CR>', 'Calendar'},
        d = {'<cmd>lua require("telekasten").find_daily_notes()<CR>', "Find dailies"},
        f = {'<cmd>lua require("telekasten").find_notes()<CR>', "Find note"},
        F = {'<cmd>lua require("telekasten").find_friends()<CR>', "Find friends"},
        g = {'<cmd>lua require("telekasten").search_notes()<CR>', 'Search notes'},
        h = {'<cmd>call HeaderIncrease()<CR>', 'Header promote'},
        H = {'<cmd>call HeaderDecrease()<CR>', 'Header demote'},
        i = {'<cmd>lua require("telekasten").insert_link({ i=false })<CR>', 'Insert link'},
        I = {'<cmd>lua require("telekasten").insert_img_link({ i=true })<CR>', 'Insert image link'},
        J = {'<cmd>lua require("telekasten").paste_img_and_link()<CR>', 'Paste img & link'},
        l = {'<cmd>lua require("telekasten").follow_link()<CR>', 'Follow link'},
        n = {'<cmd>lua require("telekasten").new_note()<CR>', 'New note'},
        N = {'<cmd>lua require("telekasten").new_templated_note()<CR>', 'New template note'},
        m = {'<cmd>lua require("telekasten").browse_media()<CR>', 'Brows media'},
        p = {'<cmd>lua require("telekasten").preview_img()<CR>', 'Preview img'},
        r = {'<cmd>lua require("telekasten").rename_note()<CR>', 'Rename this note'},
        s = {
          name="search / find",
          d = {'<cmd>lua require("telekasten").find_dialy_notes()<CR>', "Find daily note"},
          f = {'<cmd>lua require("telekasten").find_notes()<CR>', "Find note"},
          F = {'<cmd>lua require("telekasten").find_friends()<CR>', "Find friends"},
          g = {'<cmd>lua require("telekasten").search_notes()<CR>', 'Search notes'},
          w = {'<cmd>lua require("telekasten").find_weekly_notes()<CR>', "Find note"},
        },
        t = {"<cmd>lua require('user.utils').handle_checkbox()<CR>", 'Toggle todo'},
        T = {'<cmd>lua require("telekasten").goto_today()<CR>', 'Goto today'},
        W = {'<cmd>lua require("telekasten").goto_thisweek()<CR>', 'Goto this week'},
        y = {'<cmd>lua require("telekasten").yank_notelink()<CR>', 'Yank note link'},
        z = {'<cmd>lua require("telekasten").panel()<CR>', 'Panel'},
        x = {"<cmd>PasteImg<cr>", "Paste Image"},
      },
      -- o = {
      --   name = "Text Object",
      --   s = {
      --     name = "Swap",
      --       n = {
      --         name = "next",
      --     },
      --   },
      -- },
    },  -- end leader

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
	    S = {
		    '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
		    "LSP workspace symbols",
	    },
	    t = {'<cmd>Telescope termfinder find<CR>', 'Terminals'},
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
    ["<C-PageDown>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<C-PageUp>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
  },
  -- insert mode:
  i = {
   	-- saving
   	["<C-s>"] = { "<ESC>:w!<CR>a", desc = "Save" },
    -- date/time input
   	["<F4>"] = { '<C-R>=strftime("%Y-%m-%d")<CR>', desc = "Time stamp" },
  },
  -- visual mode:
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- ["<leader>ts"] = {
    --   function ()
    --     vim.cmd [[normal :esc<CR> gv]]
    --     require("toggleterm").send_lines_to_terminal("visual_lines", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
    --   end,
    --   desc="Send lines"},
    -- ["<leader>tS"] = {
    --   function ()
    --     vim.cmd [[normal :esc<CR> gv]]
    --     require("toggleterm").send_lines_to_terminal("visual_selection", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
    --   end,
    --   desc="Send selection"},
    -- ["<C-e>"] = {
    --   function ()
    --     vim.cmd [[normal :esc<CR> gv]]
    --     require("toggleterm").send_lines_to_terminal("visual_selection", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
    --   end,
    --   desc="Send selection"},

    ["<C-s>"] = { "<ESC>:w!<CR>gv", desc = "Save" },

    ["<leader>"] = {
      t = {
        name = "Terminal",
      },
  	  z = {
        name = "Zettel / Md",
  	    -- b = {'<cmd>lua vim.api.nvim_set_keymap("v", "<leader>zb", "sa*gv<right>sa*", { noremap = false })', desc='Bold' },
  	    -- b = { "sa*gv<Right>sa*" , desc='Bold' },
  	  },
  	},
  	z = {
      name = "Zettel / Md",
      t = {"<cmd>lua require('user.utils').handle_checkbox()<CR>", 'Toggle todo'},
  	},
  },
  -- terminal mappings
  t = {
		["jk"] = false,
		["<C-c>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },  -- actually C-C is required
		["<C-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		["<ESC>c"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		["<ESC>n"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		["jj"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<ESC>q"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
		["<C-q>"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
		["<C-k>"] = { "<C-\\><C-n>:bd!<CR>", desc = "Terminal kill/delete" },
		["<ESC>k"] = { "<C-\\><C-n>:bd!<CR>", desc = "Terminal kill/delete" },
		["<ESC>d"] = { "<C-\\><C-n>:bd!<CR>", desc = "Terminal kill/delete" },
		-- ["<C-d>"] = { "<C-\\><C-n>:bd!<CR>", desc = "Terminal kill/delete" },  -- conflict with close ipython
  },
  x = {
    -- Tressitter Surfer:
    -- see my astronvim_lua_user branch v2
  	["<localleader"] = {
  		g = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
  		G = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
  	},
  },
}

-- Telescope:
maps.n["<leader>ft"] = { require('telescope._extensions.termfinder').find, "Terminals" }
maps.n["<leader>fT"] = { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Find themes" }


if is_available "toggleterm.nvim" then
  -- local python = vim.fn.executable "ipython3" == 1 and "ipython3" or vim.fn.executable "python3" == 1 and "python3"
  local python =  "bpython -i" -- "python3"
  -- ipython -i --no-autoindent --no-autoedit-syntax --nosep
  -- -i or --pylab or --matplotlib

  if python then maps.n["<leader>tp"] = { function() utils.toggle_term_cmd(python) end, desc = "ToggleTerm python" } end
  -- ["<leader>tp"] = { function() astronvim.toggle_term_cmd({cmd=require("user.settings").terminal['python']['cmd'], count=require("user.settings").terminal['python']['term_id']}) end, desc = "ToggleTerm ipython" },
end

return maps
