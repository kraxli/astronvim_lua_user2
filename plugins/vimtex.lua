
-- Or with a generic interface:
-- vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
-- if IS_WINDOWS then
--   vim.g.vimtex_view_general_viewer = 'SumatraPDF'
-- else
  -- vim.g.vimtex_view_method = 'mupdf' --'zathura'
-- end

-- VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- strongly recommended, you probably don't need to configure anything. If you
-- want another compiler backend, you can change it as follows. The list of
-- supported backends and further explanation is provided in the documentation,
-- see ":help vimtex-compiler".
-- vim.g.vimtex_compiler_method = 'latexrun'

vim.cmd([[
  let g:vimtex_view_method =  'general' " 'mupdf' " 'zathura'
]])
