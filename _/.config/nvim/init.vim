let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.local/share/nvim/plugged')
  " UI plugins.
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'airblade/vim-gitgutter'

  " Themes
  Plug 'joshdick/onedark.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'atelierbram/base2tone-vim'
  Plug 'dracula/vim'

  " Handy utility plugins.
  Plug 'townk/vim-autoclose'
  Plug 'tpope/vim-fireplace'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ervandew/supertab'
  Plug 'ctrlpvim/ctrlp.vim'

  " Syntax highlighting
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'

  " Code completion.
  Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'shougo/neoinclude.vim'
  Plug 'zchee/deoplete-jedi'
  Plug 'rip-rip/clang_complete'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

" Disable the mode line. (Guard with conditional checking for airline?)
set noshowmode

" Display line numbers by default.
set number
set numberwidth=5

" Tweak the update frequency; useful for vim-gitgutter.
set updatetime=250

" Always use spaces for indentation — tabs are evil!
set expandtab

" Define default indentation settings.
set tabstop=4
set softtabstop=2
set shiftwidth=2

" colorscheme onedark
" let g:airline_theme = 'onedark'
" colorscheme Base2Tone_SpaceDark
" let g:airline_theme = 'Base2Tone_SpaceDark'
colorscheme tender
let g:airline_theme = 'tender'
" colorscheme dracula
" let g:airline_theme = 'dracula'
" colorscheme dracula
" let g:airline_theme = 'simple'

" let g:airline_powerline_fonts = 1
" let g:airline_symbols = []

let g:deoplete#enable_at_startup = 1
let g:clang_library_path = '/usr/lib/llvm-5.0/lib/libclang.so.1'
