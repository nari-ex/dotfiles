autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType python autocmd BufWritePre * :%s/\s\+$//ge
autocmd FileType python setl textwidth=120
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
