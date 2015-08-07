" 国際化関連
"
" 文字コードの設定
" fencsの記述にはeuc-jp（encの値）は一番最後に記述する必要がある
" vimはファイルのオープン時にfencsの値を先頭から参照していき、fencsと値が
" 一致したエンコーディングでファイルをオープンする
" この時、一致しなくともencで指定されたエンコーディングが現れると無条件で
" そのエンコーディングでファイルを開いてしまうため
"set ambiwidth=double
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,ucs-2le,ucs-2,cp932,euc-jp
set guifont=Ricty:h20
