call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-jp/syntax-vim-ex'
Plug 'wellle/targets.vim'
Plug 'vim-test/vim-test'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ervandew/supertab'




" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background=1

colorscheme gruvbox8
set mouse=a
hi Visual cterm=none ctermbg=darkgrey ctermfg=cyan
set clipboard+=unnamedplus
" setup ALE linters and fixers
let g:ale_markdown_pandoc_options = '-f gfm -t gfm --wrap=none -s -'
let g:ale_linters = { '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop','reek'],
      \   'eruby': ['erblint'],
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['prettier'],
      \   'css': ['prettier'],
      \   'markdown': ['prettier'], }
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'ruby': ['rubocop'],
      \   'css': ['prettier'],
      \   'javascript': ['prettier'],
      \   'eruby': ['erblint'],
      \   'markdown': [ 'prettier'],
      \   'sql':  ['pgformatter']}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let mapleader=" "
nnoremap <silent><Leader>ff :Files<CR>
nnoremap <silent><Leader>fb :Buffers<CR>
nnoremap <silent><Leader>fh :History<CR>
nnoremap <silent><Leader>fr :Rg<CR>
set path=.,~,$PWD/**

let s:VimOSCYankPostRegisters = ['', '+', '*']
    function! s:VimOSCYankPostCallback(event)
        if a:event.operator == 'y' && index(s:VimOSCYankPostRegisters, a:event.regname) != -1
            call OSCYankRegister(a:event.regname)
        endif
    endfunction
    augroup VimOSCYankPost
        autocmd!
        autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
    augroup END
