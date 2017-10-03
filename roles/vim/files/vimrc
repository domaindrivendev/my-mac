set nocompatible

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
" ==========
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'

" General
" ==========
let mapleader=","
inoremap jk <ESC>
syntax enable
filetype plugin indent on
set statusline=%F\ %L\L
set laststatus=2

" Editor
" ==========
colorscheme monokai
set relativenumber
set wrap
set backspace=indent,eol,start
set completeopt=longest,menuone
set splitbelow
set splitright
set splitbelow
set splitright

" tabs and indents
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
map <leader>ev :e $MYVIMRC<cr>
map <leader>sv :source $MYVIMRC<cr>

" Search and Navigation
" ==========
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>sh :leftabove vnew<CR>
nnoremap <leader>sl :rightbelow vnew<CR>
nnoremap <leader>sk :leftabove new<CR>
nnoremap <leader>sj :rightbelow new<CR>

" nerdtree
nnoremap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeWinSize = 50
let g:NERDTreeShowHidden = 1

" ctrlP
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
autocmd BufWritePost * CtrlPClearCache

" ack
map <leader>sd Ack<cr>

" Ctags
set tags=./tags
let g:easytags_dynamic_files = 2
map <leader>gt :call RefreshGemTags()<cr> 

function! RefreshGemTags()
	let tagFile = getcwd() . '/gem.tags'
	let cmd = 'bundle show --paths | xargs ctags --language-force=ruby -R -f ' . tagFile
	let res = system(cmd)
	echomsg res
	echomsg 'Gem tags refreshed!'
endfunction

" Auto Completion
" ==========
let g:SuperTabCompletionType = 'context'

" Refactoring
" ==========
map <leader>fr *:%s//

" Rspec utils
let s:rspec_tmux_command = "tmux send -t 1 'be rspec --color --drb {spec}' Enter" 
"let s:rspec_tmux_command = "tmux send -t 1 'zeus test --color --drb {spec}' Enter" 
let g:rspec_command = "!echo " . s:rspec_tmux_command . " && " . s:rspec_tmux_command
map <Leader>rf :call RunCurrentSpecFile()<cr><c-L>
map <Leader>rn :call RunNearestSpec()<cr><c-L>
map <Leader>rl :call RunLastSpec()<cr><c-L>

" Rails Utils
map <leader>rr :RV<cr>
map <leader>ra :AV<cr>

nmap <leader>t :CtrlP<CR>
nmap <leader>q :q<CR>

" File type associations
au BufRead,BufNewFile *.hamljs set filetype=haml
au BufRead,BufNewFile *.thor set filetype=ruby
