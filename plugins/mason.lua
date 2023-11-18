return {
  { "williamboman/mason.nvim", opts = { PATH = "append" } },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ansiblels",
        "clangd",
        "cssls",
        -- "gopls",
        "html",
        "intelephense",
        "marksman",
        -- "neocmake",
        "jsonls",
        "julials",
        "pyright",
        "lua_ls",
        "taplo",
        "texlab",
        "tsserver",
        "yamlls",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
        "black",
        "isort",
        -- "prettierd",
        "shfmt",
        "shellcheck",
      },
      handlers = {
        taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "bash",
        "cppdbg",
        "delve",
        "js",
        "php",
        "python",
      },
      handlers = {
        js = function()
          local dap = require "dap"
          dap.adapters["pwa-node"] = {
            type = "server",
            port = "${port}",
            executable = { command = vim.fn.exepath "js-debug-adapter", args = { "${port}" } },
          }

          local pwa_node_attach = {
            type = "pwa-node",
            request = "launch",
            name = "js-debug: Attach to Process (pwa-node)",
            proccessId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          }
          local function deno(cmd)
            cmd = cmd or "run"
            return {
              request = "launch",
              name = ("js-debug: Launch Current File (deno %s)"):format(cmd),
              type = "pwa-node",
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = vim.fn.exepath "deno",
              runtimeArgs = { cmd, "--inspect-brk" },
              attachSimplePort = 9229,
            }
          end
          local function typescript(args)
            return {
              type = "pwa-node",
              request = "launch",
              name = ("js-debug: Launch Current File (ts-node%s)"):format(
                args and (" " .. table.concat(args, " ")) or ""
              ),
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = "ts-node",
              runtimeArgs = args,
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
              resolveSourceMapLocations = {
                "${workspaceFolder}/dist/**/*.js",
                "${workspaceFolder}/**",
                "!**/node_modules/**",
              },
            }
          end
          for _, language in ipairs { "javascript", "javascriptreact" } do
            dap.configurations[language] = {
              {
                type = "pwa-node",
                request = "launch",
                name = "js-debug: Launch File (pwa-node)",
                program = "${file}",
                cwd = "${workspaceFolder}",
              },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
          for _, language in ipairs { "typescript", "typescriptreact" } do
            dap.configurations[language] = {
              typescript(),
              typescript { "--esm" },
              deno "run",
              deno "test",
              pwa_node_attach,
            }
          end
        end,
        python = function(source_name)
          local dap = require "dap"
          dap.adapters.python = {
            type = "executable",
            command = "/usr/bin/python3",  -- "path/to/virtualenvs/debugpy/bin/python",
            args = {
              "-m",
              "debugpy.adapter",
            },
          }

          dap.configurations.python = {
            {
              -- The first three options are required by nvim-dap
              type = "python",
              request = "launch",
              name = "Launch file",

              -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
       	      -- 	  https://code.visualstudio.com/docs/python/debugging#_set-configuration-options
       	      -- 	  https://code.visualstudio.com/docs/python/settings-reference
              program = "${file}",  -- This configuration will launch the current file if used.
              pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                  return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                  return cwd .. "/.venv/bin/python"
                else
                  return "/usr/bin/python3"
                end
              end,
              stopOnEntry = false,
              justMyCode = false,
              gevent = false,
            },
          }
        end,
      },
    },
    enabled = vim.fn.has('win64') == 0,  -- vim.fn.has('unix') == 1 and 
  },
}
