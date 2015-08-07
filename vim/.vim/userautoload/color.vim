set t_Co=256
colorscheme desert
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1 "インデントの色付け幅
let g:indent_guides_auto_colors = 0
"let g:indent_guides_color_change_percent = 10
"let g:indent_guides_start_level = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black guibg=black ctermbg=233 "インデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey guibg=darkgrey ctermbg=234 "二段階目のインデントの色


"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast='normal'
"let g:solarized_visibility='normal'
"colorscheme solarized
"
"call togglebg#map('<F5>')

hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
