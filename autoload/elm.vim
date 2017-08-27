" Returns the closest parent with an elm-package.json file.
function! elm#FindRootDirectory() abort
	let l:elm_root = getbufvar('%', 'elmRoot')
	if empty(l:elm_root)
		let l:current_file = expand('%:p')
		let l:dir_current_file = fnameescape(fnamemodify(l:current_file, ':h'))
		let l:match = findfile('elm-package.json', l:dir_current_file . ';')
		if empty(l:match)
			let l:elm_root = ''
		else
			let l:elm_root = fnamemodify(l:match, ':p:h')
		endif

		if !empty(l:elm_root)
			call setbufvar('%', 'elmRoot', l:elm_root)
		endif
	endif
	return l:elm_root
endfunction
