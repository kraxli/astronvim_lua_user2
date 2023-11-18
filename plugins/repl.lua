return {
  {
    "jupyter-vim/jupyter-vim",
    ft = { "python", "julia" },
    config = function()
      require("astronvim.utils").set_mappings {
        n = {
          ["<leader>J"] = { "<cmd>JupyterConnect<cr>", desc = "Connect to Jupyter" },
          ["<leader>j"] = { "<Plug>JupyterRunTextObj", desc = "Send to Jupyter" },
        },
        v = {
          ["<leader>j"] = { "<Plug>JupyterRunVisual", desc = "Send to Jupyter" },
        },
      }
    end,
    enabled = vim.fn.has('win64') == 0,  -- vim.fn.has('unix') == 1 and 
  },
  {
    "mtikekar/nvim-send-to-term",
    init = function() vim.g.send_disable_mapping = true end,
    keys = { "<Plug>Send", "<Plug>SendLine" },
    cmd = "SendHere",
    enabled = false,
  },
}
