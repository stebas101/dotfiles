call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'         "comment out lines with gcc
Plug 'tpope/vim-fugitive'           "Git wrapper
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'       "shows git diff in the sign column
" Plug 'itchyny/lightline.vim'        "lightline status bar
" Plug 'ap/vim-buftabline'            "Tab line - to use with light line
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
" Plug 'dense-analysis/ale'
Plug 'scrooloose/syntastic'
" Plug 'majutsushi/tagbar'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'yggdroot/indentline'
Plug 'vim-scripts/indentpython.vim'
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'           "closes html tags
Plug 'preservim/vim-markdown'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" TODO: python, folding, shada

" ------------
"  Appearance
" ------------

filetype plugin indent on
filetype on
syntax on
set laststatus=2    "always show the status bar
set t_Co=256        "enable 256 colours
set t_ut=
set number
colorscheme evening

set updatetime=100
" set signcolumn 

" -------------------
"  Files and Editing
" -------------------

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
" set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType jinja.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({
                \ "f'" : "'",
                \ "r'" : "'",
                \ "b'" : "'"
                \ })

" --------------
"  Key Mappings
" --------------

" Relative numbering
nnoremap <silent><leader>r :set relativenumber!<cr>

" copy, cut and paste
vnoremap <C-c> "+y
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

" word movement using arrow keys
inoremap <S-Left> <Esc>bi
nnoremap <S-Left> b
inoremap <S-Right> <Esc><Right>wi
nnoremap <S-Right> w

" indent/unindent with tab/shift-tab
nnoremap <Tab> >>
nnoremap <S-tab> <<
inoremap <S-Tab> <Esc><<i
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" NerdTree
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" -----------------
"  Plugin Settings
" -----------------


" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Indentline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1

" gitgutter
let g:gitgutter_signs = 1
" let g:gitgutter_highlight_lines = 1
