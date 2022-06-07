" vim: set foldmethod=marker foldlevel=0 nomodeline:
" =============================================================================
" .vimrc of zhanghaifeng {{{
" =============================================================================

" **Now only for nvim**

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

let mapleader      = ' '
let maplocalleader = ' '

" }}}
" ============================================================================
" VIM-PLUG BLOCK {{{
" ============================================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

silent! if plug#begin('~/.config/nvim/bundle')

" -----------------------------------------------------------------------------
" Lib
" -----------------------------------------------------------------------------
Plug 'nvim-lua/plenary.nvim'

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------
Plug 'junegunn/seoul256.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'LunarVim/onedarker.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'mhinz/vim-startify'
Plug 'chrisbra/unicode.vim', {'on': ['UnicodeName', 'UnicodeTable']}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'itchyny/vim-cursorword'

" Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" -----------------------------------------------------------------------------
" Edit
" -----------------------------------------------------------------------------
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'brglng/vim-im-select'

" -----------------------------------------------------------------------------
" Browsing
" -----------------------------------------------------------------------------
Plug 't9md/vim-choosewin'
Plug 'szw/vim-maximizer'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/vim-slash'
Plug 'folke/which-key.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'gfanto/fzf-lsp.nvim'

" Plug 'kyazdani42/nvim-tree.lua'

" -----------------------------------------------------------------------------
" Git
" -----------------------------------------------------------------------------
" Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" -----------------------------------------------------------------------------
" Lang
" -----------------------------------------------------------------------------
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'mhinz/vim-rfc'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'

" -----------------------------------------------------------------------------
" Completion
" -----------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'github/copilot.vim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-calc'
Plug 'uga-rosa/cmp-dictionary'
Plug 'onsails/lspkind.nvim'

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

" }}}
" ============================================================================
" PLUGINS {{{
" ============================================================================

if !empty(glob('~/.config/nvim/bundle/gruvbox.nvim'))
  colorscheme gruvbox
  augroup update_bat_theme
    autocmd!
    autocmd colorscheme * call ToggleBatEnvVar()
  augroup end
  function ToggleBatEnvVar()
    if (&background == "light")
        let $BAT_THEME='gruvbox-light'
    else
        let $BAT_THEME='gruvbox-dark'
    endif
  endfunction
endif

if !empty(glob('~/.config/nvim/bundle/vim-startify'))
  let g:startify_change_to_vcs_root = 1
  let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
endif

if !empty(glob('~/.config/nvim/bundle/nvim-colorizer.lua'))
lua << EOF
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

if !empty(glob('~/.config/nvim/bundle/Comment.nvim'))
  lua require('Comment').setup()
endif

if !empty(glob('~/.config/nvim/bundle/nvim-autopairs'))
  lua require('nvim-autopairs').setup{}
endif

if !empty(glob('~/.config/nvim/bundle/indent-blankline.nvim'))
lua << EOF
  require("indent_blankline").setup {
    use_treesitter = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
      "startify",
      "dashboard",
      "dotooagenda",
      "log",
      "fugitive",
      "gitcommit",
      "packer",
      "vimwiki",
      "markdown",
      "json",
      "txt",
      "vista",
      "help",
      "todoist",
      "NvimTree",
      "peekaboo",
      "git",
      -- "TelescopePrompt",
      "undotree",
      "flutterToolsOutline",
      "coc-explorer",
      "" -- for all buffers without a file type
    },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
EOF
endif

if !empty(glob('~/.config/nvim/bundle/bufferline.nvim'))
lua << EOF
  require("bufferline").setup{
    options = {
      offsets = {{filetype = "coc-explorer", text = "File Explorer", highlight = "Directory", text_align = "left"}},
    }
  }
EOF
  nnoremap <silent>]b :BufferLineCycleNext<CR>
  nnoremap <silent>[b :BufferLineCyclePrev<CR>
endif

if !empty(glob('~/.config/nvim/bundle/lualine.nvim'))
  lua require('lualine').setup()
endif

if !empty(glob('~/.config/nvim/bundle/vim-choosewin'))
  nmap - <Plug>(choosewin)
endif

if !empty(glob('~/.config/nvim/bundle/gitsigns.nvim'))
lua << EOF
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
    keymaps = {
       -- Default keymap options
       noremap = true,
       buffer = true,

       ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
       ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

       ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
       ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
       ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
       ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
       ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

       -- Text objects
       ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
       ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
     },
  }
EOF
endif

if !empty(glob('~/.config/nvim/bundle/fzf.vim'))
  let $FZF_DEFAULT_OPTS .= ' --inline-info'

  " All files
  command! -nargs=? -complete=dir AF
        \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
        \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
        \ })))

  let g:fzf_colors =
        \ { 'fg':         ['fg', 'Normal'],
        \ 'bg':         ['bg', 'Normal'],
        \ 'preview-bg': ['bg', 'NormalFloat'],
        \ 'hl':         ['fg', 'Comment'],
        \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':        ['fg', 'Statement'],
        \ 'info':       ['fg', 'PreProc'],
        \ 'border':     ['fg', 'Ignore'],
        \ 'prompt':     ['fg', 'Conditional'],
        \ 'pointer':    ['fg', 'Exception'],
        \ 'marker':     ['fg', 'Keyword'],
        \ 'spinner':    ['fg', 'Label'],
        \ 'header':     ['fg', 'Comment'] }

  if exists('$TMUX')
    let g:fzf_layout = { 'tmux': '-p95%,70%' }
  else
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7 } }
  endif

  command! -bar MoveBack if &buftype == 'nofile' && (winwidth(0) < &columns / 3 || winheight(0) < &lines / 3) | execute "normal! \<c-w>\<c-p>" | endif

  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  " nmap <leader><tab> <plug>(fzf-maps-n)
  " xmap <leader><tab> <plug>(fzf-maps-x)
  " omap <leader><tab> <plug>(fzf-maps-o)

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

  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    let options = fzf#vim#with_preview(options, 'right', 'ctrl-/')
    call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
endif

if !empty(glob('~/.config/nvim/bundle/which-key.nvim'))
lua << EOF
  require("which-key").setup{
    layout = {
      height = { min = 2, max = 25 }, -- min and max height of the columns
      width = { min = 30, max = 60 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "center", -- align columns left, center or right
    },
  }
  local wk = require("which-key")
  wk.register({
    ["<leader>f"] = { name = "+fzf" },
    ["<leader>ff"] = { ":MoveBack<BAR>Files<CR>", "find files" },
    ["<leader>fb"] = { ":MoveBack<BAR>Buffers<CR>", "find buffers" },
    ["<leader>fg"] = { ":Rg <C-R><C-W><CR>", "grep" },
    ["<leader>ft"] = { ":Rg<CR>", "interactive grep" },
    ["<leader>fr"] = { ":History<CR>", "show recent files" },
    ["<leader>fy"] = { ":History/<CR>", "yank history" },
    ["<leader>f?"] = { ":GFiles?<CR>", "git status" },
    ["<leader>fc"] = { ":BCommits<CR>", "git commit for current buffer" },
    ["<leader>fm"] = { ":Maps<CR>", "show key maps" },
    ["<leader>fdb"] = { ":Diagnostics<CR>", "show diagnostics for buffer" },
    ["<leader>fdw"] = { ":DiagnosticsAll<CR>", "show diagnostics for workspace" },
    ["<leader>fs"] = { ":DocumentSymbols<CR>", "show symbols for current buffer" },
    ["<leader>fi"] = { ":IncomingCalls<CR>", "show incoming calls" },
    ["<leader>fo"] = { ":OutgoingCalls<CR>", "show outgoing calls" },
    ["<leader>fa"] = { ":CodeActions<CR>", "show code actions" },
    ["<leader>fjc"] = { "<cmd>lua require('fzf-lua').dap_commands()<cr>", "show dap commands" },
    ["<leader>fjo"] = { "<cmd>lua require('fzf-lua').dap_configurations()<cr>", "show dap configurations" },
    ["<leader>fjb"] = { "<cmd>lua require('fzf-lua').dap_breakpoints()<cr>", "show dap breakpoints" },
    ["<leader>fjv"] = { "<cmd>lua require('fzf-lua').dap_variables()<cr>", "show dap variables" },
    ["<leader>fjf"] = { "<cmd>lua require('fzf-lua').dap_frames()<cr>", "show dap frames" },
    -- ["<leader>e"] = { "<Cmd>NvimTreeToggle<CR>", "toggle explorer" },
    ["<leader>e"] = { "<Cmd>call CocAction('runCommand','explorer')<CR>", "toggle explorer" },
    -- ["<leader>n"] = { "<Cmd>NvimTreeFindFile<CR>", "reveal to current buffer" },
    -- ["<leader>r"] = { "<Cmd>NvimTreeRefresh<CR>", "refresh explorer" },
    ["<leader>r"] = { "<Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>", "reveal to current buffer" },
    ["<leader>c"] = { "<Cmd>cclose<bar>lclose<CR>", "close quickfix/location list" },
    ["<leader>z"] = { "<Cmd>MaximizerToggle!<CR>", "toggle maximizer" },
    ["<leader>w"] = { "<Cmd>w<CR>", "save buffer" },
    ["<leader>q"] = { "<Cmd>q<CR>", "quit buffer" },
  })
  wk.register({
    ["<leader>f"] = { name = "+fzf" },
    ["<leader>fg"] = { 'y:Ag <C-R>"<CR>', "grep" },
  }, {mode = "v"})
EOF
endif

if !empty(glob('~/.config/nvim/bundle/nvim-treesitter'))
lua << EOF
  require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" },
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
  rainbow = { enable = true, extended_mode = true },
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

if !empty(glob('~/.config/nvim/bundle/nvim-tree.lua'))
  augroup nvim_tree_config
    autocmd!
    autocmd vimenter * if !argc() | Startify | endif
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'NvimTree') |
          \ q | endif
  augroup end

lua << EOF
  local lib = require("nvim-tree.lib")
  local view = require("nvim-tree.view")

  local function collapse_all()
    require("nvim-tree.actions.collapse-all").fn()
  end

  local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
      require('nvim-tree.actions.open-file').fn(action, node.link_to)
      view.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
      lib.expand_or_collapse(node)

    else
      require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
      -- view.close() -- Close the tree if file was opened
    end
  end

  local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
      require('nvim-tree.actions.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
      lib.expand_or_collapse(node)
    else
      require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
    end

    -- Finally refocus on tree if it was lost
    view.focus()
  end

  require'nvim-tree'.setup {
    renderer = {
      group_empty = true,
      highlight_git = true,
      indent_markers = {
        enable = true,
      }
    },
    diagnostics = {
      enable = true,
    },
    view = {
      mappings = {
          custom_only = false,
          list = {
              { key = "l", action = "edit", action_cb = edit_or_open },
              { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
              { key = "h", action = "close_node" },
              { key = "H", action = "collapse_all", action_cb = collapse_all }
          }
      },
    },
  }
EOF
endif

if !empty(glob('~/.config/nvim/bundle/coc.nvim'))
  augroup coc_config
    autocmd!
    autocmd vimenter * if !argc() | call CocActionAsync('runCommand', 'explorer') | Startify | endif
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'coc-explorer') |
          \ q | endif
    autocmd FileType coc-explorer setl statusline=coc-explorer
    autocmd FileType * let b:coc_suggest_disable = 1  " 禁用coc补全
  augroup end

  let g:coc_global_extensions = ['coc-explorer']
endif

if !empty(glob('~/.config/nvim/bundle/nvim-cmp'))
  set completeopt=menu,menuone,noselect
  " 禁用Copilot的Accept，改用cmp的
  " let g:copilot_no_tab_map = v:true
  " imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
lua << EOF
  require("nvim-lsp-installer").setup {}

  -- format
  function go_organize_imports_sync(timeout_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

  local function nvim_create_augroup(group_name,definitions)
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definitions) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end

  local function lsp_before_save()
    local defs = {}
    local ext = vim.fn.expand('%:e')
    table.insert(defs,{"BufWritePre", '*.'..ext,
                      "lua vim.lsp.buf.formatting_sync(nil,1000)"})
    if ext == 'go' then
      table.insert(defs,{"BufWritePre","*.go",
              "lua go_organize_imports_sync(1000)"})
    end
    nvim_create_augroup('lsp_before_save',defs)
  end

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>Declarations<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Definitions<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>Implementations<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>References<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>TypeDefinitions<cr>', opts)

    lsp_before_save()
  end

  -- Setup nvim-cmp.
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    preselect = {
      cmp = {
        PreselectMode = None
      }
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-g>'] = cmp.mapping(function(fallback) -- Copilot
        vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
      end),
      ['<CR>'] = function(fallback)
        if cmp.visible() then
          cmp.confirm()
        else
          fallback() -- If you use vim-endwise, this fallback will behave as vim-endwise.
        end
      end,
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'nvim_lua' },
      { name = 'path' },
      { name = 'emoji', insert = true },
      { name = 'calc' },
      { name = 'buffer', keyword_length = 3 },
      { name = 'dictionary' },
    },
    view = {
      entries = 'custom',
    },
    formatting = {
      format = require'lspkind'.cmp_format({
        mode = "symbol_text",
        menu = ({
          nvim_lsp = "[LSP]",
          vsnip = "[VS]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          buffer = "[Buffer]",
          emoji = "[Emoji]",
          calc = "[Calc]",
          dictionary = "[Dict]",
        }),
      }),
    },
    -- experimental = {
    --     ghost_text = false -- this feature conflict with copilot.vim's preview.
    -- }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  require("cmp_dictionary").setup({
    dic = {
      ["*"] = { "/usr/share/dict/words" },
    },
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { 'bashls', 'beancount' ,'clangd', 'clojure_lsp',
        'cmake', 'cssmodules_ls', 'diagnosticls', 'dockerls', 'lemminx',
        'golangci_lint_ls', 'gopls', 'kotlin_language_server', 'metals',
        'rls', 'sqlls', 'vimls', 'yamlls', 'cssls', 'html', 'jsonls'}
  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{on_attach = on_attach, capabilities = capabilities}
  end
EOF
endif

" ============================================================================
" AUTOCMD {{{
" ============================================================================
augroup dockerfile_type_set
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
augroup end

function! s:setf(filetype) abort
    if &filetype !=# a:filetype
        let &filetype = a:filetype
    endif
endfunction

augroup beancount_type_set
  autocmd!
  autocmd BufNewFile,BufRead *.bean,*.beancount call s:setf('beancount')
augroup end

augroup filetype_set
  autocmd!
  autocmd FileType markdown,text setlocal wrap
  autocmd FileType yaml,vim setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup end

augroup unset_paste
  autocmd!
  autocmd InsertLeave * silent! set nopaste
augroup end

augroup remember_position
  autocmd!
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup end

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END


" -----------------------------------------------------------------------------
" Help in new tabs
" -----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
augroup help_in_new_tab
  autocmd!
  autocmd BufEnter *.txt call s:helptab()
augroup end

" }}}
