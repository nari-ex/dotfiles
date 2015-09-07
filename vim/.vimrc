set nocompatible
filetype off
filetype plugin off
filetype indent off

if has('vim_starting')
	set runtimepath+=~/.vim/.bundle/neobundle.vim
endif

let g:vimproc_dll_path = $VIMRUNTIME . '/vimproc/autoload/vimproc_mac.so'

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'https://github.com/nathanaelkane/vim-indent-guides'
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/ujihisa/neco-look.git'
NeoBundle 'https://github.com/thinca/vim-ref.git'
NeoBundle 'https://github.com/Shougo/vimproc.git', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'surround.vim'
NeoBundle 'https://github.com/davidoc/taskpaper.vim.git'
NeoBundle 'https://github.com/vim-scripts/taglist.vim.git'
NeoBundle 'https://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
NeoBundle 'https://github.com/scrooloose/syntastic.git'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'https://github.com/nvie/vim-pyflakes.git'
NeoBundle 'lambdalisue/vim-python-virtualenv'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'https://github.com/mitechie/pyflakes-pathogen'
NeoBundle 'https://github.com/davidhalter/jedi-vim'
NeoBundle 'https://github.com/mattn/excitetranslate-vim'
NeoBundle 'https://github.com/mattn/webapi-vim'
NeoBundle 'Pydiction'
NeoBundle 'drakontia/sphinx.vim'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'git://github.com/fuenor/qfixhowm.git'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'mjbrownie/django-template-textobjects'
NeoBundle 'https://github.com/lambdalisue/vim-django-support'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'https://github.com/rizzatti/dash.vim.git'
NeoBundle 'pathogen.vim'
NeoBundle 'https://github.com/alfredodeza/khuno.vim.git'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'glidenote/serverspec-snippets'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'https://github.com/lambdatoast/elm.vim.git'
NeoBundle 'https://github.com/tell-k/vim-autoflake'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'https://github.com/suan/vim-instant-markdown'
NeoBundle 'vim-scripts/desert.vim'
call neobundle#end()

filetype plugin on
filetype indent on

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set conceallevel=0
