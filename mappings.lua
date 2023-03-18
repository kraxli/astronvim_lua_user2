-- -------------------------------------------------------
-- command-line
-- -------------------------------------------------------

vim.cmd([[
  cnoremap <c-v> <MiddleMouse>
  cnoremap <S-Insert> <MiddleMouse>
  cnoremap <C-s> <cmd>write<CR>

  " Navigation in command line
  cnoremap <C-h> <Home>
  cnoremap <C-l> <End>
  cnoremap <C-f> <Right>
  cnoremap <C-b> <Left>
  cnoremap <expr> <Up>  pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"

  " Spelling
  nmap [z [sz=
  nmap ]z ]sz=

  " Markdown
  nmap = :<C-U>call HeaderIncrease()<CR>  " Note: The <C-U> is required to remove the line range that you
  " nmap <C-0> :<C-U>call HeaderDecrease()<CR>

]])

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Recording (see below):
-- keymap("n", "Q", "q", opts)
-- keymap("n", "gQ", "@q", opts)

-- -------------------------------------------------------
-- Tab shift
-- -------------------------------------------------------

keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv|", opts)
keymap("x", "<S-Tab>", "<gv", opts)
keymap("x", "<Tab>", ">gv|", opts)
-- keymap("n", ">", "<cmd>lua require('user.utils').reset_cursor_pos(function() vim.cmd[[normal >>]] end, vim.o.shiftwidth)", opts)
-- keymap("n", "<", "<cmd>lua require('user.utils').reset_cursor_pos(function() vim.cmd[[normal <<]] end, -vim.o.shiftwidth)", opts)
keymap("n", ">", ">>_", opts)  -- <gt>
keymap("n", "<", "<<_", opts)  -- <lt>  https://vimdoc.sourceforge.net/htmldoc/change.html#%3C

-- -------------------------------------------------------
-- TODO:
-- -------------------------------------------------------

keymap("n", "<F6>", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})
keymap("n", "gx", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})

-- code_jump
vim.api.nvim_set_keymap("n", "<M-left>", "<C-o>", { noremap = false })
vim.api.nvim_set_keymap("n", "<C-BS>", "<C-o>", { noremap = false })  -- backspace
vim.api.nvim_set_keymap("n", "<BS>", "<C-o>", { noremap = false })  -- backspace
vim.api.nvim_set_keymap("n", "<M-right>", "<C-i>", { noremap = false })

-- comment
-- n  <Space>/    * <Lua 149: ~/.config/nvim/lua/core/mappings.lua:106>
--                  Comment line
-- v  <Space>/    * <Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>
--                  Toggle comment line

-- floating window
vim.api.nvim_set_keymap("", "<F2>", '<Cmd>lua require("user.utils").toggle_term()<CR>', { noremap = false })
vim.api.nvim_set_keymap("", "<c-t>", '<Cmd>lua require("user.utils").toggle_term()<CR>', { noremap = false })
vim.cmd([[
    vnoremap <silent><leader>x :'<,'>lua require('user.utils').excecute_code('visual_lines')<CR>
    nnoremap <silent><leader>x <cmd>lua require('user.utils').excecute_code('single_line')<CR>
    vnoremap <silent><c-x> :'<'> lua require('user.utils').excecute_code('visual_selection')<CR>
    inoremap <silent><c-x> <cmd>lua require('user.utils').excecute_code('single_line')<CR>
    nnoremap <silent><c-x> <cmd>lua require('user.utils').excecute_code('single_line')<CR>
    " TODO: run file command for ipython
    " 2TermExec cmd="git status" dir=~/<my-repo-path>
  ]])

-- open system app for file under cursor or file explorer
vim.api.nvim_set_keymap("", "<F3>", [[<cmd>lua require('user.utils').sys_app_open()<CR>]], opts)

local utils = require "user.utils"
local astro_utils = require "astronvim.utils"

local mappings = {

  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
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

    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- ["q:"] = ":",

    -- better buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- better search
    n = { utils.better_search "n", desc = "Next search" },
    N = { utils.better_search "N", desc = "Previous search" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- kitty navigation
    ["<C-j>"] = { "<cmd>KittyNavigateDown<cr>" },
    ["<C-h>"] = { "<cmd>KittyNavigateLeft<cr>" },
    ["<C-l>"] = { "<cmd>KittyNavigateRight<cr>" },
    ["<C-k>"] = { "<cmd>KittyNavigateUp<cr>" },
    -- resize with arrows
    ["<c-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<c-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<c-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<c-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },

    -- ["<C-Down>"] = {"<c-w>j", desc="Move to window down"},  -- use <c-j> and siblings
    -- ["<C-Left>"] = {"<c-w>h", desc="Move to window left"},
    -- ["<C-Right>"] = {"<c-w>l", desc="Move to window right"},
    -- ["<C-Up>"] = {"<c-w>k", desc="Move to window up"},

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

    -- Treesitter Surfer
    ["<C-down>"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "Swap next tree-sitter object",

    -- buffer switching (new mehalter)
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",

    },
    -- vim-sandwich
    ["s"] = "<Nop>",
    ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
    ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><cr>"] = { '<esc>/<++><cr>"_c4l', desc = "Next Template" },
    ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
    -- neogen
    ["<leader>a"] = { desc = "󰏫 Annotate" },
    ["<leader>a<cr>"] = { function() require("neogen").generate() end, desc = "Current" },
    ["<leader>ac"] = { function() require("neogen").generate { type = "class" } end, desc = "Class" },
    ["<leader>af"] = { function() require("neogen").generate { type = "func" } end, desc = "Function" },
    ["<leader>at"] = { function() require("neogen").generate { type = "type" } end, desc = "Type" },
    ["<leader>aF"] = { function() require("neogen").generate { type = "file" } end, desc = "File" },
    -- telescope plugin mappings
    ["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
    ["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
    -- compiler
    ["<leader>m"] = { desc = "󱁤 Compiler" },
    ["<leader>mk"] = {
      function()
        vim.cmd "silent! write"
        local filename = vim.fn.expand "%:t"
        utils.async_run({ "compiler", vim.fn.expand "%:p" }, function() astro_utils.notify("Compiled " .. filename) end)
      end,
      desc = "Compile",
    },
    ["<leader>ma"] = {
      function()
        vim.notify "Autocompile Started"
        utils.async_run({ "autocomp", vim.fn.expand "%:p" }, function() astro_utils.notify "Autocompile stopped" end)
      end,
      desc = "Auto Compile",
    },
    ["<leader>mv"] = {
      function() vim.fn.jobstart { "opout", vim.fn.expand "%:p" } end,
      desc = "View Output",
    },

    ["<leader>tp"] = { function() astronvim.toggle_term_cmd({cmd=require("user.settings").terminal['python']['cmd'], count=require("user.settings").terminal['python']['term_id']}) end, desc = "ToggleTerm ipython" },
		-- ["<c-t>"] = {'<Cmd>exe v:count1 . "ToggleTerm"<CR>', desc="Terminal toggle"},
		["<leader>ts"] = {function () require("toggleterm").send_lines_to_terminal("single_line", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) end, desc="Send line"},
		["<C-e>"] = {function () require("toggleterm").send_lines_to_terminal("single_line", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) end, desc="Send line"},
    ["<C-s>"] = { ":w!<CR>", desc = "Save" },
  },  -- end normal mode
  ["<leader>mb"] = {
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
        }, function() astro_utils.notify("Compiled " .. filename) end)
      end,
      desc = "Compile Beamer",
    },
    ["<leader>mp"] = {
      function()
        local pdf_path = vim.fn.expand "%:r" .. ".pdf"
        if vim.fn.filereadable(pdf_path) == 1 then vim.fn.jobstart { "pdfpc", pdf_path } end
      end,
      desc = "Present Output",
    },
    ["<leader>ml"] = { function() utils.toggle_qf() end, desc = "Logs" },
    ["<leader>mt"] = { "<cmd>TexlabBuild<cr>", desc = "LaTeX" },
    ["<leader>mf"] = { "<cmd>TexlabForward<cr>", desc = "Forward Search" },
    ["<leader>r"] = { desc = " REPL" },
    ["<leader>rr"] = { "<Plug>Send", desc = "Send to REPL" },
    ["<leader>rl"] = { "<Plug>SendLine", desc = "Send line to REPL" },
    ["<leader>r<cr>"] = { "<cmd>SendHere<cr>", desc = "Set REPL" },
    ["<leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    ["<leader>s"] = { desc = "󰛔 Search/Replace" },
    ["<leader>ss"] = { function() require("spectre").open() end, desc = "Spectre" },
    ["<leader>sf"] = { function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    ["<leader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },
    ["<leader>x"] = { desc = "裂Trouble" },
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    ["<leader>;"] = { desc = "󰧑 AI Assistant" },
    ["<leader>;;"] = {
      function()
        vim.cmd.Codeium(vim.g.codeium_enabled == 0 and "Enable" or "Disable")
        astro_utils.notify("Codeium " .. (vim.g.codeium_enabled == 0 and "Disabled" or "Enabled"))
      end,
      desc = "Toggle Global",
    },
    ["<leader>;b"] = {
      function()
        vim.cmd.Codeium(vim.b.codeium_enabled == 0 and "EnableBuffer" or "DisableBuffer")
        astro_utils.notify("Codeium (buffer) " .. (vim.b.codeium_enabled == 0 and "Disabled" or "Enabled"))
      end,
      desc = "Toggle Buffer",
    },
  },
  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
		["<F4>"] = { '<C-R>=strftime("%Y-%m-%d")<CR>', desc = "Time stamp" },
		["<C-s>"] = { "<ESC>:w!<CR>a", desc = "Save" },
  },
  v = {
    ["<leader>r"] = { "<Plug>Send", desc = "Send to REPL" },
    ["<leader>s"] = { function() require("spectre").open_visual() end, desc = "Spectre" },
    ["<leader>ts"] = {
      function () 
        vim.cmd [[normal :esc<CR> gv]]
        require("toggleterm").send_lines_to_terminal("visual_lines", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
      end, 
      desc="Send lines"},
    ["<leader>tS"] = {
      function () 
        vim.cmd [[normal :esc<CR> gv]]
        require("toggleterm").send_lines_to_terminal("visual_selection", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
      end, 
      desc="Send selection"},
    ["<C-e>"] = {
      function () 
        vim.cmd [[normal :esc<CR> gv]]
        require("toggleterm").send_lines_to_terminal("visual_selection", true, {args=tostring(require("user.settings").terminal[vim.bo.filetype]['term_id'])}) 
      end, 
      desc="Send selection"},
    ["<C-s>"] = { "<ESC>:w!<CR>gv", desc = "Save" },

    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- date/time input
    ["<c-t>"] = { desc = "󰃰 Date/Time" },
    ["<c-t>n"] = { "<c-r>=strftime('%Y-%m-%d')<cr>", desc = "Y-m-d" },
    ["<c-t>x"] = { "<c-r>=strftime('%m/%d/%y')<cr>", desc = "m/d/y" },
    ["<c-t>f"] = { "<c-r>=strftime('%B %d, %Y')<cr>", desc = "B d, Y" },
    ["<c-t>X"] = { "<c-r>=strftime('%H:%M')<cr>", desc = "H:M" },
    ["<c-t>F"] = { "<c-r>=strftime('%H:%M:%S')<cr>", desc = "H:M:S" },
    ["<c-t>d"] = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", desc = "Y/m/d H:M:S -" },
  },
  -- terminal mappings
  t = {
		["jk"] = false,
    -- ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<ESC><ESC>"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
    ["<ESC>q"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
		["<C-c>"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
		["<C-q>"] = { "<C-\\><C-n>:q<CR>", desc = "Terminal quit" },
		["<C-C>"] = { "<C-\\><C-n>:q!<CR>", desc = "Terminal quit" },
		["<C-Q>"] = { "<C-\\><C-n>:q!<CR>", desc = "Terminal quit" },
		["<C-n>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		-- ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		-- ["<ESC>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
		-- ["<c-q>"] = { "<cmd>bd!<cr>", desc = "Kill (del) buffer" },
    ["<C-BS>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<C-a>", desc = "Increment number" },
    ["-"] = { "g<C-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Tressitter Surfer
    ["J"] = {
      function() require("syntax-tree-surfer").surf("next", "visual") end,
      desc = "Surf next tree-sitter object",
    },
    ["K"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual") end,
      desc = "Surf previous tree-sitter object",
    },
    ["H"] = {
      function() require("syntax-tree-surfer").surf("parent", "visual") end,
      desc = "Surf parent tree-sitter object",
    },
    ["L"] = {
      function() require("syntax-tree-surfer").surf("child", "visual") end,
      desc = "Surf child tree-sitter object",
    },
    ["<m-j>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<m-l>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
      desc = "Surf next tree-sitter object",
    },
    ["<m-k>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },
    ["<m-h>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
      desc = "Surf previous tree-sitter object",
    },

    -- vim-sandwich
    ["s"] = "<Nop>",
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
}

if astronvim.is_available "bufferline.nvim" then
  mappings.n["<c-PageDown>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
  mappings.n["<c-PageUp>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
  mappings.n["<m-PageDown>"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
  mappings.n["<m-PageUp>"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }
else
  mappings.n["<c-PageDown>"] = { "<cmd>bnext<cr>", desc = "Next buffer" }
  mappings.n["<c-PageUp>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" }
end

-- Bufdelete
if astronvim.is_available "bufdelete.nvim" then
  mappings.n["q"] = { function() require("bufdelete").bufdelete(0, false) end, desc = "Close buffer" }
  mappings.n["<c-q>"] = { function() require("bufdelete").bufdelete(0, true) end, desc = "Force close buffer" }
else
  mappings.n["q"] = { "<cmd>bdelete<cr>", desc = "Close buffer" }
  mappings.n["<c-q>"] = { "<cmd>bdelete!<cr>", desc = "Force close buffer" }
end

-- Comment
if astronvim.is_available "Comment.nvim" then
  mappings.n["<C-§>"] = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" }
  mappings.v["<C-§>"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }
end

-- add more text objects for "in" and "around"
for _, char in ipairs({ "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }) do
	for _, mode in ipairs({ "x", "o" }) do
		mappings[mode]["i" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
		mappings[mode]["a" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
	end
end

-- DAP:
-- see: https://github.com/fdschmidt93/dotfiles/commit/d3c5d965dbbb14f489c75ec7d9331f1a0ff12d01#
vim.keymap.set("v", "<M-D>", function()
  local selection = table.concat(require("user.utils_dap").visual_selection(), "\n")
  require("user.utils_dap").execute_in_dap_session(selection)
end)

vim.keymap.set("v", "<M-d>", function()
  local selection = require('user.utils').get_visual_lines()
  require("user.utils_dap").execute_in_dap_session(selection)
end)


vim.keymap.set({"n", 'i'}, "<M-d>", function()
  local line_nr = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, line_nr - 1, line_nr, false)[1]
  line = require("user.utils").rm_trailing_spaces(line)
  require("user.utils_dap").execute_in_dap_session(line)
end)

-- neovide:

if vim.g.neovide then
  vim.api.nvim_set_keymap('i', "<c-v>", '<ESC>"+pi', opts)
  -- mappings.i["<C-v>"] = { '<ESC>"+pi', desc = "Paset insert" }
end

return mappings
