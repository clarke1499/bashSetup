set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-surround'

Plugin 'majutsushi/tagbar'

Plugin 'Yggdroot/indentline'
" "Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab number
set clipboard^=unnamed,unnamedplus laststatus=2 noshowmode colorcolumn=81
set background=dark incsearch modeline
highlight ColorColumn ctermbg=grey
highlight Search cterm=NONE ctermbg=blue ctermfg=grey
imap <C-e> <Esc>A
imap <C-a> <Esc>I
let NERDTreeNodeDelimiter = "\t"
let g:indentLine_enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:NERDCustomDelimiters = { 'arm': { 'left': ';'} }
let g:NERDAltDelims_c = 1
let g:ycm_extra_conf_globlist = ['~/*']
"let g:airline_powerline_fonts = 1
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1

"inoremap " ""<left>
"inoremap "" ""
"inoremap ' ''<left>
"inoremap '' ''
"inoremap ( ()<left>
"inoremap () ()
"inoremap [ []<left>
"inoremap [] []
"inoremap { {}<left>
"inoremap {} {}
"inoremap {<cr> {<cr><cr>}<Esc>ki

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <cr> i<cr><Esc>
nnoremap <cr><cr> o<Esc>
nnoremap <S-t> 02d<right>
nnoremap <F9> :NERDTreeToggle<CR>
"nnoremap <C-l> :Files<CR>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nmap <C-_> <Plug>NERDCommenterComment
vmap <C-_> <Plug>NERDCommenterComment
nmap <C-t> <Plug>NERDCommenterUncomment
vmap <C-t> <Plug>NERDCommenterUncomment
nmap <C-y> <Plug>NERDCommenterAltDelims
nmap <F8> :TagbarOpenAutoClose<CR>

au BufRead,BufNewFile *.pl,*.p set filetype=prolog

"xnoremap <C-t> I//<Esc><Esc>

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
