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
set runtimepath^=/Users/takamura/.vim/rc/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/takamura/.vim/rc'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('surround.vim')
call dein#add('taglist.vim.git')
call dein#add('vim-coffee-script.git')
call dein#add('JavaScript-syntax')
call dein#add('pangloss/vim-javascript')
call dein#add('lambdalisue/vim-python-virtualenv')
call dein#add('altercation/vim-colors-solarized')
call dein#add('mattn/excitetranslate-vim')
call dein#add('drakontia/sphinx.vim')
call dein#add('fuenor/qfixhowm.git')
call dein#add('mattn/emmet-vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('othree/html5.vim')
call dein#add('mjbrownie/django-template-textobjects')
call dein#add('lambdalisue/vim-django-support')
call dein#add('kana/vim-textobj-user')
call dein#add('godlygeek/tabular')
call dein#add('gabrielelana/vim-markdown')
call dein#add('tyru/open-browser.vim')
call dein#add('rizzatti/dash.vim.git')
call dein#add('pathogen.vim')
call dein#add('alfredodeza/khuno.vim.git')
call dein#add('chase/vim-ansible-yaml')
call dein#add('glidenote/serverspec-snippets')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('vim-scripts/desert.vim')
call dein#add('kien/ctrlp.vim')
call dein#add('majutsushi/tagbar')
call dein#add('fatih/vim-go')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" if dein#load_state(s:dein_dir)
"   call dein#begin(s:dein_dir)
" 
"   let g:rc_dir    = expand('~/.vim/rc')
"   let s:toml      = g:rc_dir . '/dein.toml'
"   let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
" 
"   " call dein#load_toml(s:lazy_toml, {'lazy': 1})
" 
"   " TOML を読み込み、キャッシュしておく
"   call dein#load_toml(s:toml,      {'lazy': 0})
"   call dein#end()
"   call dein#save_state()
" endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set conceallevel=0
