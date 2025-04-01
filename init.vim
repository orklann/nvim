" Key bindings can be changed, see below
" call wilder#setup({'modes': [':', '/', '?']})
"call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      "\ 'highlights': {
      "\   'border': 'Normal',
      "\ },
      "\ 'border': 'rounded',
      "\ })))

" Theme
set termguicolors

set nonu

cabbrev t tabnew
cabbrev tn tabnext
cabbrev tp tabprevious

map <c-u> :tabprevious<CR>
imap <c-u> <ESC>:tabprevious<CR>
map <c-i> :tabnext<CR>
nmap <c-i> <ESC>:tabnext<CR>
map <c-j> <c-f>
map <c-k> <c-b>


let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
"colorscheme sidonia

" Delete word backward
nnoremap dw bdw

" Old status line theme
" Color groups for status lines for Neovide
hi User1 guibg=#5F5FAF guifg=Black
hi User2 guibg=#5F5FAF guifg=White

" hi User1 guifg=#5F5FAF
"hi User2 guibg=#5F5FAF guifg=White

" Status text
fun! GetPaddingSpaces(s)
  let w = winwidth('%')
  let width = &modified ? w - 1: w
  let padding = (width - len(a:s)) / 2
  return repeat('\ ', padding)
endfun

fun! GetStatus()
  let sign = &modified ? '*' : ''
  let lineNumber= repeat('1', len(printf('%i', getline('.'))))
  let columnNumber = repeat('1', len(printf('%i', virtcol('.'))))
  let fullPath = fnameescape(pathshorten(expand('%:p:h')))
  let filename = fnameescape(expand('%:t'))
  let path = fullPath.'/'.filename.':'.lineNumber.':'.columnNumber
  let spaces = GetPaddingSpaces(path)
  " Show file encoding on status line
  "let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l'."%=%2*%{''.(&fenc!=''?&fenc:&enc).''}"
  let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l:%2*%c'
  exec s
endfun


autocmd CursorMoved * call GetStatus()
autocmd BufWritePost * call GetStatus()
autocmd BufRead,BufNewFile * call GetStatus()
autocmd! BufRead,BufNewFile * call GetStatus()
autocmd! BufEnter * call GetStatus()
autocmd VimEnter * call GetStatus()

" Change to current directory which contains new file
fun! CWD()
    let fullPath = expand('%:p:h')
    let s = "cd ".fullPath
    exec s
endfun

autocmd BufRead,BufNewFile * call CWD()
autocmd! BufRead,BufNewFile * call CWD()
autocmd! BufEnter * call CWD()

" In visual mode, use Y to copy to system clipboard
vnoremap Y "*y

" In normal mode, do the same with the current line
nnoremap Y "*yy

" vv = V
nnoremap vv V

" yank also copy to system  pasteboad
set clipboard=unnamed

" yank also copy to system clipboard for Ubuntu
set clipboard=unnamedplus

" Easy way for ^, $
nnoremap <silent> e ^
vnoremap <silent> e ^
nnoremap <silent> r $
vnoremap <silent> r $
nnoremap <silent> t 0
vnoremap <silent> t 0
nnoremap <silent> s e

" gg, GG shortcuts
noremap <silent> <nowait> G GG

" New line
nmap <CR> o<Esc>i

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tweekmonster/deoplete-clang2'

call plug#end()

"let g:deoplete#enable_at_startup = 1

"set completeopt=menu,menuone,noselect

" Source configurations
source ~/.config/nvim/vim/colorizer.vim
source ~/.config/nvim/vim/nvim-cmp.vim
source ~/.config/nvim/vim/cscope.vim

" Disable mouse
set mouse=

" Tabline colors
hi TabLineSel guifg=white guibg=#5F5FAF

" Wrap text to textwidth: set textwidth=80, and use this command
nmap <C-L> gqG

" Set tabs for cosmopolitan
au BufRead,BufNewFile,BufEnter /home/rkt/projects/cosmopolitan/* setlocal ts=2 sts=2 sw=2


" Set tab line
set tabline=%!GetTabLine()

function! GetTabLine()
  let line = ''
  let s:current_tab = tabpagenr()
  for i in range(tabpagenr('$'))
    let bufnr = tabpagebuflist(i+1)[0]
    let bufname = bufname(bufnr)
    let tab_label = fnamemodify(bufname, ':t')
    if i+1 == s:current_tab
      let line .= '%' . (i+1) . 'T%#TabLineSel#' . tab_label . ' %#TabLine#'
    else
      let line .= '%' . (i+1) . 'T%#TabLine#' . tab_label . ' '
    endif
  endfor
  return line
endfunction

" Comment out erlang block codes
vnoremap <silent> <C-k> :s/^/%<cr>:noh<cr>
vnoremap <silent> <C-l> :s/^%/<cr>:noh<cr>

cnoreabbrev nodeo call deoplete#custom#option('auto_complete', v:false)
cnoreabbrev deo call deoplete#custom#option('auto_complete', v:true)
