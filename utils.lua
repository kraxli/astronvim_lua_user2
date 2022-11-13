M = {}

function M.quick_notification(msg) vim.notify(msg, "info", { title = "AstroNvim", timeout = 0 }) end

function M.vim_opt_toggle(opt, on, off, name)
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  M.quick_notification(name .. " " .. (is_off and "Enabled" or "Disabled"))
end

function M.async_run(cmd, on_finish)
  local lines = { "" }

  local function on_event(_, data, event)
    if (event == "stdout" or event == "stderr") and data then vim.list_extend(lines, data) end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = table.concat(cmd, " "),
        lines = lines,
        efm = "%f:%l:%c: %t%n %m",
      })
      if on_finish then on_finish() end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd.cclose()
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end

local function getOs()

  local osKey = ''

  if vim.fn.has "mac" == 1 then
    osKey = "mac"
  elseif vim.fn.has "unix" == 1 then
    osKey = "unix"
  elseif vim.fn.has('win64') or vim.fn.has('win32') then
    osKey='win'
  end

  return osKey
end

function visual_selection_range()
  local _, line_start, col_start, _ = unpack(vim.fn.getpos("'<"))
  local _, line_end, col_end, _ = unpack(vim.fn.getpos("'>"))
  -- if line_start < line_end or (line_start == line_end and col_start <= col_end) then
  --   return line_start - 1, col_start - 1, line_end - 1, col_end
  -- else
  --   return line_end - 1, col_end - 1, line_start - 1, col_start
  -- end

  local lines = vim.fn.getline(line_start, line_end)

  if vim.fn.len(lines) == 0 then
      return ''
  end

  -- local lines[#lines] = lines[#lines][: col_end)]
  -- local lines[0] = lines[0][col_start - 1:]

  -- return join(lines, "\n")

end

-- fun! Google()
--   let keyword = expand("<cword>")
--   let url = "http://www.google.com/search?q=" . keyword
--   let path = "/usr/bin/"
--   exec 'silent !"' . path . 'firefox" ' . url
-- endfun


-- @param mode: the active mode ('n', 'i', 'v', 'x')
function M.sys_app_open(mode)

  local mode = mode or vim.api.nvim_get_mode()["mode"]
  local commandsOpen = {unix="xdg-open", mac="open", powershell='Start-Process', win='explorer'}  -- win='start /b ""'
  local os = getOs()

  -- powershell: 
  --   set shell=powershell shellquote=( shellpipe=\| shellredir=> shellxquote=
  --   set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command

  if os == 'win' and vim.o.shell == 'powershell' then
    os = 'powershell'
  end

  sys_app = commandsOpen[os]  -- must be global to be used in vimscript below

  if mode == 'v' or mode == 'x' then
    path = visual_selection_range()  -- global such that it can be used in vim.cmd()
  else
    path = vim.fn.expand("<cfile>")
    -- path = path or vim.fn.expand("<cfile>")  -- in case of input variable path, <cfile>  or <cword>  
    path = vim.fn.fnamemodify(path, ':p')
  end

  local is_not_web_address = vim.fn.empty(string.match(path, '[a-z]*://[^ >,;()]*')) == 1
  local is_empty_path = vim.fn.empty(vim.fn.glob(path)) == 1

  if (is_empty_path and is_not_web_address) then
    path = vim.fn.expand('%:p:h')
  end

  if os == 'win' then
      vim.cmd([[ execute 'silent! !' . luaeval('sys_app') . ' ' .shellescape(luaeval('path'), 1) ]])
  else
      vim.fn.jobstart({ sys_app, path }, { detach = true })
  end

  -- os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))) -- ; vim.cmd "redraw!"
end

function M.openExplorer()

  local commandsOpen = {unix="xdg-open", mac="open", powershell='Start-Process', win='start /b ""'}

  os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))); vim.cmd "redraw!"
end

return M
