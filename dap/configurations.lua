
-- see: https://github.com/fdschmidt93/dotfiles/commit/d3c5d965dbbb14f489c75ec7d9331f1a0ff12d01#
-- vim.api.nvim_create_autocmd("FileType", { pattern = "dap-repl", callback = require("dap.ext.autocompl").attach })

local attach_node = {
  type = "pwa-node",
  request = "attach",
  name = "Attach",
  processId = function(...) return require("dap.utils").pick_process(...) end,
  cwd = "${workspaceFolder}",
}

return {
  javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    attach_node,
  },
  typescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "ts-node",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    attach_node,
  },
  python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file (my py-config)";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        -- console = "externalTerminal";
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python3'
            end
        end;
    },
  }
}
