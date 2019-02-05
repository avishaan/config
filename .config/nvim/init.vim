
" conditional helper https://github.com/junegunn/vim-plug/wiki/faq
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()

Plug 'easymotion/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'alvan/vim-closetag'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'
Plug 'dhruvasagar/vim-table-mode'
Plug 'nelstrom/vim-visual-star-search'
"TODO consider removing the below
Plug 'tpope/vim-ragtag'
"Plug 'tpope/vim-jdaddy'
Plug 'artnez/vim-wipeout'
Plug 'heavenshell/vim-jsdoc'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-obsession'
Plug 'metakirby5/codi.vim'

call plug#end()

" yank and paste into and from clipboard
" set clipboard=unnamed
" use jk in insert mode for esc stopped doing this because remote systems don't have this as a default and it becomes confusing
" inoremap jk <Esc>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cursorline
set cursorcolumn
set scrolloff=9
set mouse=a
" don't keep highlight after search
set hls!
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\zs\t/
" if file changes outside of vim, go ahead and update it, like @checkout
set autoread
" check file update when focus is gained
au FocusGained * :checktime
" stop line wrap/breaks
set nowrap
set number
" put swap files in different directory
set backupdir=./.backup,.,~/tmp
set directory=.,./.backup,~/tmp
set swapfile
set dir=./.swp,~/tmp
" word wrap/ line wrap
set wrap
" remove automatic commenting when moving to next line
au FileType * set fo-=c fo-=r fo-=o
:set showbreak=\ 
:set breakindent
:set diffopt+=vertical
" keep a longer history
set history=200
" code folding http://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim
set foldmethod=manual   
set foldnestmax=10
" set nofoldenable
set foldlevel=2
" relative absolute line number depending on which mode we are in
set relativenumber
" highlight all occurances of search
set hlsearch

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "omnifunc"
inoremap <expr> <c-j> pumvisible() ? '<C-n>' : 'j'
inoremap <expr> <c-k> pumvisible() ? '<C-p>' : 'k'
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
" airline
let g:airline_theme='one'
let g:airline_powerline_fonts = 1

" linter options ale
" temp issue, need to update to tmux 2.5 https://github.com/w0rp/ale/issues/511
" let g:ale_lint_on_text_changed = 'insert'
let g:ale_lint_delay = 400
let g:ale_lint_on_save = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
" let g:ale_sign_error = '😡'
" let g:ale_sign_warning = '😅'
let g:ale_linters = {
    \'python': ['mypy']}

" cursor change in insert mode
"neovim specific
if has('nvim')
  "try another python
  "let g:python_host_skip_check = 1
  "let g:python_host_prog = '/usr/bin/python'
  "let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'
  " fix cursor to change in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" tern settings
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 1
let g:python3_host_prog = '/usr/local/bin/python3'

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

" syntax
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings = 0
"
" vim-closetag
let g:closetag_filenames ="*.jsx,*.html,*.js"

" utilsnips
let g:UltiSnipsExpandTrigger='<c-j>' "c-tab isn't passed through in iterm2 for some reason
let g:UltiSnipsListSnippets='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsExpandTrigger="<s-tab>"

" vim-indent-guides
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_color_change_percent = 3

" nerdtree NERDTree
map <C-T> :NERDTreeToggle<CR>
" if nerdtree is last buffer, close it
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowBookmarks=0
" resize NERDTree window
let g:NERDTreeWinSize = 23
let NERDTreeIgnore = ['\.DS_Store$']
autocmd vimenter * if !argc() | NERDTree | endif
" ctrlp
" remap ctrp/ctrlp file refresh
let g:ctrlp_prompt_mappings = {
    \   'PrtCurRight()':   ['<right>'],
    \   'PrtClearCache()': ['<F8>', '<C-l>', '<C-r>'],
    \ }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|node_modules|bower_components|build|\.meteor|\.swp|\.ico)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ctrlp auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" git gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed= '-'
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes
let g:gitgutter_signs = 1
" highlight GitGutterAdd ctermfg=green
" highlight GitGutterChange ctermfg=yellow
" highlight GitGutterDelete ctermfg=red
" highlight GitGutterChangeDelete ctermfg=yellow

" tmux nav
" fix tmux issue specific to neovim https://github.com/christoomey/vim-tmux-navigator/issues/71
if has('nvim')
  nmap <BS> :<C-u>TmuxNavigateLeft<CR>
  nnoremap <M-h> :TmuxNavigateLeft<CR>
  nnoremap <M-j> :TmuxNavigateDown<CR>
  nnoremap <M-k> :TmuxNavigateUp<CR>
  nnoremap <M-l> :TmuxNavigateRight<CR>
else
  nmap <C-h> <C-w>h
  "use alt to move different window
  " works when iterm2 uses alt as +esc
  nnoremap <M-h> <C-W><C-H>
  nnoremap <M-j> <C-W><C-J>
  nnoremap <M-k> <C-W><C-K>
  nnoremap <M-l> <C-W><C-L>
  "allow the window nav to work in insert mode
  "inoremap <M-h> <Esc><C-W><C-H>
  "inoremap <M-j> <Esc><C-W><C-J>
  "inoremap <M-k> <Esc><C-W><C-K>
  "inoremap <M-l> <Esc><C-W><C-L>

endif

" vim-closetag
" let g:closetag_filenames ="*.jsx,*.html,*.js"

" vim-jsdoc config
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_shorthand=1
let g:jsdoc_param_description_separator=' - '
" make vim pretty via python via https://coderwall.com/p/faceag/format-json-in-vim
command! Prettyjson %!python -m json.tool

"BreakLine: Return TRUE if in the middle of {} or () in INSERT mode
fun! BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun
" Remap <Enter> to split the line and insert a new line in between if
" BreakLine return True
inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"
" silver search aka Ag
let g:ackprg = 'ag --nogroup --nocolor --column'
