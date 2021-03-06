" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
scriptencoding utf-8
set encoding=utf-8
set shell=/bin/sh 

"------------------------
"VIMPLUG
"------------------------
" call plug#begin('~/.vim/plugged')
" Plug 'https://github.com/flazz/vim-colorschemes.git'
" " Plug 'https://github.com/vim-airline/vim-airline.git'
" " Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" Plug 'dracula/vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'https://github.com/tomtom/tcomment_vim.git'
" Plug 'https://github.com/raichoo/haskell-vim.git'
" Plug 'https://github.com/tomasr/molokai.git'
" Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
" Plug 'https://github.com/Yggdroot/indentLine.git'
" Plug 'https://github.com/owickstrom/vim-colors-paramount.git'
" Plug 'https://github.com/rust-lang/rust.vim.git'
" Plug 'https://github.com/xero/blaquemagick.vim'
" Plug 'https://github.com/xero/sourcerer.git'
" Plug 'https://github.com/w0ng/vim-hybrid.git'
" Plug 'https://github.com/AlxHnr/clear_colors.git'
" Plug 'https://github.com/xero/blaquemagick.vim.git'
" Plug 'https://github.com/joshdick/onedark.vim.git'
" Plug 'https://github.com/itchyny/lightline.vim.git'
" Plug 'https://github.com/Lokaltog/vim-powerline.git'
" Plug 'https://github.com/powerline/powerline.git'
" Plug 'https://github.com/powerline/powerline-fonts.git'
" Plug 'https://github.com/NLKNguyen/papercolor-theme.git'
" Plug 'https://github.com/rakr/vim-one.git'
" Plug 'https://github.com/i-tu/Hasklig.git'
" Plug 'https://github.com/wsdjeg/FlyGrep.vim.git'
" call plug#end()

"------------------------
"MISC
"------------------------
"Change leader key to space!
let mapleader=" "

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB
set expandtab
set shiftround
syntax enable
syntax on
set number
" Highlight search results
set hlsearch
set nowrap
" set foldcolumn=4

" endif
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '~/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

set clipboard=unnamed,unnamedplus

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.

" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

:set dictionary="/usr/dict/words"
:set noswapfile

filetype on
filetype indent on
filetype plugin on

let g:indentLine_char = '│'
"  of ¦, ┆, or │ t
" set listchars=eol:¬
" set list
" ,tab:>-,trail:~,extends:>,precedes:<

" let g:cpp_experimental_template_highlight = 1
" let g:cpp_class_scope_highlight = 1

" let g:LanguageClient_serverCommands = {
"     \ 'c': ['cquery'],
"     \ }

" "------------------------
" Haskell
"------------------------
let g:haskell_indent_if    = 4
let g:haskell_indent_case  = 4
let g:haskell_indent_let   = 4
" let g:haskell_indent_where = 4
let g:haskell_indent_where = 0
let g:haskell_indent_do    = 4
let g:haskell_indent_in    = 4
let g:cabal_indent_section = 4

"------------------------
" Keymapping
"------------------------
" set timeoutlen=1000 ttimeoutlen=0
" set laststatus=2
" imap jj <Esc>
nnoremap <Leader>r :%s/\s\+$//e<CR>
imap <C-l> λ

" Alt based shortcuts, uses Esc, thus some things, like visual mode, require
" pressing Esc twice it sees...
" map <M-k> {
" map <M-j> }
" :nnoremap <M-l> :bnext<CR>
" :nnoremap <M-h> :bprevious<CR>
" :tnoremap <M-l> <C-\><C-n>:bnext<CR>
" :tnoremap <M-h> <C-\><C-n>:bprevious<CR>

" tnoremap <ESC><ESC> <C-\><C-N>

nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
map <C-k> {
map <C-j> }

" Necronomicon execution
nnoremap <F5> :!cd ~/Source/Necronomicon && ~/Source/Necronomicon/result/build/necro %:p -jit -opt <CR>

:set wildignore+=*uasset,*.o,*.obj,*.meta,*.mat,*.hi,*.jpg,*.png,*.psd,*.controller,*.fbx,*.anim,*.unity,*.db,*.pdf,*.prefab,*.tif,**/.git/*,**/.svn/*,*.tga,*.dll,*.sln,*.zip,*.lnk,*.assets,*.bmp,*.TTF,*.apk,*.wavm,*.lib,*.dyn_hi,*.dyn_o,**/dist
:set ic

"Find .h or .cpp files
map <LEADER>f :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <LEADER>u :%s/\r/\r/g<CR>

let g:tcomment_opleader1 = '<Leader>c'
let g:tcomment_opleader2 = '<Leader>c'

"Paste without filling buffer
" xnoremap p pgvy

map <LEADER>h 0i<CR>//=====================================================<CR>Section<CR>=====================================================<CR><ESC>

"------------------------
" BUILDING
"------------------------
" map <LEADER>u :!build-bitrot.cmd<CR>
" map <LEADER>u :!cargo build<CR>
" map <LEADER>t :!cargo test<CR>
" map <LEADER>b :!cargo bench<CR>
" map <LEADER>h :!cargo check<CR>

"------------------------
" Splits
"------------------------
set splitright

nnoremap <LEADER>h :wincmd h<CR>
nnoremap <LEADER>j :wincmd j<CR>
nnoremap <LEADER>k :wincmd k<CR>
nnoremap <LEADER>l :wincmd l<CR>

"------------------------
" COLORSCHEME
"------------------------

" " Customize some colors in dracula
" colorscheme dracula
" hi Normal ctermbg=DarkGray guibg=#1B1F20
" hi Operator ctermfg=LightBlue guifg=#2EAfCf
" hi Delimiter ctermfg=LightGreen guifg=#00E080

" colorscheme dracula 

" colorscheme paramount
" colorscheme jellybeans
" let g:molokai_original = 1
" let g:rehash256 = 1
colorscheme molokai
" " let g:molokai_original = 1
" colorscheme jellybeans
" colorscheme wolfpack
" colorscheme muon
" colorscheme sky
" colorscheme inkpot
" :set cursorline
" colorscheme dracula
" colorscheme onedark
" colorscheme one
" colorscheme onehalfdark

" Make custom colorscheme?
" hi Normal ctermbg=None guibg=None guifg=#D0D0D0
" hi Operator ctermfg=DarkGrey guifg=#4070A0
"
" hi Delimiter ctermfg=White guifg=#10A0C0
" hi cCustomParen ctermfg=White guifg=#10A0C0
"
" hi Identifier gui=italic guifg=#406090
"
" hi cStorageClass guifg=#505060
" hi Structure guifg=#505060
" hi label guifg=#505060
" hi cInclude guifg=#505060
"
" hi cCustomClass guifg=#767676
" hi cType guifg=#767676
" hi Type guifg=#767676
" hi Normal guibg=#1F1F1F
" hi Normal ctermfg=None guibg=#1B1F20

"------------------------
" Fuzzy Find 
"------------------------

nnoremap <LEADER>t :FZF -i<CR>

"------------------------
" FlyGrep 
"------------------------
nnoremap <LEADER>g :FlyGrep<CR>
set grepprg=grep\ -niR\ $*\ /dev/null


"------------------------
" AIRLINE

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
"
" Always show statusline
" set laststatus=2

" Use 256 colours (Use this setting only if your  supports 256 colours)
set t_Co=256

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_sep = ''
" let g:airline_theme='lucius'
" let g:airline_theme='molokai'
" let g:airline_theme='dracula'
" let g:airline_theme='zenburn'
" let g:airline_theme='jellybeans'
" let g:airline_theme='serene'
" let g:airline_theme='simple'
" let g:airline_theme='sky'
" let g:airline_theme='onedark'
"
"
"--------------------------------------
" Lightline
"--------------------------------------
" let g:lightline = { 'colorscheme' : 'onedark', }
" let g:lightline.colorscheme = 'onedark'
let g:lightline = { 'colorscheme' : 'molokai', }

" let g:lightline = {
"         \ 'colorscheme' : 'onedark',
"         \ 'component': {
" 		\   'lineinfo': ' %3l:%-2v',
" 		\ },
" 		\ 'component_function': {
" 		\   'readonly': 'LightlineReadonly',
" 		\   'fugitive': 'LightlineFugitive'
" 		\ },
" 		\ 'separator': { 'left': '', 'right': '' },
" 		\ 'subseparator': { 'left': '', 'right': '' }
" 		\ }
" 	function! LightlineReadonly()
" 		return &readonly ? '' : ''
" 	endfunction
" 	function! LightlineFugitive()
" 		if exists('*fugitive#head')
" 			let branch = fugitive#head()
" 			return branch !=# '' ? ''.branch : ''
" 		endif
" 		return ''
" endfunction

" let g:lightline = {
"         \ 'colorscheme' : 'onedark',
" 		\ 'component': {
" 		\   'lineinfo': '⭡ %3l:%-2v',
" 		\ },
" 		\ 'component_function': {
" 		\   'readonly': 'LightlineReadonly',
" 		\   'fugitive': 'LightlineFugitive'
" 		\ },
" 		\ 'separator': { 'left': '⮀', 'right': '⮂' },
" 		\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
" 		\ }
" 	function! LightlineReadonly()
" 		return &readonly ? '⭤' : ''
" 	endfunction
" 	function! LightlineFugitive()
" 		if exists('*fugitive#head')
" 			let branch = fugitive#head()
" 			return branch !=# '' ? '⭠ '.branch : ''
" 		endif
" 		return ''
" endfunction
"
" Neovim-qt Guifont command, to change the font
" command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', <args>)
" Set font on start
" set guifont="Meslo LG S DZ for Powerline:h11
"

" -----------------------
" You Complete Me
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" -----------------------
" Chromatica

" let g:chromatica#libclang_path="CLANG_UNWRAPPED"
" let g:chromatica#enable_at_startup=1
" let g:chromatica#search_source_args=1
"
" let g:chromatica#dotclangfile_search_path = "./result/compile_commands.json"

" -----------------------
" cxxd

g:cxxd_compilation_db_discovery_dir_paths="~/Source/Necronomicon/result/compile_commands.json"

" -----------------------
" vim-lsp-cxx-highlight


" Configuration of vim-lsp to use cquery and ccls with vim-lsp

" also see https://github.com/prabirshrestha/vim-lsp/wiki/Servers-cquery
"
" cquery always requires these options
" highlight.enabled = true
" emitInactiveRegions = true
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {
      \   'cacheDirectory': '/path/to/cquery/cache',
      \   'highlight': { 'enabled' : v:true },
      \   'emitInactiveRegions': v:true
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

" let g:lsp_cxx_hl_use_text_props = 1

    " cquery
    " also see https://github.com/autozimu/LanguageClient-neovim/wiki/cquery
    let s:cquery_settings = {
            \ 'cacheDirectory': '/var/cquery/',
            \ 'emitInactiveRegions': v:true,
            \ 'highlight': { 'enabled' : v:true },
            \ }

    let s:cquery_command = ['cquery', '-init=' . json_encode(s:cquery_settings)]

    let g:LanguageClient_serverCommands = {
        \ 'c': s:cquery_command,
        \ 'cpp': s:cquery_command,
        \ 'objc': s:cquery_command,
    \ }


" -----------------------
" coc.nvim

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
  " nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

" -----------------------
" Clamp

" let g:clamp_libclang_file = "CLANG_UNWRAPPED"
" let g:clamp_autostart = 1

" -----------------------
" Filetype commands

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set

autocmd FileType haskell :packadd haskell-vim
autocmd FileType haskell :packadd haskellSyntax
au BufRead,BufNewFile *.necro set filetype=elm
" autocmd FileType c :packadd c-vim
" autocmd FileType cpp :packadd cpp-vim
