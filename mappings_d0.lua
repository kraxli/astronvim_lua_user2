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
-- keymap("x", "<", "<gv", opts)
-- keymap("x", ">", ">gv|", opts)
keymap("x", "<S-Tab>", "<gv", opts)
keymap("x", "<Tab>", ">gv|", opts)
-- keymap("n", ">", "<cmd>lua require('user.utils').reset_cursor_pos(function() vim.cmd[[normal >>]] end, vim.o.shiftwidth)", opts)
-- keymap("n", "<", "<cmd>lua require('user.utils').reset_cursor_pos(function() vim.cmd[[normal <<]] end, -vim.o.shiftwidth)", opts)
keymap("n", ">>", ">>_", opts) -- <gt>
keymap("n", "<<", "<<_", opts) -- <lt>  https://vimdoc.sourceforge.net/htmldoc/change.html#%3C
keymap("n", "> ", ">>_", opts) -- <gt>
keymap("n", "< ", "<<_", opts) -- <lt>  https://vimdoc.sourceforge.net/htmldoc/change.html#%3C

-- -------------------------------------------------------
-- TODO:
-- -------------------------------------------------------

vim.api.nvim_set_keymap("v", "<leader>zb", "sa*gvllsa*", { noremap = false, desc='Bold' })
vim.api.nvim_set_keymap("v", "zb", "sa*gv<right><right>sa*", { noremap = false, desc='Bold' })


keymap("n", "<F6>", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})
keymap("n", "gx", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})

-- ['q'] = { "<cmd>bd!<cr>", "Kill (del) buffer" }, -- not sure to keep
vim.api.nvim_set_keymap("n", "q", "<cmd>bd!<cr>", { noremap = false })

vim.api.nvim_set_keymap("n", "<M-right>", "", { noremap = false })

-- code_jump
vim.api.nvim_set_keymap("n", "<C-BS>", "<C-o>", { noremap = false }) -- backspace
-- vim.api.nvim_set_keymap("i", "<C-BS>", "<C-o>", { noremap = false }) -- backspace
vim.api.nvim_set_keymap("n", "<BS>", "<C-o>", { noremap = false }) -- backspace
vim.api.nvim_set_keymap("n", "<M-left>", "<C-o>", { noremap = false })
vim.api.nvim_set_keymap("n", "<M-right>", "<C-i>", { noremap = false })
vim.api.nvim_set_keymap("i", "<M-left>", "<C-o>", { noremap = false })
vim.api.nvim_set_keymap("i", "<M-right>", "<C-i>", { noremap = false })

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

-- writer
vim.api.nvim_set_keymap("n", "<c-s-v>", "<cmd>PasteImg<cr>", { noremap = false })

