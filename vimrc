" Don't try to support vi
set nocompatible

set encoding=utf-8 " default character encoding

" Set leader keys before anything else
let mapleader      = " "
let maplocalleader = ","

filetype off
call plug#begin()
Plug 'edsono/vim-matchit'
Plug 'scrooloose/syntastic'
" Plug 'drmingdrmer/xptemplate'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'kana/vim-smartinput'
Plug 'jgdavey/vim-blockle'
Plug 'itchyny/lightline.vim'
" Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'ElmCast/elm-vim'

Plug 'itchyny/landscape.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'

if executable('fzf')
  Plug 'junegunn/fzf' " Don't do any post installation, fzf is in the system
  Plug 'junegunn/fzf.vim'
endif
call plug#end()

" all configuration options are in plugin files
" check .vim/plugin directory.
filetype plugin indent on
