local create_command = vim.api.nvim_create_user_command

create_command("Mappings", "enew|pu=execute('map')", { desc = "List all mappings" })
create_command("CdHere", "lcd %:p:h", { desc = "Change the cwd to this file" })
create_command("Cd2This", "lcd %:p:h", { desc = "Change the cwd to this file" })
create_command("CacheReset", "require('user.utils').cache_reset", { desc = "Reset nvim cache" })
vim.cmd([[ command! -range Words2String :'<,'>s/\%V\(\h\+\)/'\1'/g ]])
create_command("Pv", ":MarkdownPreview", { desc = "Preview markdown" })

-- TODO:
-- copy path of file of current file
-- copy folder path of current file

vim.cmd([[
  command! KeyMaps :call utils#KeyMaps()
  " save and quit
  " command! W :w!
  command! Q :q
  cnoreabbrev <silent> W w 
  cnoreabbrev <silent> ww w!
  cnoreabbrev <silent> wwa wa!
  cnoreabbrev <silent> xx x!
  cnoreabbrev <silent> xxa xa!
  cnoreabbrev <silent> qq q!
  cnoreabbrev <silent> qqa qa!
  cnoreabbrev <silent> ee e!
]])
