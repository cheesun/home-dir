set t_Co=256
set nocompatible
set number
colorscheme slate


" status line
set laststatus=2 " always show

" Vundle - vim bundler
" first run: git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" Core bundles
Plugin 'xolox/vim-misc'
"Plugin 'taglist.vim'
"Plugin 'easytags.vim'
Plugin 'SuperTab-continued.'
Plugin 'basilgor/vim-autotags'

Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'

" Tryout bundles
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'

"Plugin 'nathanaelkane/vim-indent-guides.git'

Plugin 'Yggdroot/indentLine'

" Tabs
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" Whitespace highlighting
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * call DeleteTrailingWS()
" autocmd BufWrite *.py call DeleteTrailingWS()

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" Mark the 80th column
set colorcolumn=80

" Ruby & Rails autocomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Shortcut keys
nnoremap <silent> <C-L> :TagbarToggle<CR>

" statusline config
let g:airline_powerline_fonts=1

" macvim/guivim settings
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

syntax on
syntax enable
filetype off
filetype plugin indent on

" coffeescript tags
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
