" This is Tiande's Personal settings.

" [禁止] 折行
set wrap " nowrap

" set list " 显示制表符等
" set listchars=tab:>-,trail:-

" solarized 配置，不用的时候可以注释掉
let g:solarized_termcolors=256 " 16 | 256
let g:solarized_italic=0 " 1 | 0
" let g:solarized_bold=0
" let g:solarized_underline=0

set background=light " dark light
:colorscheme solarized "peaksea solarized ir_black mayansmoke 

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" 用来 on off Syntastic 的 function
function! SyntasticToggle()
    if exists('g:IsSyntasticOn')
        if g:IsSyntasticOn == 1
            SyntasticToggleMode
            let g:IsSyntasticOn = 0
        else
            SyntasticCheck
            let g:IsSyntasticOn = 1
        endif
    else
        let g:IsSyntasticOn = 1
        call SyntasticToggle()
    endif
endfunction
" map ,,, to off/on Syntastic
map <leader><leader><leader> :call SyntasticToggle()<cr>
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8'] " 修改检查器的地方
" A. Configure the python checker to call a Python 3 interpreter rather than Python 2, e.g:
" let g:syntastic_python_python_exec = 'path/to/python3'
" display all of the errors from all of the checkers together
let g:syntastic_aggregate_errors = 1

" mapping move focus to tab* use: ,t1 ,t2 ...
map <leader>t1 :tabnext 1<cr>
map <leader>t2 :tabnext 2<cr>
map <leader>t3 :tabnext 3<cr>
map <leader>t4 :tabnext 4<cr>
map <leader>t5 :tabnext 5<cr>
map <leader>t6 :tabnext 6<cr>
map <leader>t7 :tabnext 7<cr>
map <leader>t8 :tabnext 8<cr>
map <leader>t9 :tabnext 9<cr>

" use tagbar to  instead of taglist
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_show_visibility = 1
" let g:tagbar_show_linenumbers = 2
map <leader>tg :TagbarToggle<cr>

" Set line number
set number
" set cursorline and cursorcolumn
set cursorline
" set cursorcolumn
" foldmethod
" set foldmethod=indent " marker
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" multi_cursor
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" if use gvim then change guifont
if has('gui_running')
  set guifont=Lucida_Console:h12
endif

" map $t to <>
vnoremap $t <esc>`>a><esc>`<i<<esc>
inoremap $t <><esc>i

