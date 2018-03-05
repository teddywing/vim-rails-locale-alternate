augroup rails_locale_alternate
	autocmd!

	autocmd BufNewFile,BufRead config/locales/*.\a\a.yml call rails_locale_alternate#CreateCommands()
augroup END
