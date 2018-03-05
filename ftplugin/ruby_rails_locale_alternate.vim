function! s:AlternateLocale(key)
	let filename = expand('%')
	let alternate = substitute(filename, '..\.yml', a:key . '.yml', '')
	return alternate
endfunction


function! s:SplitAlternate(key)
	execute 'split ' . s:AlternateLocale(a:key)
endfunction


command! -buffer -nargs=1 SRailsLocaleAlternate :call s:SplitAlternate(<args>)
command! -buffer -nargs=1 VRailsLocaleAlternate :call s:SplitAlternate(<args>)
