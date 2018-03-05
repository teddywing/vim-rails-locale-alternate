" Transform the current filename into a variant with key.
"
" Example:
"   config/locales/posts.en.yml
"   s:AlternateLocale('fr') => 'config/locales/posts.fr.yml'
function! s:AlternateLocale(key)
	let filename = expand('%')
	let alternate = substitute(filename, '\a\{2}\.yml', a:key . '.yml', '')
	return alternate
endfunction


" Open a new split window containing the file named `s:AlternateLocale(a:key)`
function! s:SplitAlternate(key, modifiers)
	execute a:modifiers . ' split ' . s:AlternateLocale(a:key)
endfunction


" Create user-facing commands to open the alternate locale file in a different
" window configurations.
function! rails_locale_alternate#CreateCommands()
	command! -buffer -nargs=1 RailsLocaleAlternate :call s:SplitAlternate(<q-args>, <q-mods>)
	command! -buffer -nargs=1 ERailsLocaleAlternate :execute 'edit ' . s:AlternateLocale(<q-args>)
	command! -buffer -nargs=1 SRailsLocaleAlternate :call s:SplitAlternate(<q-args>, '')
	command! -buffer -nargs=1 VRailsLocaleAlternate :call s:SplitAlternate(<q-args>, 'vertical')
endfunction
