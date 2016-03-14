set number              " line numbers
set smartindent         " indent new lines
set tabstop=4           " standard tabstop
set softtabstop=4       " 4 spaces for tab (python) 
set expandtab           " use spaces (softtabstop)
set shiftwidth=4        " indent width for auto indent
syntax on


" UI OPTIONS
"" set background=dark     " visual
"" colorscheme {name}
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set colorcolumn=80      " set max character guide for python via PEP8

" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level


" MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ disable
nnoremap $ <nop>
nnoremap ^ <nop>


" ADDITIONAL KEYBINDINGS
let mapleader=","       " leader is comma
" jk is escape  -- change to CapsLk likely
inoremap jk <esc>
" save session -- restore with 'vim -S'
nnoremap <leader>s :mksession<CR>

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" PATHOGEN CONFIG
execute pathogen#infect()
filetype plugin indent on

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

""augroup configgroup
""    autocmd!
""    autocmd VimEnter * highlight clear SignColumn
""    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
""                \:call <SID>StripTrailingWhitespaces()
""    autocmd FileType java setlocal noexpandtab
""    autocmd FileType java setlocal list
""    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
""    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
""    autocmd FileType php setlocal expandtab
""    autocmd FileType php setlocal list
""    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
""    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
""    autocmd FileType ruby setlocal tabstop=2
""    autocmd FileType ruby setlocal shiftwidth=2
""    autocmd FileType ruby setlocal softtabstop=2
""    autocmd FileType ruby setlocal commentstring=#\ %s
""    autocmd FileType python setlocal commentstring=#\ %s
""    autocmd BufEnter *.cls setlocal filetype=java
""    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
""    autocmd BufEnter Makefile setlocal noexpandtab
""    autocmd BufEnter *.sh setlocal tabstop=2
""    autocmd BufEnter *.sh setlocal shiftwidth=2
""    autocmd BufEnter *.sh setlocal softtabstop=2
""augroup END

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
