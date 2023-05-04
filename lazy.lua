if vim.fn.has('win32') | vim.fn.has('win64') then
  return { diff = { cmd = "terminal_git" }, checker = { enabled = false }, concurrency = 1, wait = true }
else
  return { diff = { cmd = "terminal_git" }, checker = { enabled = true } }
end
