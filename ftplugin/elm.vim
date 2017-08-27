if exists('b:did_ftplugin')
	finish
endif
let b:did_ftplugin = 1

setlocal omnifunc=elm#Complete

setlocal comments=:--
setlocal commentstring=--\ %s

setlocal suffixesadd=.elm

let &l:path =
	\ join([
	\   elm#FindRootDirectory().'/src',
	\   elm#FindRootDirectory().'/elm-stuff/packages/**/src',
	\   &g:path
	\ ], ',')
setlocal includeexpr=substitute(v:fname,'\.','/','g')
setlocal include=^\\s*import\\s\\+
