function! s:AlternateLocale(key)
	let filename = expand('%')
	let alternate = substitute(filename, '\a\{2}\.yml', a:key . '.yml', '')
	return alternate
endfunction


function! s:SplitAlternate(key, modifiers)
	execute a:modifiers . ' split ' . s:AlternateLocale(a:key)
endfunction


command! -buffer -nargs=1 RailsLocaleAlternate :call s:SplitAlternate(<q-args>, <q-mods>)
command! -buffer -nargs=1 ERailsLocaleAlternate :execute 'edit ' . s:AlternateLocale(<q-args>)
command! -buffer -nargs=1 SRailsLocaleAlternate :call s:SplitAlternate(<q-args>, '')
command! -buffer -nargs=1 VRailsLocaleAlternate :call s:SplitAlternate(<q-args>, 'vertical')
