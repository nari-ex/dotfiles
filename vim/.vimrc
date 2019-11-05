set nocompatible
filetype plugin indent off

let g:vimproc_dll_path = $VIMRUNTIME . '/vimproc/autoload/vimproc_mac.so'

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/rc/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/rc'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('vim-scripts/surround.vim')
call dein#add('vim-scripts/taglist.vim.git')
call dein#add('vim-scripts/vim-coffee-script.git')
call dein#add('vim-scripts/JavaScript-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('lambdalisue/vim-python-virtualenv')
call dein#add('altercation/vim-colors-solarized')
call dein#add('mattn/excitetranslate-vim')
call dein#add('mattn/emmet-vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('othree/html5.vim')
" call dein#add('mjbrownie/django-template-textobjects')
" call dein#add('lambdalisue/vim-django-support')
call dein#add('kana/vim-textobj-user')
" call dein#add('godlygeek/tabular')
call dein#add('vim-scripts/pathogen.vim')
call dein#add('alfredodeza/khuno.vim.git')
call dein#add('chase/vim-ansible-yaml')
call dein#add('glidenote/serverspec-snippets')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('vim-scripts/desert.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('majutsushi/tagbar')
call dein#add('fatih/vim-go')
call dein#add('plasticboy/vim-markdown')

" Required:
call dein#end()

" Required:
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
