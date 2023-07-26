return {
{
	"tpope/vim-fugitive",
	cmd = "Git",
},
{
	"junegunn/gv.vim",
	cmd = "GV",
},
-- {
-- 		"TimUntersberger/neogit",
-- 		requires = { "nvim-lua/plenary.nvim", "diffview.nvim" },
-- 		cmd = "Neogit",
-- 		config = function()
-- 			require("neogit").setup({
-- 				disable_signs = false,
-- 				disable_hint = false,
-- 				disable_context_highlighting = false,
-- 				disable_commit_confirmation = false,
-- 				-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
-- 				-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
-- 				auto_refresh = true,
-- 				disable_builtin_notifications = false,
-- 				use_magit_keybindings = false,
-- 				-- Change the default way of opening neogit
-- 				kind = "tab",
-- 				-- Change the default way of opening the commit popup
-- 				commit_popup = {
-- 					kind = "split",
-- 				},
-- 				-- Change the default way of opening popups
-- 				popup = {
-- 					kind = "split",
-- 				},
-- 				-- customize displayed signs
-- 				signs = {
-- 					-- { CLOSED, OPENED }
-- 					section = { ">", "v" },
-- 					item = { ">", "v" },
-- 					hunk = { "", "" },
-- 				},
-- 				integrations = {
-- 					-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `sindrets/diffview.nvim`.
-- 					-- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
-- 					--
-- 					-- Requires you to have `sindrets/diffview.nvim` installed.
-- 					-- use {
-- 					--   'TimUntersberger/neogit',
-- 					--   requires = {
-- 					--     'nvim-lua/plenary.nvim',
-- 					--     'sindrets/diffview.nvim'
-- 					--   }
-- 					-- }
-- 					--
-- 					diffview = false,
-- 				},
-- 				-- Setting any section to `false` will make the section not render at all
-- 				sections = {
-- 					untracked = {
-- 						folded = false,
-- 					},
-- 					unstaged = {
-- 						folded = false,
-- 					},
-- 					staged = {
-- 						folded = false,
-- 					},
-- 					stashes = {
-- 						folded = true,
-- 					},
-- 					unpulled = {
-- 						folded = true,
-- 					},
-- 					unmerged = {
-- 						folded = false,
-- 					},
-- 					recent = {
-- 						folded = true,
-- 					},
-- 				},
-- 				-- override/add mappings
-- 				mappings = {
-- 					-- modify status buffer mappings
-- 					status = {
-- 						-- Adds a mapping with "B" as key that does the "BranchPopup" command
-- 						["B"] = "BranchPopup",
-- 						-- Removes the default mapping of "s"
-- 						["s"] = "",
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      event = "User AstroGitFile",
      opts = function()
        local actions = require "diffview.actions"
        local utils = require "astronvim.utils" --  astronvim utils

        local prefix = "<leader>D"

        utils.set_mappings {
          n = {
            [prefix] = { name = " Diff View" },
            [prefix .. "<cr>"] = { "<cmd>DiffviewOpen<cr>", desc = "Open DiffView" },
            [prefix .. "h"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "Open DiffView File History" },
            [prefix .. "H"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Open DiffView Branch History" },
          },
        }

        local build_keymaps = function(maps)
          local out = {}
          local i = 1
          for lhs, def in
            pairs(utils.extend_tbl(maps, {
              [prefix .. "q"] = { "<cmd>DiffviewClose<cr>", desc = "Quit Diffview" }, -- Toggle the file panel.
              ["]D"] = { actions.select_next_entry, desc = "Next Difference" }, -- Open the diff for the next file
              ["[D"] = { actions.select_prev_entry, desc = "Previous Difference" }, -- Open the diff for the previous file
              ["[C"] = { actions.prev_conflict, desc = "Next Conflict" }, -- In the merge_tool: jump to the previous conflict
              ["]C"] = { actions.next_conflict, desc = "Previous Conflict" }, -- In the merge_tool: jump to the next conflict
              ["Cl"] = { actions.cycle_layout, desc = "Cycle Diff Layout" }, -- Cycle through available layouts.
              ["Ct"] = { actions.listing_style, desc = "Cycle Tree Style" }, -- Cycle through available layouts.
              ["<leader>e"] = { actions.toggle_files, desc = "Toggle Explorer" }, -- Toggle the file panel.
              ["<leader>o"] = { actions.focus_files, desc = "Focus Explorer" }, -- Bring focus to the file panel
            }))
          do
            local opts
            local rhs = def
            local mode = { "n" }
            if type(def) == "table" then
              if def.mode then mode = def.mode end
              rhs = def[1]
              def[1] = nil
              def.mode = nil
              opts = def
            end
            out[i] = { mode, lhs, rhs, opts }
            i = i + 1
          end
          return out
        end

        return {
          enhanced_diff_hl = true,
          view = {
            merge_tool = { layout = "diff3_mixed" },
          },
          hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
          keymaps = {
            disable_defaults = true,
            view = build_keymaps {
              [prefix .. "o"] = { actions.conflict_choose "ours", desc = "Take Ours" }, -- Choose the OURS version of a conflict
              [prefix .. "t"] = { actions.conflict_choose "theirs", desc = "Take Theirs" }, -- Choose the THEIRS version of a conflict
              [prefix .. "b"] = { actions.conflict_choose "base", desc = "Take Base" }, -- Choose the BASE version of a conflict
              [prefix .. "a"] = { actions.conflict_choose "all", desc = "Take All" }, -- Choose all the versions of a conflict
              [prefix .. "0"] = { actions.conflict_choose "none", desc = "Take None" }, -- Delete the conflict region
            },
            diff3 = build_keymaps {
              [prefix .. "O"] = { actions.diffget "ours", mode = { "n", "x" }, desc = "Get Our Diff" }, -- Obtain the diff hunk from the OURS version of the file
              [prefix .. "T"] = { actions.diffget "theirs", mode = { "n", "x" }, desc = "Get Their Diff" }, -- Obtain the diff hunk from the THEIRS version of the file
            },
            diff4 = build_keymaps {
              [prefix .. "B"] = { actions.diffget "base", mode = { "n", "x" }, desc = "Get Base Diff" }, -- Obtain the diff hunk from the OURS version of the file
              [prefix .. "O"] = { actions.diffget "ours", mode = { "n", "x" }, desc = "Get Our Diff" }, -- Obtain the diff hunk from the OURS version of the file
              [prefix .. "T"] = { actions.diffget "theirs", mode = { "n", "x" }, desc = "Get Their Diff" }, -- Obtain the diff hunk from the THEIRS version of the file
            },
            file_panel = build_keymaps {
              j = actions.next_entry, -- Bring the cursor to the next file entry
              k = actions.prev_entry, -- Bring the cursor to the previous file entry.
              o = actions.select_entry,
              S = actions.stage_all, -- Stage all entries.
              U = actions.unstage_all, -- Unstage all entries.
              X = actions.restore_entry, -- Restore entry to the state on the left side.
              L = actions.open_commit_log, -- Open the commit log panel.
              Cf = { actions.toggle_flatten_dirs, desc = "Flatten" }, -- Flatten empty subdirectories in tree listing style.
              R = actions.refresh_files, -- Update stats and entries in the file list.
              ["-"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
              ["<down>"] = actions.next_entry,
              ["<up>"] = actions.prev_entry,
              ["<cr>"] = actions.select_entry, -- Open the diff for the selected entry.
              ["<2-LeftMouse>"] = actions.select_entry,
              ["<c-b>"] = actions.scroll_view(-0.25), -- Scroll the view up
              ["<c-f>"] = actions.scroll_view(0.25), -- Scroll the view down
              ["<tab>"] = actions.select_next_entry,
              ["<s-tab>"] = actions.select_prev_entry,
            },
            file_history_panel = build_keymaps {
              j = actions.next_entry,
              k = actions.prev_entry,
              o = actions.select_entry,
              y = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
              L = actions.open_commit_log,
              zR = { actions.open_all_folds, desc = "Open all folds" },
              zM = { actions.close_all_folds, desc = "Close all folds" },
              ["?"] = { actions.options, desc = "Options" }, -- Open the option panel
              ["<down>"] = actions.next_entry,
              ["<up>"] = actions.prev_entry,
              ["<cr>"] = actions.select_entry,
              ["<2-LeftMouse>"] = actions.select_entry,
              ["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
              ["<c-b>"] = actions.scroll_view(-0.25),
              ["<c-f>"] = actions.scroll_view(0.25),
              ["<tab>"] = actions.select_next_entry,
              ["<s-tab>"] = actions.select_prev_entry,
            },
            option_panel = {
              q = actions.close,
              o = actions.select_entry,
              ["<cr>"] = actions.select_entry,
              ["<2-LeftMouse"] = actions.select_entry,
            },
          },
        }
      end,
    },
  },
  opts = function()
    local get_icon = require("astronvim.utils").get_icon
    local fold_signs = { get_icon "FoldClosed", get_icon "FoldOpened" }
    return {
      disable_builtin_notifications = true,
      telescope_sorter = function() return require("telescope").extensions.fzy_native.native_fzy_sorter() end,
      integrations = { telescope = true, diffview = true },
      signs = { section = fold_signs, item = fold_signs },
    }
  end,
}
