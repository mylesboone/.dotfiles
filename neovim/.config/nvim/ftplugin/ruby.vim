setlocal iskeyword+=!
setlocal iskeyword+=?

autocmd BufWritePre <buffer> call CocAction('format')
