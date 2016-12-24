" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set nocompatible  " be iMproved, required (by vundle)
filetype off " required (by vundle)

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/vim80/bundle/Vundle.vim
call vundle#begin('/usr/share/vim/vim80/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-fireplace'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'shiraeeshi/grep' " Plugin 'yegappan/grep'
Plugin 'leafgarland/typescript-vim'
Plugin 'jewes/Conque-Shell'

call vundle#end() " required
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on " required
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/pim/.vimundo

" It hides buffers instead of closing them. 
set hidden
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set pastetoggle=<F2> " pressing F2 will disable autoformatting when pasting

" ,ne to toggle nerdtree
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
" to find and grep what's in buffer
nnoremap <leader>s :exec ':! find . -name "*.' . expand('%:e') . '" -exec grep -H "<C-R>0" {} \;'
" ,/ to clear highlighted search
nmap <silent> ,/ :nohlsearch<CR>
" when you forgot to sudo before editing
cmap w!! w !sudo tee % >/dev/null 

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype scala setlocal ts=2 sw=2 expandtab
autocmd Filetype clj setlocal ts=2 sw=2 showmatch expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

" ctrlp-related setting
set runtimepath^=/usr/share/vim/vim80/bundle/ctrlp.vim

" The default setting of 'laststatus' is for the statusline to not appear
" until a split is created. If you want it to appear all the time, add the
" following to your vimrc: set laststatus=2
"set laststatus=2

" ctrl-^ to switch to cyrillic
set keymap=russian-jcukenwin  
set iminsert=0  
set imsearch=0  
highlight lCursor guifg=NONE guibg=Cyan

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

