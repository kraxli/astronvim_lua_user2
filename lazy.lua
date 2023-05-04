if vim.fn.has('unix') == 1 then
  return { diff = { cmd = "terminal_git" }, checker = { enabled = true } }
else
  return { diff = { cmd = "terminal_git" }, checker = { enabled = false }, concurrency = 1, wait = true }
end
