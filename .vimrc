set t_Co=256
set nocompatible
set number
colorscheme slate


" status line
set laststatus=2 " always show

" Vundle - vim bundler
" first run: git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Core bundles
Bundle 'xolox/vim-misc'
"Bundle 'taglist.vim'
"Bundle 'easytags.vim'
Bundle 'SuperTab-continued.'
Bundle 'basilgor/vim-autotags'

Bundle 'rking/ag.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-bundler'
Bundle 'vim-ruby/vim-ruby'

" Tryout bundles
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'

"Bundle 'nathanaelkane/vim-indent-guides.git'

Bundle 'Yggdroot/indentLine'

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
