local M = {}

function M.quick_notification(msg, type) astronvim.notify(msg, type or "info", { timeout = 0 }) end

function M.vim_opt_toggle(opt, on, off, name)
  if on == nil then on = true end
  if off == nil then off = false end
  if not name then name = opt end
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

function M.get_visual_selection()

  -- local mode = vim.api.nvim_get_mode()["mode"]  -- or vim.fn.mode()
  -- if mode ~= 'v' or mode ~= 'x' then
  --   return ''
  -- end

  vim.cmd('noau normal! "vy"')
  selection = string.gsub(vim.fn.getreg('v'), '^%s*(.-)%s*$', '%1')  -- remove leading and trailing spaces

  return selection
end


-- see e.g. https://github.com/theHamsta/nvim-treesitter/blob/a5f2970d7af947c066fb65aef2220335008242b7/lua/nvim-treesitter/incremental_selection.lua#L22-L30
function M.get_visual_range()

  local _, line_start, col_start, _ = unpack(vim.fn.getpos("'<"))
  local _, line_end, col_end, _ = unpack(vim.fn.getpos("'>"))
  -- local line_start = vim.fn.getpos("'<")[2]
  -- local col_start = vim.fn.getpos("'<")[3]
  -- local line_end = vim.fn.getpos("'>")[2]
  -- local col_end = vim.fn.getpos("'>")[3]
  local selection = vim.fn.getline(line_start, line_end)

  -- print('lines: ' .. line_start .. ' to ' .. line_end)
  -- print(vim.inspect(selection))

  if #selection == 0 then  -- or vim.fn.len(selection) == 0
    return ''
  end

  local first_line = selection[1]
  local last_line = selection[#selection]
  first_line = string.sub(first_line, col_start, first_line:len())
  first_line = string.gsub(first_line, '^%s*(.-)%s*$', '%1')  -- remove leading and trailing spaces
  last_line =  string.sub(last_line, 1, col_end)
  last_line = string.gsub(last_line, '^%s*(.-)%s*$', '%1')  -- remove leading and trailing spaces
  selection[1] = first_line
  selection[#selection] = last_line

  return table.concat(selection, '\n')
end

function M.execute(str)

  print(str)
  local commandsOpen = {unix="xdg-open", mac="open", powershell='Start-Process', win='explorer'}  -- win='start /b ""'
  local os = getOs()
  sys_app = commandsOpen[os]  -- must be global to be used in vimscript below

  if os == 'win' then
      vim.cmd([[ execute 'silent! !' . luaeval('sys_app') . ' ' .shellescape(luaeval('str'), 1) ]])
  else
      vim.fn.jobstart({ sys_app, str }, { detach = true })
  end
end

function M.google()
  local keyword = vim.fn.expand("<cword>")
  local url = "http://www.google.com/search?q=" .. keyword
  M.execute(url)
end

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
    path = M.get_visual_selection()  -- global such that it can be used in vim.cmd()
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

function M.better_search(key)
  return function()
    local searched, error =
      pcall(vim.cmd.normal, { args = { (vim.v.count > 0 and vim.v.count or "") .. key }, bang = true })
    if searched then
      pcall(vim.cmd.normal, "zzzv")
    else
      M.quick_notification(error, "error")
    end
    vim.opt.hlsearch = searched ~= nil
  end
end


function M.cleanCache()

  os.execute("rm -rf $XDG_DATA_HOME/nvim/*")
  os.execute("rm -rf $XDG_CACHE_HOME/nvim/*")
  os.execute("rm -rf $XDG_DATA_HOME/nvim-data/*")
  os.execute("rm -rf $XDG_CACHE_HOME/nvim-data/*")

  os.execute("rm -rf $XDG_CONFIG_HOME/nvim-data/*")

end

-- --- Install all Mason packages from mason-lspconfig, mason-null-ls, mason-nvim-dap
-- function M.mason.install_all()
--   local registry_avail, registry = pcall(require, "mason-registry")
--   if not registry_avail then
--     vim.api.nvim_err_writeln "Unable to access mason registry"
--     return
--   end
--
--   local installed = false
--   for plugin_name, opts in pairs {
--     ["mason-lspconfig"] = { type = "server", map = "lspconfig" },
--     ["mason-null-ls"] = { type = "source", map = "null_ls" },
--     ["mason-nvim-dap"] = { type = "source", map = "nvim_dap" },
--   } do
--     local plugin_avail, plugin = pcall(require, plugin_name .. ".settings")
--     if plugin_avail then
--       local mappings = require(plugin_name .. ".mappings." .. opts.type)[opts.map .. "_to_package"]
--       local pkgs = plugin.current.ensure_installed
--       for _, pkg in ipairs(pkgs) do
--         local mason_pkg = mappings[pkg]
--         if not registry.is_installed(mason_pkg) then
--           installed = true
--           astronvim.mason.update(mason_pkg)
--         end
--       end
--     end
--   end
--   if not installed then astronvim.notify "Mason: No packages to install" end
-- end

return M
