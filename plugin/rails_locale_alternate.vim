if exists('g:loaded_rails_locale_alternate')
	finish
endif
let g:loaded_rails_locale_alternate = 1


augroup rails_locale_alternate
	autocmd!

	autocmd BufNewFile,BufRead config/locales/*.\a\a.yml call rails_locale_alternate#CreateCommands()
augroup END
