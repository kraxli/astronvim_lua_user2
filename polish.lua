return function()
  vim.filetype.add {
    extension = {
      qmd = "markdown",
    },
    pattern = {
      ["/tmp/neomutt.*"] = "markdown",
    },
  }
  require "user.autocmds"
  require("user.commands")
  require("user.vim_functions")

end
