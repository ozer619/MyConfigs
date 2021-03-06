syntax on

set inccommand=split
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set completeopt-=preview
set clipboard+=unnamedplus
set spelllang=en
set spell
set statusline=%F               " Path to the file
set statusline+=%=              " Switch to the right side
set statusline+=col:\ %c,       " Current column
set statusline+=\ line:\ %l     " Current line
set statusline+=/               " Separator
set statusline+=%L              " Total lines



"
"
" Give more space for displaying messages.
set cmdheight=2
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
" Having longer update time (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'preservim/nerdtree'
Plug 'rip-rip/clang_complete'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'rhysd/vim-clang-format'
Plug 'preservim/tagbar'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()
set background=dark
colorscheme molokai

hi Normal ctermbg=NONE guibg=NONE

let g:ycm_min_num_of_chars_for_completion = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:clang_library_path='/usr/lib64/libclang.so.3.8'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0


nnoremap <leader>fb :lua require('telescope.builtin').file_browser()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pf :NERDTree<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gp :Git push<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun


