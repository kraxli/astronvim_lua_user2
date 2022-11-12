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

function M.openSysApp()

  local commandsOpen = {unix="xdg-open", mac="open", win='Invoke-Expression'}
  local os = getOs()
  sys_app = commandsOpen[os]  -- must be global to be used in vimscript below

  -- os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))) -- ; vim.cmd "redraw!"
  vim.cmd([[
    let path = fnamemodify(expand('<cfile>'), ':p')  " <cfile>  or <cword>  
    " let path = expand('<cword>')  " <cfile>  or <cword>  

    if empty(glob(path))  " | !isdirectory(path)
      let path =  expand('%:p:h')
    end
    
    " execute 'silent! !xdg-open ' . shellescape(path, 1)
    execute 'silent! !' . luaeval('sys_app') . ' ' . shellescape(path, 1)
  ]])
end

function M.openExplorer()

  local commandsOpen = {unix="xdg-open", mac="open", win='Invoke-Expression'}

  os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))); vim.cmd "redraw!"
end

return M
