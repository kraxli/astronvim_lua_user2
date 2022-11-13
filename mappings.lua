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

  nmap [z [sz=
  nmap ]z ]sz=

  " nmap < <<_
  " nmap > >>_
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
keymap("n", "<", "<<_", opts)
keymap("n", ">", ">>_", opts)

-- -------------------------------------------------------
-- TODO:
-- -------------------------------------------------------

keymap("n", "<F6>", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})
keymap("n", "gx", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})

-- code_jump
-- vim.api.nvim_set_keymap('n', '<C-BS>', '<C-o>', {noremap=false})
vim.api.nvim_set_keymap("n", "<M-left>", "<C-o>", { noremap = false })
vim.api.nvim_set_keymap("n", "<M-right>", "<C-i>", { noremap = false })

-- comment
vim.api.nvim_set_keymap(
	"n",
	[[<C-§>]],
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").call("toggle_linewise_count_op")<CR>g@$']],
	{ noremap = true, silent = true, expr = true }
)
vim.keymap.set(
	"n",
	[[<C-§>]],
	[[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").call("toggle_linewise_count_op")<CR>g@$']],
	{ desc = "" }
)

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
    [">b"] = false,
    ["<b"] = false,
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- easy splits
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- resize with arrows
    ["<c-Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    ["<c-Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    ["<c-Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    ["<c-Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- Easy-Align
    ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
    -- Treesitter Surfer
    ["<m-down>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<m-right>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<m-up>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },
    ["<m-left>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },

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
  },
  i = {
    -- type template string
    ["<C-CR>"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
		["<F4>"] = { '<C-R>=strftime("%Y-%m-%d")<CR>', desc = "Time stamp" },
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  -- terminal mappings
  t = {
		["jk"] = false,
    -- ["<C-q>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    ["<esc>q"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
		["<c-n>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
		["<esc>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
		["<c-c>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
		-- ["<c-t>"] = {'<Cmd>exe v:count1 . "ToggleTerm"<CR>', desc="Terminal toggle"},
		["<leader>tp"] = { function() astronvim.toggle_term_cmd("ipython") end, desc = "ToggleTerm iPython",
		},
		-- ["<c-q>"] = { "<cmd>bd!<cr>", desc = "Kill (del) buffer" },
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
    ["J"] = { "<cmd>STSSelectNextSiblingNode<cr>", desc = "Surf next tree-sitter object" },
    ["K"] = { "<cmd>STSSelectPrevSiblingNode<cr>", desc = "Surf previous tree-sitter object" },
    ["H"] = { "<cmd>STSSelectParentNode<cr>", desc = "Surf parent tree-sitter object" },
    ["L"] = { "<cmd>STSSelectChildNode<cr>", desc = "Surf child tree-sitter object" },
    ["<m-j>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<m-l>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<m-k>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
    ["<m-h>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
  [""] = {
    ["<C-e><C-e>"] = { "<Plug>SendLine", desc = "Send line to REPL" },
    ["<C-e>"] = { "<Plug>Send", desc = "Send to REPL" },
		["<C-s>"] = { ":w!<cr>", desc = "Save" },
		-- ["<c-D>"] = {"<cmd>bd!<cr>", desc = "Kill (del) buffer"},
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

-- add more text objects for "in" and "around"
for _, char in ipairs({ "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" }) do
	for _, mode in ipairs({ "x", "o" }) do
		mappings[mode]["i" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char), desc = "between " .. char }
		mappings[mode]["a" .. char] =
			{ string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char), desc = "around " .. char }
	end
end

return mappings
