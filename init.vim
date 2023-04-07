" plug.vim {{{
silent! if plug#begin('~/AppData/Local/nvim/bundle')
Plug 'nvim-lua/plenary.nvim'
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
" Plug 'sainnhe/everforest'
Plug 'tpope/vim-sleuth'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'windwp/nvim-ts-autotag'
" Plug 'HiPhish/nvim-ts-rainbow2'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vladdoster/remember.nvim'
" Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
" Plug 'sk1418/Join', { 'on': 'Join'}
" Plug 'itchyny/vim-cursorword'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'honza/vim-snippets'
Plug 'windwp/nvim-autopairs'
Plug 't9md/vim-choosewin'
Plug 'szw/vim-maximizer'
" Plug 'rhysd/clever-f.vim'
Plug 'phaazon/hop.nvim'
Plug 'romainl/vim-cool'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'bronson/vim-visual-star-search'
" Plug 'folke/which-key.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mhinz/vim-rfc'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'github/copilot.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-calc'
Plug 'uga-rosa/cmp-dictionary'
Plug 'onsails/lspkind.nvim'
call plug#end()
endif
" }}}

" basic {{{
let mapleader      = ' '
let maplocalleader = ' '

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8 fileformats=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set number relativenumber nowrap guioptions=
set ruler laststatus=2 showmode nocursorline cmdheight=2
set scrolloff=5 t_ti= t_te= shortmess+=c
set list listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
set mouse=a mousehide helplang=cn
set termguicolors
" function! s:statusline_expr()
"   let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"   let ro  = "%{&readonly ? '[RO] ' : ''}"
"   let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"   let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline().' ' : ''}"
"   let cs  = "%{get(g:,'coc_status','').' '}%{get(b:,'coc_current_function','').' '}"
"   let sep = ' %= '
"   let pos = ' %-12(%l : %c%V%) '
"   let pct = ' %P'
"
"   return '[%n] %t %<'.mod.ro.ft.fug.cs.sep.pos.'%*'.pct
" endfunction
" let &statusline = s:statusline_expr()

set shiftwidth=4 expandtab tabstop=4 softtabstop=4
set foldmethod=indent foldlevel=6
set backspace=indent,eol,start formatoptions=cmMj
set tags=.tags,./.tags
set clipboard=unnamed clipboard+=unnamedplus
set hidden

set ignorecase smartcase incsearch hlsearch magic
set wildmenu wildmode=list:longest
set wildignore=*.~,*.?~,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock,
set wildignore=*.DS_Store,*.tags
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.so,*.manifest

set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 nolazyredraw
set noerrorbells visualbell t_vb=
silent! set nobackup nowritebackup
" }}}

" mappings {{{

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap Q :qa!<cr>
nnoremap Y y$
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
xnoremap < <gv
xnoremap > >gv
map! <S-Insert> <C-R>+
" }}}

" autocmd {{{
augroup common
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile

  autocmd FileType lua,ruby,html,javascript,typescript,css,json,vue,vim,yaml,cpp,c,cmake setlocal shiftwidth=2 tabstop=2

  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif

  autocmd BufNewFile,BufRead *.bean,*.beancount call s:setf('beancount')

  autocmd InsertLeave * silent! set nopaste

  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

  autocmd BufReadPost *.log normal! G

  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow

  " set up default omnifunc
  autocmd FileType *
        \ if &omnifunc == "" |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \ endif

  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup end
" }}}

" plugins {{{
if !empty(glob('~/AppData/Local/nvim/bundle/github-nvim-theme'))
  set background=dark
  " colorscheme seoul256
  colorscheme github_dark
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-web-devicons'))
lua << EOF
  require'nvim-web-devicons'.setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh"
      }
      };
    color_icons = true;
    default = true;
  }
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/vim-maximizer'))
  nnoremap <leader>z :MaximizerToggle!<CR>
endif

if !empty(glob('~/AppData/Local/nvim/bundle/lualine.nvim'))
lua << EOF
  require('lualine').setup {
    options = {
      theme = "auto",
      disabled_filetypes = {
        'coc-explorer',
        'neo-tree',
        'NvimTree'
      }
    }
  }
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/vim-startify'))
  let g:startify_change_to_dir = 0
  let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

  augroup startifyaucmd
    autocmd!
    autocmd VimEnter * if !argc() | Startify | endif
  augroup end
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-colorizer.lua'))
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

if !empty(glob('~/AppData/Local/nvim/bundle/Comment.nvim'))
  lua require('Comment').setup()
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-autopairs'))
  lua require('nvim-autopairs').setup{}
endif

if !empty(glob('~/AppData/Local/nvim/bundle/indent-blankline.nvim'))
lua <<EOF
  require("indent_blankline").setup {
    use_treesitter = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
      "log",
      "fugitive",
      "gitcommit",
      "packer",
      "vimwiki",
      "markdown",
      "json",
      "txt",
      "help",
      "git",
      "undotree",
      "coc-explorer",
      "" -- for all buffers without a file type
    },
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/gitsigns.nvim'))
lua << EOF
  require('gitsigns').setup {
    signs = {
      add = {hl = 'GitGutterAdd', text = '▌'},
      change = {hl = 'GitGutterChange',text= '▌'},
      delete = {hl= 'GitGutterDelete', text = '▌'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▌'},
      changedelete = {hl = 'GitGutterChange', text = '▌'},
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

if !empty(glob('~/AppData/Local/nvim/bundle/vim-choosewin'))
  nmap - <Plug>(choosewin)
endif

if !empty(glob('~/AppData/Local/nvim/bundle/hop.nvim'))
lua << EOF
  require'hop'.setup {}
  local hop = require('hop')
  local directions = require('hop.hint').HintDirection
  vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, {remap=true})
  vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, {remap=true})
  vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, {remap=true})
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/which-key.nvim'))
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
    ["<leader>z"] = { ":MaximizerToggle!<CR>", "toggle maximizer" },
    ["<leader>w"] = { ":w<CR>", "save buffer" },
    ["<leader>q"] = { ":q<CR>", "quit buffer" },
  })
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-bqf'))
  augroup bqfaucmd
    autocmd!
    autocmd FileType list lua require('bqf.magicwin.handler').attach()
  augroup end
endif

if !empty(glob('~/AppData/Local/nvim/bundle/DoxygenToolkit.vim'))
  let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
  let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
  let g:DoxygenToolkit_authorName="Haifeng Zhang"
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-hlslens'))
  noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
        \<Cmd>lua require('hlslens').start()<CR>
  noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
        \<Cmd>lua require('hlslens').start()<CR>
  noremap * *<Cmd>lua require('hlslens').start()<CR>
  noremap # #<Cmd>lua require('hlslens').start()<CR>
  noremap g* g*<Cmd>lua require('hlslens').start()<CR>
  noremap g# g#<Cmd>lua require('hlslens').start()<CR>
  lua require('hlslens').setup()
endif

if !empty(glob('~/AppData/Local/nvim/bundle/remember.nvim'))
  lua require('remember')
endif

if !empty(glob('~/AppData/Local/nvim/bundle/vim-gutentags'))
  let g:gutentags_project_root = ['.git', '.svn', '.hg', '.project']
  let g:gutentags_ctags_tagfile = '.tags'
  let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-treesitter'))
lua <<EOF
  require 'nvim-treesitter.install'.compilers = { "clang" }
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc","astro","fortran","qmldir" },
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Tab>", -- normal mode
        node_incremental = "<Tab>", -- visual mode
        node_decremental = "<S-Tab>", -- visual mode
      },
    },
    -- indent = { enable = true, disable = { "python" } },
    indent = { enable = true },
    -- extensions
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
    -- autotag = {
    --   enable = false,
    --   filetypes = {
    --     'xml', 'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
    --   }
    -- },
    matchup = { enable = true, disable = { "c", "cpp" }, },
    -- rainbow = {
    --   enable = true,
    --   -- list of languages you want to disable the plugin for
    --   -- disable = { "jsx", "cpp" },
    --   -- Which query to use for finding delimiters
    --   query = 'rainbow-parens',
    --   -- Highlight the entire buffer all at once
    --   strategy = require 'ts-rainbow.strategy.global',
    -- }
  }
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-tree.lua'))
  augroup nvim_tree_config
    autocmd!
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'NvimTree') |
          \ q | endif
  augroup end
  nnoremap <leader>n <Cmd>NvimTreeFindFile<CR>
  nnoremap <leader>r <Cmd>NvimTreeRefresh<CR>
  nnoremap <leader>e <Cmd>NvimTreeToggle<CR>

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
    git = {
      timeout = 1000,
    },
    filters = {
      dotfiles = true,
    },
    live_filter = {
      always_show_folders = false,
    },
    view = {
      mappings = {
          custom_only = false,
          list = {
              { key = "l", action = "edit", action_cb = edit_or_open },
              { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
              { key = "h", action = "close_node" },
              { key = "H", action = "collapse_all", action_cb = collapse_all },
              { key = "U", action = "toggle_dotfiles" }
          }
      },
    },
  }
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/neo-tree.nvim'))
  let g:neo_tree_remove_legacy_commands = 1
  nnoremap <leader>e :Neotree toggle reveal<CR>
lua << EOF
require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  window = {
    width = 32,
    mappings = {
      ["<space>"] = { 
          "toggle_node", 
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "open",
      ["h"] = "close_node",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      -- ['C'] = 'close_all_subnodes',
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = { 
        "add",
        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    }
  },
})
EOF

endif

if !empty(glob('~/AppData/Local/nvim/bundle/coc.nvim'))
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('definitionHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  function! s:go_to_definition()
    if CocActionAsync('jumpDefinition')
      return v:true
    endif

    let ret = execute("silent! normal \<C-]>")
    if ret =~ "Error" || ret =~ "错误"
      call searchdecl(expand('<cword>'))
    endif
  endfunction

  function! s:grep_from_selected(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
      normal! `<v`>y
    elseif a:type ==# 'char'
      normal! `[v`]y
    else
      return
    endif
    let word = substitute(@@, '\n$', '', 'g')
    let word = escape(word, '| ')
    let @@ = saved_unnamed_register
    execute 'CocList grep '.word
  endfunction

  function! s:coc_qf_diagnostic() abort
    if !get(g:, 'coc_service_initialized', 0)
      return
    endif
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
      let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source), (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
      let item = {'filename': d.file, 'lnum': d.lnum, 'end_lnum': d.end_lnum, 'col': d.col, 'end_col': d.end_col, 'text': text, 'type': d.severity[0]}
      call add(loc_ranges, d.location.range)
      call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items, 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}} })
    botright copen
  endfunction

  function! s:coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs, 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}} })
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
      rightbelow lwindow
    else
      call win_gotoid(winid)
    endif
  endfunction

  let g:copilot_no_tab_map = v:true
  let g:coc_enable_locationlist = 0

  let g:coc_global_extensions = [
        \'coc-clang-format-style-options',
        \'coc-clangd',
        \'coc-cmake',
        \'coc-css',
        \'coc-diagnostic',
        \'coc-dictionary',
        \'coc-docker',
        \'coc-eslint',
        \'coc-explorer',
        \'coc-git',
        \'coc-go',
        \'coc-graphql',
        \'coc-highlight',
        \'coc-html',
        \'coc-java',
        \'coc-json',
        \'coc-lists',
        \'coc-markdownlint',
        \'coc-marketplace',
        \'coc-mocword',
        \'coc-prettier',
        \'coc-pyright',
        \'coc-rls',
        \'coc-sh',
        \'coc-snippets',
        \'coc-sql',
        \'coc-sqlfluff',
        \'coc-sumneko-lua',
        \'coc-swagger',
        \'coc-tag',
        \'coc-toml',
        \'coc-tsserver',
        \'coc-typos',
        \'coc-vetur',
        \'coc-vimlsp',
        \'coc-word',
        \'coc-xml',
        \'coc-yaml',
        \'coc-yank',
        \'@onichandame/coc-proto3'
        \]

  let g:coc_filetype_map = {
        \ 'asciidoc': 'markdown',
        \ }

  set tagfunc=CocTagFunc
  set formatexpr=CocActionAsync('formatSelected')

  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <silent><expr> <backspace> coc#pum#visible() ? "\<bs>\<c-r>=coc#start()\<CR>" : "\<bs>"

  nmap <silent> [d <Plug>(coc-diagnostic-prev)
  nmap <silent> ]d <Plug>(coc-diagnostic-next)
  nmap <silent> [g <Plug>(coc-git-prevchunk)
  nmap <silent> ]g <Plug>(coc-git-nextchunk)
  nmap <silent> [c <Plug>(coc-git-prevconflict)
  nmap <silent> ]c <Plug>(coc-git-nextconflict)
  nmap <silent> ]s <Plug>(coc-typos-next)
  nmap <silent> [s <Plug>(coc-typos-prev)
  nmap <silent> z= <Plug>(coc-typos-fix)

  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  nmap <silent> gs <Plug>(coc-git-chunkinfo)
  nmap <silent> gd :call <SID>go_to_definition()<CR>
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references-used)
  nmap <silent> gl <Plug>(coc-codeaction-line)
  nmap <silent> ga <Plug>(coc-codeaction-cursor)
  nmap <silent> gk <Plug>(coc-fix-current)

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

  " Use CTRL-S for selections ranges
  " Requires 'textDocument/selectionRange' support of language server
  " nmap <silent> <C-s> <Plug>(coc-range-select)
  " xmap <silent> <C-s> <Plug>(coc-range-select)

  " nmap <leader>ff :CocList files<CR>
  " nmap <leader>fb :CocList buffers<CR>
  " nmap <leader>fr :CocList mru<CR>
  " nmap <leader>s :CocList gstatus<CR>
  " nmap <leader>c :CocList bcommits<CR>
  " nmap <leader>o :CocList outline<CR>
  " nmap <leader>y :<C-u>CocList -A --normal yank<CR>
  " nmap <leader>g :CocList grep<CR>
  " vmap <leader>g :<C-u><C-u>call <SID>grep_from_selected(visualmode())<CR><CR>
  nmap <leader>d :CocDiagnostics<CR>
  nmap <leader>e :CocCommand explorer<CR>
  nmap <leader>a :CocCommand clangd.switchSourceHeader<CR>
  nmap <leader>r <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR><CR>
  nmap <leader>u :call CocAction('runCommand', 'git.chunkUndo')<CR>

  augroup cocaucmd
    autocmd!
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " autocmd VimEnter * if !argc() | call CocActionAsync('runCommand', 'explorer') | endif
    autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'coc-explorer') |
          \ q | endif
    autocmd FileType coc-explorer setl statusline=coc-explorer
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd BufWritePre *.java,*.go
          \ | silent! call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd User CocLocationsChange call s:coc_qf_jump2loc(g:coc_jump_locations)
  augroup end

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
endif

if !empty(glob('~/AppData/Local/nvim/bundle/nvim-cmp'))
  set completeopt=menu,menuone,noselect
  " augroup mylspconfig
  "   autocmd!
  "   autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
  "   autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
  "   autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  " augroup end
  " 禁用Copilot的Accept，改用cmp的
  " let g:copilot_no_tab_map = v:true
  " imap <expr> <Plug>(vimrc:copilot-dummy-map) copilot#Accept("\<Tab>")
lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup {
    ensure_installed = { 'bashls', 'beancount', 'clangd', 'clojure_lsp',
        'cssls', 'cssmodules_ls', 'denols',
        'diagnosticls', 'docker_compose_language_service', 'dockerls',
        'golangci_lint_ls', 'gradle_ls', 'groovyls',
        'html', 'jsonls', 'kotlin_language_server', 'lemminx', 'ltex',
        'lua_ls', 'marksman', 'neocmake', 'powershell_es', 'pylsp',
        'rust_analyzer', 'sqlls', 'taplo', 'tsserver',
        'vimls', 'yamlls'
    },
  }

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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>ClangdSwitchSourceHeader<cr>', opts)

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() vim.lsp.buf.format({timeout_ms = 3000}) end,
        group = vim.api.nvim_create_augroup("lsp_document_format", {clear = true}),
        buffer = 0
      })
    end
  end

  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
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
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end, { "i", "s" }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
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
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local servers = { 'bashls', 'beancount', 'clojure_lsp',
        'cssls', 'cssmodules_ls', 'denols',
        'diagnosticls', 'docker_compose_language_service', 'dockerls',
        'golangci_lint_ls', 'gradle_ls', 'groovyls',
        'html', 'jsonls', 'kotlin_language_server', 'lemminx', 'ltex',
        'lua_ls', 'marksman', 'neocmake', 'powershell_es', 'pylsp',
        'rust_analyzer', 'sqlls', 'taplo', 'tsserver',
        'vimls', 'yamlls'
  }
  for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{on_attach = on_attach, capabilities = capabilities}
  end
  -- require'lspconfig'.ccls.setup {
  --   init_options = {
  --     compilationDatabaseDirectory = "build";
  --     index = {
  --       threads = 0;
  --     };
  --     clang = {
  --       excludeArgs = { "-frounding-math"} ;
  --     };
  --   }
  -- }
  require'lspconfig'.clangd.setup{
    cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy" },
    filetypes = { "c", "cpp" },
    init_options = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeAttributes = true,
      semanticHighlighting = true,
      index = {
        background = true,
        preloadHeaders = 50,
        preloadASTs = true,
        preloadPreamble = true,
      },
    },
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true,
      }),
    },
    on_attach = on_attach, capabilities = capabilities
  }

  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
EOF
endif

if !empty(glob('~/AppData/Local/nvim/bundle/fzf.vim'))
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

  nnoremap <silent> <leader>ff :MoveBack<BAR>Files<CR>
  nnoremap <silent> <leader>fb :MoveBack<BAR>Buffers<CR>
  nnoremap <silent> <leader>fr :History<CR>
  nnoremap <silent> <leader>s  :GFiles?<CR>
  nnoremap <silent> <leader>c  :BCommits<CR>
  nnoremap <silent> <leader>g  :Rg <C-R><C-W><CR>
  xnoremap <silent> <leader>g  y:Rg <C-R>"<CR>
  nnoremap <silent> <leader>t  :Rg<CR>
  nnoremap <silent> <Leader>`  :Marks<CR>
endif

if !empty(glob('~/AppData/Local/nvim/bundle/telescope.nvim'))
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fr <cmd>Telescope oldfiles<cr>
  nnoremap <leader>m <cmd>Telescope keymaps<cr>
  nnoremap <leader>s <cmd>Telescope git_status<cr>
  nnoremap <leader>c <cmd>Telescope git_bcommits<cr>
  nnoremap <leader>g <cmd>Telescope grep_string<cr>
  nnoremap <leader>t <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
  nnoremap <leader>` <cmd>Telescope marks<cr>
  nnoremap <leader>j <cmd>Telescope jumplist<cr>
  nnoremap <leader>p <cmd>Telescope registers<cr>
  nnoremap <leader>d <cmd>Telescope diagnostics bufnr=0<cr>

  " nnoremap <silent> gd <cmd>Telescope coc definitions<cr>
  " nnoremap <silent> gi <cmd>Telescope coc implementations<cr>
  " nnoremap <silent> gr <cmd>Telescope coc references<cr>
  " nnoremap <silent> gy <cmd>Telescope coc type_definitions<cr>

lua << EOF
  local lga_actions = require("telescope-live-grep-args.actions")
  require('telescope').setup{
    defaults = {
      layout_config = {
        vertical = { width = 0.8 }
      },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        }
      }
    },
    pickers = {
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        }

        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      },
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        -- define mappings, e.g.
        mappings = { -- extend mappings
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          },
        },
        -- ... also accepts theme settings, for example:
        -- theme = "dropdown", -- use dropdown theme
        -- theme = { }, -- use own theme spec
        -- layout_config = { mirror=true }, -- mirror preview pane
      }
    }
  }
  require("telescope").load_extension("ui-select")
EOF
endif
" }}}
