inoremap <expr> <CR> InsertMapForEnter()

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

function! InsertMapForEnter()
  if pumvisible()
    return "\<C-y>"
  elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
    return "\<CR>\<Esc>O"
  elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
    return "\<CR>\<Esc>O"
  else
    return "\<CR>"
  endif
endfunction

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap

set nocompatible
set number
execute pathogen#infect()

let g:ale_linters = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_python_pylint_change_directory=0
let g:ale_python_auto_pipenv = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

let g:jsx_ext_required = 0
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
\ 'javascript.jsx' : 1,
\}

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Townk/vim-autoclose'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'matze/vim-move'
Plugin 'w0rp/ale'
Plugin 'Yggdroot/indentLine'
Plugin 'evanleck/vim-svelte'
call vundle#end()
filetype plugin indent on

