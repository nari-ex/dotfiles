autocmd FileType python let g:pydiction_location = '~/.vim/.neobundle/Pydiction/'

let g:jedi#auto_vim_configuration=0
let g:jedi#popup_on_dot=0


set completeopt-=preview
"" <TAB> completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"


augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

hi link markdownError Normal

let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/.neobundle/serverspec-snippets/',
      \]

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"


inoremap <tab> <c-r>=InsertTabWrapper()<cr>
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

autocmd BufReadPost,BufNewFile *_spec.rb set ft=ruby.serverspec
autocmd BufReadPost,BufNewFile *_spec.rb setlocal commentstring=#\ %s

let g:flake8_ignore="E501,W293"
let g:khuno_ignore="E501,W293,D102,D100"
let g:instant_markdown_autostart = 0
