M = {}

vim.g.mkdd_tag_prefixes = { "#", "!!", "&&" }
vim.g.mkdd_task_done_symbols = "[xX✓]"

M.markdown = function()
	vim.cmd([[
  " Vim syntax file
  " Language:	Markdown
  " Maintainer:	David Scherrer
  " URL:	https://github.com/kraxli/vim-mkd-org
  " Remark:
  " TODO:

  " if !exists('g:mkdd_org_global_variables')
  "   execute 'source' fnamemodify(expand('<sfile>'), ':h:h:h').'/plugin/variables.vim'
  " endif


  """""""""""""""
  "  functions  "
  """""""""""""""
  command! -nargs=+ HiLink hi def link <args>

  """"""""""""""""""""""""""
  "  manipulate variables  "
  """"""""""""""""""""""""""
  " let g:mkdd_tag_prefixes = '!!,&&'
  " let l:tag_prefix = join(split(l:mkdd_tag_prefixes, '\zs'), '\|')
  let tag_prefix = join(g:mkdd_tag_prefixes, '\|')


  """"""""""""
  "  colors  "
  """"""""""""
  " http://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax
  " https://vi.stackexchange.com/questions/3355/why-do-custom-highlights-in-my-vimrc-get-cleared-or-reset-to-default
  " ---------------------
  hi hiTaskDone gui=italic guifg=#928374 cterm=italic ctermfg=242  " ctermfg=245
  autocmd ColorScheme * hi hi4TaskDone gui=italic guifg=#928374 cterm=italic ctermfg=242  " ctermfg=245

  hi hiToday guifg=#de935f ctermfg=173 gui=bold cterm=bold
  " autocmd ColorScheme * hi link hiToday Type
  autocmd ColorScheme * hi hiToday  guifg=#de935f ctermfg=173 gui=bold cterm=bold

  hi hiImportant ctermbg=167 guibg=Red ctermfg=234 guifg=#373b41
  autocmd ColorScheme * hi hiImportant ctermbg=167 guibg=Red ctermfg=234 guifg=#373b41

  hi hiPrio ctermfg=234 ctermbg=167 guifg=#1d1f21 guibg=#cc6666
  autocmd ColorScheme * hi hiPrio ctermfg=234 ctermbg=167 guifg=#1d1f21 guibg=#cc6666

  """"""""""""""
  "  patterns  "
  """"""""""""""
  " Timing needs to come after Project!
  syn match mkdTaskTiming  /\v\d{2}:\d\d/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\d{4}-\d\d-\d{2}/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\d:\d\d/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\d:\d\d-/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\d{2}:\d\d-/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\d{2}:\d\d-\d{2}:\d\d/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\@\d{4}-\d\d-\d\d/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\@\d{4}-\d\d-\d\d\:/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter
  syn match mkdTaskTiming  /\v\@\d{4}-\d\d-\d\d\s*-\s*\d{4}-\d\d-\d\d\:/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter

  execute 'syntax match mkdToday /' .strftime("%Y-%m-%d"). '/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday /\[DD: *' .strftime("%Y-%m-%d"). '\]/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday /@'.strftime("%Y-%m-%d").'/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday / \='.strftime("%Y-%m-%d").':/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday /\s\='.strftime("%Y-%m-%d").':/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday /\v\@'.strftime("%Y-%m-%d").'\s=[-]\s=\d{4}-\d\d-\d\d\s=\:/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'
  execute 'syntax match mkdToday /\v\@\d{4}-\d\d-\d\d\s=[-]\s='.strftime("%Y-%m-%d").'\s=\:/ containedin=mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter'

  execute 'syn match mkdListItemDone /^\s*\([\-\+\*]\|[0-9]*[\.)]\|\a)*[\.)]\)\s\[' . g:mkdd_task_done_symbols .  '\].*$/ contains=@mkdTag,@mkdTaskTiming containedin=markdownHeadingDelimiter,mkdxListItem'
  " execute 'syntax match mkdTag ' . '/\V\zs\[' . g:mkdd_tag_prefixes . ']\[^ ()!?]\{2,}/ contains=@mkdMath containedin=mkdNonListItem,mkdListItem,mkdListItemLine,mkdxListItem,markdownHeadingDelimiter,markdownListMarker,@mkdCode,@mkdCodeDelimiter,@mkdCodeStart,@mkdCodeEnd'
  execute 'syntax match mkdTag ' . '/\V\zs\(' . tag_prefix . '\)\[^ ()!?]\{2,}/ contains=@mkdMath containedin=mkdNonListItem,mkdListItem,mkdListItemLine,mkdxListItem,markdownHeadingDelimiter,markdownListMarker,@mkdCode,@mkdCodeDelimiter,@mkdCodeStart,@mkdCodeEnd'

  syntax match mkdImportant /\V \zs\!\{1,2}Important/ containedin=mkdTag,mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter,markdownListMarker,mkdxListItem
  syntax match mkdPrio /\V \zs\!\{1,2}\(Prio\|PRIO\|prio\|Priority\|PRIORITY\)\d\{0,2}/ containedin=mkdTag,mkdNonListItem,mkdListItem,mkdListItemLine,markdownHeadingDelimiter,markdownListMarker,mkdxListItem


  """"""""""""""""""""""""""""""
  "  links patterns to colors  "
  """"""""""""""""""""""""""""""
  HiLink mkdTag DiffChange
  hi link mkdListItemDone hiTaskDone
  " hi link VimwikiCheckBoxDone hiTaskDone
  hi link mkdTaskTiming Type
  hi link mkdToday hiToday
  hi link mkdImportant hiImportant
  hi link mkdPrio hiPrio
  " DiffChange ErrorMsg Directory Todo Identifier (ctermfg=139 guifg=#b294bb) cssAttr DiffDelete Constant Comment StatusLineNC  hi4TaskDone RedrawDebugRecompose SpellRare SpellBad


  " let b:current_mkdd_syntax = "mkdd"
  delcommand HiLink
  ]])
end

return M
