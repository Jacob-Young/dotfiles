" --------------------------------------------------
"  Author               : thebearjew <Jacob Young>
"  Created On           : August 4th, 2015
"  Converted to Vim by  : Daniel Awai
"  Forked from          : martin-svk/dot-files
" --------------------------------------------------

" Auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" 1.0 Plug List
" ==================================================

" --------------------------------------------------
" 1.1 General tools - linters, formatting, etc.
" --------------------------------------------------

Plug 'benekastah/neomake', { 'on': ['Neomake'] }
" Autocomplete
Plug 'Shougo/deoplete.nvim'
" Automatically closing pair stuff
Plug 'cohama/lexima.vim'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" CamelCase and snake_case motions
Plug 'bkad/CamelCaseMotion'
" Heuristically set indent settings
Plug 'tpope/vim-sleuth'

" --------------------------------------------------
" 1.2 JavaScript
" --------------------------------------------------

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'mxw/vim-jsx'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" JSON syntax
Plug 'sheerun/vim-json'
" Autocomplete (npm install -g tern)
Plug 'carlitux/deoplete-ternjs'
" Autocomplete using flow (npm install -g flow-bin)
Plug 'steelsojka/deoplete-flow'
" JS Documentation comments
Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }

" --------------------------------------------------
" 1.3 HTML/CSS
" --------------------------------------------------

" HTML5 syntax
Plug 'othree/html5.vim'
" SCSS syntax
Plug 'cakebaker/scss-syntax.vim'
" Color highlighter
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx', 'vim'] }

" --------------------------------------------------
" 1.4 Other languages
" --------------------------------------------------

" Elixir syntax
Plug 'elixir-lang/vim-elixir'
" Yaml indentation
Plug 'martin-svk/vim-yaml'
" Markdown syntax
Plug 'tpope/vim-markdown'
" Git syntax
Plug 'tpope/vim-git'
" Tmux syntax
Plug 'keith/tmux.vim'
" Dockerfile
Plug 'honza/dockerfile.vim'

" --------------------------------------------------
" 1.5 Unite fuzzy searcher
" --------------------------------------------------

" Unite files, buffers, etc. sources
Plug 'Shougo/unite.vim'
" Outline source
Plug 'Shougo/unite-outline'
" History/yank source
Plug 'Shougo/neoyank.vim'
" Tag source
Plug 'tsukkee/unite-tag'
" Ag wrapper (Unite grep alternative) search and edit
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }

" --------------------------------------------------
" 1.6 Interface improving
" --------------------------------------------------

" Nerdtree file browser
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
" Lightline (simple status line)
Plug 'itchyny/lightline.vim'
" Buffers tabline
Plug 'ap/vim-buftabline'

" --------------------------------------------------
" 1.7 External tools - integration plugins
" --------------------------------------------------

" Git changes showed on line numbers
Plug 'airblade/vim-gitgutter'
" REST Console
Plug 'diepm/vim-rest-console', { 'for': 'rest' }

" --------------------------------------------------
" 1.8 Text insertion/manipulation
" --------------------------------------------------

" Surround (cs"')
Plug 'tpope/vim-surround'
" Easy text alignment
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
" Titlecase motion (gt)
Plug 'christoomey/vim-titlecase'

" --------------------------------------------------
" 1.9 Other tools
" --------------------------------------------------

" Easily expand selected region
Plug 'terryma/vim-expand-region'
" Intelligent buffer closing
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

call plug#end()

" ==================================================
" 2.0 Basic settings
"   (Neovim defaults: https://neovim.io/doc/user/vim_diff.html
"   #nvim-option-defaults)
" ==================================================

set shell=/bin/zsh                          " Setting shell to zsh
set number                                  " Line numbers on
set showmode                                " Always show mode
set showcmd                                 " Show commands as you type them
set cmdheight=1                             " Command line height
set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
set lazyredraw                              " Don't redraw while executing macros (better performance)
set showmatch                               " Show matching brackets when text indicator is over them
set matchtime=2                             " How many tenths of a second to blink when matching brackets
set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers
set virtualedit=block                       " To be able to select past EOL in visual block mode
set nojoinspaces                            " No extra space when joining a line which ends with . ? !
set scrolloff=5                             " Scroll when closing to top or bottom of the screen
set updatetime=1000                         " Update time used to create swap file or other things
set suffixesadd+=.js,.rb                    " Add js and ruby files to suffixes

" --------------------------------------------------
" 2.1 Split settings (more natural)
" --------------------------------------------------

set splitbelow                              " Splitting a window will put the new window below the current
set splitright                              " Splitting a window will put the new window right of the current

" --------------------------------------------------
" 2.2 Timeout settings
" --------------------------------------------------
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely. (by Steve Losh)
set notimeout
set ttimeout
set ttimeoutlen=10

" --------------------------------------------------
" 2.3 Spelling settings
" --------------------------------------------------

set spellfile=~/.config/nvim/dictionary.utf-8.add
set spelllang=en_us                         " Set language to US English
set nospell                                 " Disable checking by default (use <F4> to toggle)

" --------------------------------------------------
" 2.4 Search settings
" --------------------------------------------------

set ignorecase                              " Ignore case by default
set smartcase                               " Make search case sensitive only if it contains uppercase letters
set wrapscan                                " Search again from top when reached the bottom
set nohlsearch                              " Don't highlight after search

" --------------------------------------------------
" 2.5 Persistent undo settings
" --------------------------------------------------

if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

" --------------------------------------------------
" 2.6 White characters settings
" --------------------------------------------------

set list                                    " Show listchars by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪

" --------------------------------------------------
" 2.7 Filetype settings
" --------------------------------------------------

filetype plugin on
filetype indent on

" --------------------------------------------------
" 2.8 Folding settings
" --------------------------------------------------

set foldmethod=marker                       " Markers are used to specify folds.
set foldlevel=2                             " Start folding automatically from level 2
set fillchars="fold: "                      " Characters to fill the statuslines and vertical separators

" --------------------------------------------------
" 2.9 Omni completion settings
" --------------------------------------------------

set completeopt-=preview                    " Don't show preview scratch buffers
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**

" --------------------------------------------------
" 2.10 Neovim specific settings
" --------------------------------------------------

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1         " Set an environment variable to use the t_SI/t_EI hack
let g:loaded_python_provider=1              " Disable python 2 interface
let g:python_host_skip_check=1              " Skip python 2 host check
let g:python3_host_prog='/usr/local/bin/python3'  " Set python 3 host program

" ==================================================
" 3.0 Mapping settings
" ==================================================

" 3.1 Setting leader
" -----------------------------------------------------
let g:mapleader=","

" -----------------------------------------------------
" 3.2 Disabling arrow keys, space key, exmode enter
" with Q key, help with F1, etc.
" -----------------------------------------------------
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>
nnoremap <bs> <NOP>
nnoremap <delete> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
nnoremap <Space> <NOP>
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
nnoremap Q <NOP>

" -----------------------------------------------------
" 3.3 Vim defaults overriding
" -----------------------------------------------------

" Easier window switching
" nmap <silent> <C-w><C-w> :call utils#intelligentCycling()<CR>
nnoremap <BS> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Native Neovim terminal switching
tnoremap <Esc> <C-\><C-n>
" tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap j gj
nnoremap k gk
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" After block yank and paste, move cursor to the end of operated text and don't override register
vnoremap y y`]
vnoremap p "_dP`]
nnoremap p p`]

" Use CamelCaseMotion instead of default motions
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" Fix the cw at the end of line bug default vim has special treatment (:help cw)
nmap cw ce
nmap dw de

" Uppercase word in insert mode
inoremap <C-u> <ESC>mzgUiw`za

" Matching brackets with TAB (using matchit) (Breaks the <C-i> jump)
map <TAB> %
silent! unmap [%
silent! unmap ]%

" Don't cancel visual select when shifting
xnoremap <  <gv
xnoremap >  >gv

" Terminal mode mappings
if has('nvim')
  tnoremap <ESC> <C-\><C-n>
  tnoremap ,<ESC> <ESC>
endif

" Stay down after creating fold
vnoremap zf mzzf`zzz

" -----------------------------------------------------
" 3.4 Common tasks
" -----------------------------------------------------

" Quick save and close buffer
nnoremap <leader>s :w<CR>
nnoremap <silent> <leader>w :Sayonara!<CR>
nnoremap <silent> <leader>q :Sayonara<CR>

" Yank and paste from clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" CTags generation / navigation (:tselect to select from menu)
nnoremap ]t :tn<CR>
nnoremap [t :tp<CR>
nnoremap <leader>ts :ts<CR>
nnoremap <leader>tg :GTags<CR>

" QuickFix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Location list navigation
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

" Reselect last-pasted text
nnoremap gp `[v`]

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" [S]plit line (sister to [J]oin lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" Easier fold toggling
nnoremap <Space>z za

" Start substitute on current word under the cursor
nnoremap <Space>s :%s///gc<Left><Left><Left>

" Start search on current word under the cursor
nnoremap <Space>/ /<CR>

" Start reverse search on current word under the cursor
nnoremap <Space>? ?<CR>

" Faster sort
vnoremap <Space>s :!sort<CR>

" Fix spelling error on the go
inoremap <C-l> <C-g>u<ESC>[s1z=`]a<C-g>u

" -----------------------------------------------------
" 3.5 F-key actions
" -----------------------------------------------------

" NERDTree wrapper
nnoremap <silent> <Space>n :call utils#nerdWrapper()<CR>
" Free
" nnoremap <silent> <F2>
" Free
" nnoremap <silent> <F3>
" Toggle spelling
nnoremap <silent> <F4> :set spell!<CR> :set spell?<CR>
" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>
" Toggle search highlight
nnoremap <silent> <F6> :set nohlsearch!<CR> :set nohlsearch?<CR>
" Toggle white characters visibility
nnoremap <silent> <F7> :set list!<CR> :set list?<CR>
" New term buffer
nnoremap <silent> <F8> :terminal<CR>
" Fire REST Request
nnoremap <silent> <F9> :call VrcQuery()<CR>
" Free
" nnoremap <silent> <F10>
" Howdoi
nnoremap <silent> <F11> :call utils#howDoI()<CR>
" Informative echo
nnoremap <F12> :call utils#showToggles()<CR>

" -----------------------------------------------------
" 3.6 Window / Buffer management
" -----------------------------------------------------

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <S-Right> :call utils#intelligentVerticalResize('right')<CR>
nnoremap <silent> <S-Left> :call utils#intelligentVerticalResize('left')<CR>
nnoremap <silent> <S-Up> :resize +1<CR>
nnoremap <silent> <S-Down> :resize -1<CR>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" -----------------------------------------------------
" 3.7 Command abbreviations and mappings
" -----------------------------------------------------

" Quiting and saving all
cnoremap ww wqall
cnoremap qq qall

" -----------------------------------------------------
" 3.8 Custom commands and functions
" -----------------------------------------------------

" Generate tags definitions
command! GTags :call utils#generateCtags()

" Open notes
command! Notes :call utils#openNotes()

" Run current file
command! Run :call utils#runCurrentFile()
nnoremap <silent> ,r :Run<CR>

" Reformat whole or selection from file
command! Format :call utils#formatFile()
nnoremap <silent> ,f :Format<CR>

" Annotate file (show values in special # => comments)
command! Annotate :call utils#annotateFile()
nnoremap <silent> ,A :Annotate<CR>

" Profile
command! Profile :call utils#profile()

" Retab
command! Retab :call utils#retabToFourSpaces()

" ==================================================
" 4.0 Plugins settings
" ==================================================

" -----------------------------------------------------
" 4.1 Auto-switch sk -> en keyboard layouts
" -----------------------------------------------------
let g:utils_autoswitch_kb_layout=0

" -----------------------------------------------------
" 4.2 Unite
" -----------------------------------------------------

" Matcher settings
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_current_file'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Use ag if available
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C0'
  let g:unite_source_grep_recursive_opt=''

  " Set rec source command
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

" Custom profile
call unite#custom#profile('default', 'context', {
      \   'prompt': '» ',
      \   'winheight': 15,
      \ })

" Add syntax highlighting
let g:unite_source_line_enable_highlight=1

" Dont override status line
let g:unite_force_overwrite_statusline=0

" Custom unite menus
let g:unite_source_menu_menus = {}

" Utils menu
let g:unite_source_menu_menus.utils = {
      \     'description' : 'Utility commands',
      \ }
let g:unite_source_menu_menus.utils.command_candidates = [
      \       ['Run XMPFilter', 'Annotate'],
      \       ['Format file', 'Format'],
      \       ['Run file', 'Run'],
      \       ['Generate Ctags', 'GTags'],
      \       ['Show notes', 'Notes'],
      \     ]

" Git menu
let g:unite_source_menu_menus.git = {
      \     'description' : 'Git commands',
      \ }
let g:unite_source_menu_menus.git.command_candidates = [
      \       ['Stage hunk', 'GitGutterStageHunk'],
      \       ['Unstage hunk', 'GitGutterRevertHunk'],
      \       ['Stage', 'Gwrite'],
      \       ['Status', 'Gstatus'],
      \       ['Diff', 'Gvdiff'],
      \       ['Commit', 'Gcommit --verbose'],
      \       ['Revert', 'Gread'],
      \       ['Log', 'Glog'],
      \       ['Visual log', 'Gitv'],
      \       ['Current file visual log', 'Gitv!'],
      \     ]

" Plug menu
let g:unite_source_menu_menus.plug = {
      \     'description' : 'Plugin management commands',
      \ }
let g:unite_source_menu_menus.plug.command_candidates = [
      \       ['Install plugins', 'PlugInstall'],
      \       ['Update plugins', 'PlugUpdate'],
      \       ['Clean plugins', 'PlugClean'],
      \       ['Upgrade vim-plug', 'PlugUpgrade'],
      \     ]

" My unite menu
let g:unite_source_menu_menus.unite = {
      \     'description' : 'My Unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = [
      \       ['Unite MRUs', 'call utils#uniteMRUs()'],
      \       ['Unite buffers', 'call utils#uniteBuffers()'],
      \       ['Unite file browse', 'call utils#uniteFileBrowse()'],
      \       ['Unite file search', 'call utils#uniteFileRec()'],
      \       ['Unite history', 'call utils#uniteHistory()'],
      \       ['Unite line search', 'call utils#uniteLineSearch()'],
      \       ['Unite menu', 'call utils#uniteCustomMenu()'],
      \       ['Unite registers', 'call utils#uniteRegisters()'],
      \       ['Unite snippets', 'call utils#uniteSnippets()'],
      \       ['Unite sources', 'call utils#uniteSources()'],
      \       ['Unite file tags (symbols)', 'call utils#uniteOutline()'],
      \       ['Unite tags', 'call utils#uniteTags()'],
      \       ['Unite windows', 'call utils#uniteWindows()'],
      \       ['Unite yank history', 'call utils#uniteYankHistory()'],
      \       ['Unite jump history', 'call utils#uniteJumps()'],
      \     ]

" Tag source settings
let g:unite_source_tag_max_name_length=40
let g:unite_source_tag_max_fname_length=50

" -----------------------------------------------------
" 4.3 NERDTree
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" -----------------------------------------------------
" 4.4 Ultisnips settings
" -----------------------------------------------------
let g:UltiSnipsUsePythonVersion=3

" -----------------------------------------------------
" 4.5 Gitgutter settings
" -----------------------------------------------------
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_modified_removed='~'
let g:gitgutter_sign_removed_first_line='-'

" -----------------------------------------------------
" 4.6 Vim JSX highlighting settings
" -----------------------------------------------------
let g:jsx_ext_required=0

" -----------------------------------------------------
" 4.7 Lightline settings
" -----------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tab': {
      \   'active': [ 'filename' ],
      \   'inactive': [ 'filename' ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype', 'fileencoding', 'fileformat' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"HELP":&readonly?"RO":""}'
      \ },
      \ 'component_function': {
      \   'mode': 'utils#lightLineMode',
      \   'filename': 'utils#lightLineFilename',
      \   'filetype': 'utils#lightLineFiletype',
      \   'fileformat': 'utils#lightLineFileformat',
      \   'fileencoding': 'utils#lightLineFileencoding'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&readonly)'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" -----------------------------------------------------
" 4.8 Neomake settings
" -----------------------------------------------------
let g:neomake_verbose=0
let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }

" -----------------------------------------------------
" 4.9 Vim Markdown settings
" -----------------------------------------------------
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1

" -----------------------------------------------------
" 4.10 Vim REST console settings
" -----------------------------------------------------
let g:vrc_set_default_mapping=0
let g:vrc_output_buffer_name='__RESPONSE__.rest'

" -----------------------------------------------------
" 4.11 Deoplete autocomplete settings
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']

" -----------------------------------------------------
" 4.12 Ctrl-SF settings
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0

" -----------------------------------------------------
" 4.13 Plug settings
" -----------------------------------------------------
let g:plug_timeout=20

" -----------------------------------------------------
" 4.14 Vim-markdown settings
" -----------------------------------------------------
let g:markdown_fenced_languages=[
      \'bash=sh',
      \'git=gitconfig',
      \'javascript',
      \'lua',
      \'ruby',
      \'tmux',
      \'viml=vim',
      \'xdefaults',
      \'zsh']

" 4.15 Colorizer settings
" -----------------------------------------------------
let g:colorizer_nomap=1

" 4.16 JsDoc settings
" -----------------------------------------------------
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1

"" -----------------------------------------------------
"" 4.17 Deoplete-tern settings
"" -----------------------------------------------------
let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=1
""

"" -----------------------------------------------------
"" 4.18 vim-javascript settings
"" -----------------------------------------------------
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1
""

" ==================================================
" 5.0 Plugin mappings
" ==================================================

" -----------------------------------------------------
" 5.1 Unite and extensions
" -----------------------------------------------------

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <silent> <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent> <buffer> <C-k> <Plug>(unite_select_previous_line)
  " Runs 'splits' action by <C-s> and <C-v>
  imap <silent> <buffer> <expr> <C-s> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
  " Exit with escape
  nmap <silent> <buffer> <ESC> <Plug>(unite_exit)
  " Mark candidates
  vmap <silent> <buffer> m <Plug>(unite_toggle_mark_selected_candidates)
  nmap <silent> <buffer> m <Plug>(unite_toggle_mark_current_candidate)
endfunction

" Search files recursively ([o]pen file)
nnoremap <silent> <Space>o :call utils#uniteFileRec()<CR>
" Browse [f]iles in CWD
nnoremap <silent> <Space>f :call utils#uniteFileBrowse()<CR>
" [U]nite sources
nnoremap <silent> <Space>u :call utils#uniteSources()<CR>
" Search between open files - [b]uffers
nnoremap <silent> <Space>b :call utils#uniteBuffers()<CR>
" Search in current file ou[t]line (tags in current file)
nnoremap <silent> <Space>t :call utils#uniteTags()<CR>
" Search in [l]ines on current buffer
nnoremap <silent> <Space>l :call utils#uniteLineSearch()<CR>
" Search in [y]ank history
nnoremap <silent> <Space>y :call utils#uniteYankHistory()<CR>
" Search in outlines
nnoremap <silent> <Space>r :call utils#uniteOutline()<CR>
" Search in registers
nnoremap <silent> <Space>" :call utils#uniteRegisters()<CR>
" Search in opened [w]indow splits
nnoremap <silent> <Space>w :call utils#uniteWindows()<CR>
" Search in latest [j]ump positions
nnoremap <silent> <Space>j :call utils#uniteJumps()<CR>
" Search in my custom unite [m]enu with my commands
nnoremap <silent> <Space>m :call utils#uniteCustomMenu()<CR>
" Seach in help menu for commands
nnoremap <silent> <Space>hc :call utils#uniteCommands()<CR>
" Seach in help menu for mappings
nnoremap <silent> <Space>hm :call utils#uniteMappings()<CR>

" -----------------------------------------------------
" 5.2 Isolate
" -----------------------------------------------------

" -----------------------------------------------------
" 5.3 Gitgutter
" -----------------------------------------------------
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>

" -----------------------------------------------------
" 5.4 Expand region
" -----------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" -----------------------------------------------------
" 5.5 Vim Markdown
" -----------------------------------------------------
nmap [[ <Plug>Markdown_MoveToPreviousHeader
nmap ]] <Plug>Markdown_MoveToNextHeader

" -----------------------------------------------------
" 5.6 Deoplete autocomplete
" -----------------------------------------------------
" Insert <TAB> or select next match
inoremap <silent> <expr> <Tab> utils#tabComplete()

" Manually trigger tag autocomplete
inoremap <silent> <expr> <C-]> utils#manualTagComplete()

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

" -----------------------------------------------------
" 5.7 CtrlSF
" -----------------------------------------------------
nnoremap <leader>gg :CtrlSF<Space>
nnoremap <leader>gG :CtrlSFToggle<Space>

" -----------------------------------------------------
" 5.8 Vim-Plug
" -----------------------------------------------------
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>

" -----------------------------------------------------
" 5.9 Ctrl-SF
" -----------------------------------------------------
let g:ctrlsf_mapping = {
      \ "next"    : "n",
      \ "prev"    : "N",
      \ "quit"    : "q",
      \ "openb"   : "",
      \ "split"   : "s",
      \ "tab"     : "",
      \ "tabb"    : "",
      \ "popen"   : "",
      \ "pquit"   : "",
      \ "loclist" : "",
      \ }

nnoremap <silent> <leader>g :call utils#searchCurrentWordWithAg()<CR>

" -----------------------------------------------------
" 5.10 BufOnly -> [C]lose all
" -----------------------------------------------------
nnoremap <leader>C :Bonly<CR>

" -----------------------------------------------------
" 5.11 Tabularize -> [a]lign
" -----------------------------------------------------
vnoremap <leader>a :Tabularize /

" -----------------------------------------------------
" 5.12 JsDoc
" -----------------------------------------------------
nnoremap <leader>d :JsDoc<CR>

" ==================================================
" 6.0 Color and highlighting settings
" ==================================================

" Syntax highlighting
syntax on

" Color scheme
set background=dark
colorscheme base16-railscasts

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight term cursor differently
highlight TermCursor ctermfg=green guifg=green

" Listchars highlighting
highlight NonText ctermfg=8 guifg=gray
highlight SpecialKey ctermfg=8 guifg=gray

" Remove underline in folded lines
hi! Folded term=NONE cterm=NONE gui=NONE ctermbg=NONE

" Link highlight groups to improve buftabline colors
hi! link BufTabLineCurrent Identifier
hi! link BufTabLineActive Comment
hi! link BufTabLineHidden Comment
hi! link BufTabLineFill Comment

" 7.0 Autocommands
" ==================================================

" Keywordprg settings
autocmd FileType vim setlocal keywordprg=:help

" Turn spellcheck on for markdown files
autocmd BufNewFile,BufRead *.md setlocal spell

" Remove trailing whitespaces automatically before save
autocmd BufWritePre * call utils#stripTrailingWhitespaces()

" Resize splits when the window is resized
" autocmd VimResized * :wincmd =

" Make sure Vim returns to the same line when you reopen a file. Thanks, Amit and Steve Losh.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
autocmd CursorHold * if getcmdwintype() == '' | checktime | endif

" -----------------------------------------------------
" 7.1 Run linters after save
" -----------------------------------------------------

" npm install -g eslint
autocmd BufWritePost *.js Neomake eslint
" npm install -g jsonlint
autocmd BufWritePost *.json Neomake jsonlint
" sudo apt-get install elixir
autocmd BufWritePost *.ex Neomake elixir
" apt-get install tidy
autocmd BufWritePost *.html Neomake tidy-html5
" gem install mdl
autocmd BufWritePost *.md Neomake mdl

