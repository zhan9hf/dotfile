" vim: set foldmethod=marker foldlevel=0 nomodeline:
" =============================================================================
" .vimrc of zhanghaifeng {{{
" =============================================================================

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let mapleader      = ' '
let maplocalleader = ' '

" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

silent! if plug#begin('~/.vim/bundle')

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

Plug 'mhinz/vim-startify'
Plug 'chrisbra/unicode.vim', {'on': ['UnicodeName', 'UnicodeTable']}

" -----------------------------------------------------------------------------
" Edit
" -----------------------------------------------------------------------------
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

" -----------------------------------------------------------------------------
" Browsing
" -----------------------------------------------------------------------------
Plug 't9md/vim-choosewin'
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/clever-f.vim'

" -----------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'

" -----------------------------------------------------------------------------
" Lang
" -----------------------------------------------------------------------------
" Decompile Java class files using CFR.
" Requires curl to download CFR JAR file.
Plug 'jrubber/cfr.vim'
Plug 'mhinz/vim-rfc'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
endif
" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

" -----------------------------------------------------------------------------
" encoding
" -----------------------------------------------------------------------------
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8 fileformats=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
silent! set number relativenumber background=dark nowrap guioptions=
silent! set ruler laststatus=2 showmode cursorline colorcolumn=80 cmdheight=2
silent! set list scrolloff=5 t_ti= t_te= shortmess+=c
silent! set mouse=a mousehide helplang=cn
if has('gui_running') | set guifont=Monaco:h13 | else | set t_Co=256 | endif
if (has("termguicolors"))
  set termguicolors
endif

" https://github.com/neovim/neovim/issues/2897#issuecomment-115464516
let g:terminal_color_0 = '#4e4e4e'
let g:terminal_color_1 = '#d68787'
let g:terminal_color_2 = '#5f865f'
let g:terminal_color_3 = '#d8af5f'
let g:terminal_color_4 = '#85add4'
let g:terminal_color_5 = '#d7afaf'
let g:terminal_color_6 = '#87afaf'
let g:terminal_color_7 = '#d0d0d0'
let g:terminal_color_8 = '#626262'
let g:terminal_color_9 = '#d75f87'
let g:terminal_color_10 = '#87af87'
let g:terminal_color_11 = '#ffd787'
let g:terminal_color_12 = '#add4fb'
let g:terminal_color_13 = '#ffafaf'
let g:terminal_color_14 = '#87d7d7'
let g:terminal_color_15 = '#e4e4e4'

" -----------------------------------------------------------------------------
" Edit
" -----------------------------------------------------------------------------
silent! set shiftwidth=4 expandtab tabstop=4 softtabstop=4
silent! set nofoldenable foldlevel=2 foldmethod=indent
silent! set backspace=indent,eol,start formatoptions=cmMj
silent! set tags=tags,./tags
silent! set clipboard=unnamed clipboard+=unnamedplus
silent! set hidden

" -----------------------------------------------------------------------------
" Search
" -----------------------------------------------------------------------------
silent! set ignorecase smartcase incsearch hlsearch magic

" -----------------------------------------------------------------------------
" Command
" -----------------------------------------------------------------------------
silent! set wildmenu wildmode=list:longest
silent! set wildignore=*.~,*.?~,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock,*.DS_Store
silent! set wildignore+=.hg,.git,.svn
" silent! set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
silent! set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.manifest

" -----------------------------------------------------------------------------
" Performance
" -----------------------------------------------------------------------------
silent! set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 lazyredraw

" -----------------------------------------------------------------------------
" Bell
" -----------------------------------------------------------------------------
silent! set noerrorbells visualbell t_vb=

" -----------------------------------------------------------------------------
" Tmp file
" -----------------------------------------------------------------------------
" silent! set backupdir=/tmp//,. directory=/tmp//,. undodir=/tmp//,.
silent! set nobackup nowritebackup
" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------

" Save
nnoremap <leader>w :w<cr>
" Quit
nnoremap <leader>q :q<cr>
nnoremap Q :qa!<cr>
" Make Y behave like other capitals
nnoremap Y y$

" ----------------------------------------------------------------------------
" Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" ----------------------------------------------------------------------------
" Moving lines
" ----------------------------------------------------------------------------
xnoremap < <gv
xnoremap > >gv

" ----------------------------------------------------------------------------
" <leader>c Close quickfix/location window
" ----------------------------------------------------------------------------
nnoremap <leader>c :cclose<bar>lclose<cr>

" }}}
" ============================================================================
" PLUGINS {{{
" ============================================================================

" ----------------------------------------------------------------------------
" colorscheme
" ----------------------------------------------------------------------------
if has_key(g:plugs, 'gruvbox')
  colorscheme gruvbox
endif

" ----------------------------------------------------------------------------
" vim-startify
" ----------------------------------------------------------------------------
if has_key(g:plugs, 'vim-startify')
  let g:startify_change_to_vcs_root = 1
  let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ ]
endif

" -----------------------------------------------------------------------------
" nvim-colorizer.lua
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'nvim-colorizer.lua')
lua <<EOF
  require'colorizer'.setup({ "*" }, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })
EOF
endif

" -----------------------------------------------------------------------------
" Comment.nvim
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'Comment.nvim')
  lua require('Comment').setup()
endif

" -----------------------------------------------------------------------------
" nvim-autopairs
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'nvim-autopairs')
  lua require('nvim-autopairs').setup{}
endif

" -----------------------------------------------------------------------------
" indent-blankline.nvim
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'indent-blankline.nvim')
lua <<EOF
  require('indent_blankline').setup {
    use_treesitter = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = { 'help', 'packer', 'startify' },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
EOF
endif

" -----------------------------------------------------------------------------
" vim-choosewin
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'vim-choosewin')
  nmap - <Plug>(choosewin)
endif

" -----------------------------------------------------------------------------
" vim-maximizer
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'vim-maximizer')
  nnoremap <leader>z :MaximizerToggle!<CR>
endif

" -----------------------------------------------------------------------------
" fzf
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'fzf.vim')
  if has('nvim') || has('gui_running')
    let $FZF_DEFAULT_OPTS .= ' --inline-info'
  endif

  " Hide statusline of terminal buffer
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

  command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

  nnoremap <silent> <leader>ff        :Files<CR>
  nnoremap <silent> <leader>fb        :Buffers<CR>
  command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)
  nnoremap <silent> <leader>fg       :Ag <C-R><C-W><CR>
  nnoremap <silent> <leader>fG       :Ag <C-R><C-A><CR>
  xnoremap <silent> <leader>fg       y:Ag <C-R>"<CR>
  nnoremap <silent> <leader>fm        :Maps<CR>

  inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  function! s:plug_help_sink(line)
    let dir = g:plugs[a:line].dir
    for pat in ['doc/*.txt', 'README.md']
      let match = get(split(globpath(dir, pat), "\n"), 0, '')
      if len(match)
        execute 'tabedit' match
        return
      endif
    endfor
    tabnew
    execute 'Explore' dir
  endfunction

  command! PlugHelp call fzf#run(fzf#wrap({
        \ 'source': sort(keys(g:plugs)),
        \ 'sink':   function('s:plug_help_sink')}))
endif

" -----------------------------------------------------------------------------
" nvim-treesitter
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'nvim-treesitter')
lua <<EOF
  require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = { enable = true },
    incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = "<Tab>", -- normal mode
        node_incremental = "<Tab>", -- visual mode
        node_decremental = "<S-Tab>", -- visual mode
      },
    },
    indent = { enable = true, disable = { "python" } },
    -- indent = { enable = false },
    -- extensions
    rainbow = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    autotag = {
      enable = true,
      filetypes = {
        'xml', 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
      }
    },
    matchup = { enable = true },
  }
EOF
endif

" -----------------------------------------------------------------------------
" coc.nvim
" -----------------------------------------------------------------------------
if has_key(g:plugs, 'coc.nvim')
  augroup CocConfig
    autocmd!
    autocmd VimEnter * if !argc() | Startify | call CocActionAsync('runCommand', 'explorer') | endif
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'coc-explorer') |
          \ q | endif
    autocmd FileType coc-explorer setl statusline=coc-explorer
  augroup end
  nnoremap <leader>e :CocCommand explorer<CR>

  let g:coc_global_extensions = ['coc-git', 'coc-explorer', 'coc-yank', 'coc-highlight']
endif

if has_key(g:plugs, 'nvim-lspconfig')
  let g:coq_settings = {"auto_start": v:true, "keymap.pre_select": v:true}
lua <<EOF
  local lsp = require "lspconfig"
  local coq = require "coq"
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  end

  lsp.gopls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.jdtls.setup{coq.lsp_ensure_capabilities{
    cmd = { 'jdtls' },
    capabilities = capabilities,
    on_attach = on_attach,
  }}
  lsp.diagnosticls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.jsonls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.bashls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.lemminx.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.yamlls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.dockerls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.html.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.sqls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
  lsp.vimls.setup{coq.lsp_ensure_capabilities{on_attach = on_attach}}
EOF
endif


" ============================================================================
" AUTOCMD {{{
" ============================================================================
augroup DockerfileTypeSet
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
augroup end

augroup FileTypeSet
  autocmd!
  autocmd FileType markdown,text setlocal wrap
  autocmd FileType yaml,vim setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup end

augroup UnsetPaste
  autocmd!
  autocmd InsertLeave * silent! set nopaste
augroup end

augroup RememberPosition
  autocmd!
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup end

" -----------------------------------------------------------------------------
" Help in new tabs
" -----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
augroup HelpInNewTab
  autocmd!
  autocmd BufEnter *.txt call s:helptab()
augroup end

" }}}
