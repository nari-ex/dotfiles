

"補完候補を表示する
set wildmenu
" 
"補完モード
" 最初のマッチのみを補完する。
"full"
"次のマッチを完全に補完する。最後のマッチの次には元の文字列が使われ、その次は再び最初のマッチが補完される
"longest"
"共通する最長の文字列までが補完される。それ以上長い文字列を補完できないときは、次の候補に移る
"longest:full"  "longest" と似ているが、'wildmenu'
"が有効ならばそれを開始する
"list"          複数のマッチがあるときは、全てのマッチを羅列する。
"list:full"
"複数のマッチがあるときは、全てのマッチを羅列し、最初のマッチを補完する
"list:longest"
"複数のマッチがあるときは、全てのマッチを羅列し、共通する最長の文字列までが補完される
set wildmode=list:longest,full

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent
 
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
 
" <Tab> が対応する空白の数。
set tabstop=2
 
" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=2
 
" インデントの各段階に使われる空白の数
set shiftwidth=2
 
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
set expandtab
 
" 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set incsearch

" 括弧入力時の対応する括弧を表示
set showmatch

