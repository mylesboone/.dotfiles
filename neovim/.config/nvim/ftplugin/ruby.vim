setlocal iskeyword+=!
setlocal iskeyword+=?

autocmd BufWritePre <buffer> silent call CocAction('format')
