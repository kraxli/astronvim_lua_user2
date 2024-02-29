---------------------------------------------------------
-- toggle term utils
---------------------------------------------------------

M = {}

function M.create_toggle_term(args, count)

  -- local fn = vim.fn
  local term = require('toggleterm.terminal').get(count)
  local direction = 'vertical'
  local size = string.format(80)
  if args.direction then direction = args.direction  end
  -- if dir and fn.isdirectory(fn.expand(dir)) == 0 then dir = nil end
  if args.size then size = string.format(args.size) end

  if term then
    require('toggleterm').toggle_command("size=" .. size .. " direction=" .. direction, count)
  else
    local cmd = ''
    if args.cmd then cmd = args.cmd end
    local vim_eval_str = string.format(count) .. 'TermExec cmd="' .. cmd .. '" size=' .. size .. ' direction="' .. direction .. '"'
    vim.cmd(vim_eval_str)
    -- maps.n["<leader>tP"] = { '<cmd>99TermExec cmd="ipython3" size=80 direction=vertical<cr>', desc = "Ipython term vertical split" }
    -- maps.n["<leader>tP"] = { function() require('toggleterm.terminal').Terminal:new({cmd=python,  direction="vertical", count=99}):toggle() end, desc = "Ipython term vertical split" }
    -- return require('toggleterm.terminal').Terminal:new({ id = count, dir = dir, direction = direction }), true
  end
end

-- see: https://github.com/akinsho/toggleterm.nvim/issues/243
function M.visual_send_by_paste_to_ipython()
  local term_count = 99  -- python terminal count TODO: set in config
  if vim.bo.filetype == "python" then
    vim.api.nvim_feedkeys('"+y', "v", true)
    require("toggleterm").exec("%paste", term_count)
  else
   -- fallback doesn't work :/
    require("toggleterm").send_lines_to_terminal("visual_selection", true, {count=term_count})
  end
end


-- Function to remove leading and ending whitespace strings
local function remove_empty_lines(lines)
  -- Create a new table containing only the non-whitespace strings
  local trimmed_lines = {}

	for _, line in ipairs(lines) do
	  if line ~= '' or line:match('^%s*$') == nil then
	    trimmed_lines[#trimmed_lines+1] = line
	  end
	end

  return trimmed_lines
end


-- https://github.com/akinsho/toggleterm.nvim/issues/425
function M.send_visual_lines_to_ipython_v2()
  local term_count = 99  -- python terminal count TODO: set in config
	-- visual markers only update after leaving visual mode
	local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "x", false)

	-- get selected text
	local start_line = vim.api.nvim_buf_get_mark(0, "<")[1]
	local end_line = vim.api.nvim_buf_get_mark(0, ">")[1]
	local lines = vim.fn.getline(start_line, end_line)
  lines = remove_empty_lines(lines)

	-- send selection with trimmed indent
	local toggleterm = require("toggleterm")
	local indent = nil
	for _, line in ipairs(lines) do
		if indent == nil and line:find("[^%s]") ~= nil then
			indent = line:find("[^%s]")
		end
		toggleterm.exec(line:sub(indent or 1), term_count)
	end

	toggleterm.exec(string.char(13))
end


-- https://github.com/akinsho/toggleterm.nvim/issues/425
local function is_whitespace(str)
  return str:match("^%s*$") ~= nil
end


function M.send_visual_lines_to_ipython()
  local term_count = 99

  local current_window = vim.api.nvim_get_current_win() -- save current window

  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")
  local line_start = vstart[2]
  local line_end = vend[2]
  local lines = vim.fn.getline(line_start, line_end)

  local cmd = ''  -- string.char(15)
  cmd = cmd .. '%autoindent'  .. string.char(10) -- '\r\n' -- string.char(13) .. string.char(4) -- .. string.char(4)  -- 10 13 4

  lines = remove_empty_lines(lines)

  -- for _, line in ipairs(lines) do
  --   require("toggleterm").exec(line, term_count)
  -- end

  if #lines == 1 then
    cmd = lines[1]
  else
    for _, line in ipairs(lines) do
      cmd = cmd .. line .. string.char(10)  -- '\r'  10,13  (?14)
    end
    cmd = cmd .. '%autoindent'
    -- cmd = cmd .. string.char(4)
  end

  require("toggleterm").exec(cmd, term_count)

  vim.api.nvim_set_current_win(current_window)
end

-- vim.o.shiftwith / tabwith??
-- line.sub()
-- line:match line:find
return M