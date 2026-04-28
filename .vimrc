" kill vi compatibility
set nocompatible               " be iMproved
filetype off                   " required!
"
"
" " vim IDE settings
set number
"
" " Highlight current line
set cursorline

set fileformat=unix                                                                                    
                                                                                                       
" given +clipboard
" enable clipboard register                                                                            
" normal y should copy to clipboard
set clipboard=unnamed
" set clipboard=unnamedplus

" set backspace on VIm
set backspace=indent,eol,start

if exists('+colorcolumn')
    set colorcolumn=100
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" ==============================================================
" =====================   vim-plug    ==========================
" ==============================================================
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/csv.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'github/copilot.vim'

" === Markdown
Plug 'preservim/vim-markdown'

call plug#end()

" ==============================================================
" =====================     NERDTree   =========================
" ==============================================================
"  @see :
"  http://www.objectpartners.com/2012/02/21/using-vim-as-your-grails-ide-part-1-navigating-your-project/
map <C-n> :NERDTreeToggle<CR>     " Toggle file browser
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
map <C-f> <Esc>:NERDTreeFind<CR> "Find the current file in the file browser
" r - refresh
" C-minus/C-S-plus - to zoom out/in font

" status bar
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='papercolor'
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" === javascript
let g:javascript_plugin_jsdoc = 1

" === markdown
let g:vim_markdown_folding_disabled = 1     " disable folding by default
let g:vim_markdown_conceal = 1              " hide markdown syntax for cleaner reading
let g:vim_markdown_conceal_code_blocks = 0  " show code block markers
let g:vim_markdown_follow_anchor = 1        " ge follows anchors in links

let g:solarized_termcolors= 256
"let g:solarized_termtrans = 16

"let g:solarized_bold = 1
"let g:solarized_underline = 1 
"let g:solarized_italic = 1
"let g:solarized_contrast = "high"
"let g:solarized_visibility= "high"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

syntax on
filetype plugin indent on

syntax enable
set background=light
colorscheme solarized

