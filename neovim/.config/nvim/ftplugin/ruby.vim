setlocal iskeyword+=!
setlocal iskeyword+=?

if expand('%')[len(expand('%'))-4:len(expand('%'))] != 'slim' && expand('%')[len(expand('%'))-3:len(expand('%'))] != 'erb' && expand('%')[len(expand('%'))-3:len(expand('%'))] != 'yml'
  autocmd BufWritePre <buffer> call CocAction('format')
endif
