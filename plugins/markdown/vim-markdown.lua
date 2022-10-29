-- Links and text formatting is concealed
vim.g.vim_markdown_conceal = 2
-- disable math conceal with LaTeX math syntax enabled,
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
-- Enable TOC window auto-fit
vim.g.vim_markdown_toc_autofit = 1
-- Text emphasis restriction to single/multi-lines
vim.g.vim_markdown_emphasis_multiline = 1
-- Fenced code block languages
vim.g.vim_markdown_fenced_languages = {
	"c++=cpp",
	"viml=vim",
	"bash=sh",
	"ini=dosini",
	"js=javascript",
	"json=javascript",
	"jsx=javascriptreact",
	"tsx=typescriptreact",
	"docker=Dockerfile",
	"makefile=make",
	"py=python",
}
-- turn on/off syntax extensions
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1

vim.cmd([[
       let g:vim_markdown_frontmatter = 1
       let g:vim_markdown_strikethrough = 1
       let g:vim_markdown_folding_disabled = 1
       let g:vim_markdown_conceal = 1
       let g:vim_markdown_conceal_code_blocks = 1
       let g:vim_markdown_new_list_item_indent = 0
       let g:vim_markdown_toc_autofit = 0
       let g:vim_markdown_follow_anchor = 0
       let g:vim_markdown_no_extensions_in_markdown = 1
       let g:vim_markdown_edit_url_in = 'vsplit'
       " vim.g.vim_markdown_auto_insert_bullets = 0
       let g:vim_markdown_auto_insert_bullets = 0
       " let g:vim_markdown_fenced_languages = [
       "   \ 'c++=cpp',
       "   \ 'viml=vim',
       "   \ 'bash=sh',
       "   \ 'ini=dosini',
       "   \ 'js=javascript',
       "   \ 'json=javascript',
       "   \ 'jsx=javascriptreact',
       "   \ 'tsx=typescriptreact',
       "   \ 'docker=Dockerfile',
       "   \ 'makefile=make',
       "   \ 'py=python'
       "   \ ]

       " --------------------------------------------"
       " Plugin MarkdownPreview
       " --------------------------------------------"
   ]])
