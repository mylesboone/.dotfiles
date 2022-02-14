setlocal iskeyword+=!
setlocal iskeyword+=?
setlocal isfname-=.

if expand('%')[len(expand('%'))-4:len(expand('%'))] != 'slim'
  autocmd BufWritePre <buffer> call CocAction('format')
endif
