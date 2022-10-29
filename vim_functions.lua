vim.cmd([[
  function! MkdFoldSimple()

    let this_line = v:lnum
    " let cur_line = getline(this_line)
    " let nxt_line = getline(this_line + 1)
    " let prv_line =  getline(this_line - 1)

    " let prv_syntax_group = synIDattr(synID(this_line - 1, 1, 1), 'name')
    let cur_syntax_group = synIDattr(synID(this_line, 1, 1), 'name')
    " let nxt_syntax_group = synIDattr(synID(this_line + 1, 1, 1), 'name')

    let pounds = HeaderLevel(this_line)  " strlen(matchstr(getline(this_line), '^#\+'))
    let isCodeBlock = (cur_syntax_group ==? 'mkdCode' || cur_syntax_group ==? 'markdownCode' || cur_syntax_group =~? 'code' || cur_syntax_group =~? 'comment')

    if (pounds && !isCodeBlock)
      return '>' . pounds  " start a fold level
    endif
    if getline(this_line) =~? '\v^\s*$'
      if HeaderLevel(this_line + 1) " (strlen(matchstr(getline(this_line + 1), '^#\+')))
        return '-1' " don't fold last blank line before header
      endif
    endif
    return '=' " return previous fold level
  endfunction

  " let cur_syntax_group = synIDattr(synID(a:lnum, 1, 1), 'name')
  " pythonComment

  function! HeaderLevel(lnum)

	  let l:codeSyntax = ['pythonComment', 'nimComment', 'perlComment', 'rComment', 'textSnipR', 'rubyComment', 'syntaxCode', 'zshComment', 'shComment']

    let l:curSyntaxGroup = synIDattr(synID(a:lnum, 1, 1), 'name')
	  " curSyntaxGroup =~? 'syntaxCode'

	  if (index(l:codeSyntax, l:curSyntaxGroup) >= 0)
		  let ans = 0
	  else
		  let ans = strlen(matchstr(getline(a:lnum), '^#\+'))  " header level / number of #
	  endif

	  return ans
  endfunction


  function! TwiddleCase(str) abort
    if a:str ==# toupper(a:str)
      let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
      let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
      let result = toupper(a:str)
    endif
    return result
  endfunction

  function! KeyMaps()
      silent enew|pu=execute('verbose map')
      silent g/\s*Last.*/d
      silent g/^\s*$/d
  endfunction


  " TODO: tern into lua funtion (see: https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
  function! Toggle_background() "{{{
	  if ! exists('g:colors_name')
		  echomsg 'No colorscheme set'
		  return
	  endif

	  let l:scheme = g:colors_name
    let l:bg = &background 

    if (exists('g:toggle_colorschemes') && l:scheme =~# g:toggle_colorschemes[l:bg])

		  let l:new_bg = (l:bg =~# 'dark'
					  \ ? substitute(l:bg, 'dark', 'light', '')
					  \ : substitute(l:bg, 'light', 'dark', '')
		        \ )

		  execute 'colorscheme ' .. g:toggle_colorschemes[l:new_bg]
      return
    end


	  if l:scheme =~# 'fox'
	    let l:prefix_color = substitute(l:scheme, 'fox', '', '')
		  let l:scheme = (l:scheme =~# 'nord'
					  \ ? substitute(l:scheme, 'nord', 'day', '')
					  \ : substitute(l:scheme, 'day', 'nord', '')
		        \ )

		  execute 'colorscheme ' .. l:scheme
      return
    end


	  if l:scheme =~# 'dark' || l:scheme =~# 'light'
		  " Rotate between different theme backgrounds
		  execute 'colorscheme' (l:scheme =~# 'dark'
					  \ ? substitute(l:scheme, 'dark', 'light', '')
					  \ : substitute(l:scheme, 'light', 'dark', ''))
	  else
		  execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		  if ! exists('g:colors_name')
			  execute 'colorscheme' l:scheme
			  echomsg 'The colorscheme `'.l:scheme
				  \ .'` doesn''t have background variants!'
		  else
			  echo 'Set colorscheme to '.&background.' mode'
		  endif
	  endif
  endfunction "}}}


  " TODO: tern into lua cuntion (see: https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
  function! Window_empty_buffer() "{{{
	  let l:current = bufnr('%')
	  if ! getbufvar(l:current, '&modified')
		  enew
		  silent! execute 'bdelete ' . l:current
	  endif
  endfunction "}}}


  " TODO: tern into lua cuntion (see: https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/)
  " Simple zoom toggle
  function! Zoom() "{{{
	  if exists('t:zoomed')
		  unlet t:zoomed
		  wincmd =
	  else
		  let t:zoomed = { 'nr': bufnr('%') }
		  vertical resize
		  resize
		  normal! ze
	  endif
  endfunction "}}}

]])
