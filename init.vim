" plug.vim {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
endif

silent! if plug#begin('~/.config/nvim/bundle')
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/seoul256.vim'
Plug 'ellisonleao/gruvbox.nvim'
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vladdoster/remember.nvim'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim'
Plug 'sk1418/Join', { 'on': 'Join'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'
Plug 'windwp/nvim-autopairs'
Plug 'brglng/vim-im-select'
Plug 't9md/vim-choosewin'
Plug 'szw/vim-maximizer'
Plug 'rhysd/clever-f.vim'
Plug 'romainl/vim-cool'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'bronson/vim-visual-star-search'
Plug 'folke/which-key.nvim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-rfc'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
endif
" }}}

" basic {{{
let mapleader      = ' '
let maplocalleader = ' '

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8 fileformats=unix,mac,dos
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set number relativenumber background=dark nowrap guioptions=
set ruler laststatus=2 showmode cursorline colorcolumn=80 cmdheight=2
set scrolloff=5 t_ti= t_te= shortmess+=c
set list listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
set mouse=a mousehide helplang=cn
set termguicolors
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline().' ' : ''}"
  let cs  = "%{get(g:,'coc_status','').' '}%{get(b:,'coc_current_function','').' '}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %t %<'.mod.ro.ft.fug.cs.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()

set shiftwidth=4 expandtab tabstop=4 softtabstop=4
set foldmethod=marker
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

set updatetime=300 timeout timeoutlen=500 ttimeout ttimeoutlen=50 lazyredraw
set noerrorbells visualbell t_vb=
silent! set nobackup nowritebackup
" }}}

" mappings {{{
nnoremap Q :qa!<cr>
nnoremap Y y$
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
xnoremap < <gv
xnoremap > >gv
" }}}

" autocmd {{{
augroup common
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile

  autocmd FileType lua,ruby,html,javascript,typescript,css,json,vue,vim,yaml,cpp,c,cmake setlocal shiftwidth=2 tabstop=2

  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif

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
augroup end
" }}}

" plugins {{{
if !empty(glob('~/.config/nvim/bundle/gruvbox.nvim'))
  colorscheme gruvbox
endif

if !empty(glob('~/.config/nvim/bundle/nvim-colorizer.lua'))
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

if !empty(glob('~/.config/nvim/bundle/Comment.nvim'))
  lua require('Comment').setup()
endif

if !empty(glob('~/.config/nvim/bundle/nvim-autopairs'))
  lua require('nvim-autopairs').setup{}
endif

if !empty(glob('~/.config/nvim/bundle/indent-blankline.nvim'))
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

if !empty(glob('~/.config/nvim/bundle/vim-choosewin'))
  nmap - <Plug>(choosewin)
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
    ["<leader>z"] = { ":MaximizerToggle!<CR>", "toggle maximizer" },
    ["<leader>w"] = { ":w<CR>", "save buffer" },
    ["<leader>q"] = { ":q<CR>", "quit buffer" },
  })
EOF
endif

if !empty(glob('~/.config/nvim/bundle/nvim-bqf'))
  augroup bqfaucmd
    autocmd FileType list lua require('bqf.magicwin.handler').attach()
  augroup end
endif

if !empty(glob('~/.config/nvim/bundle/nvim-hlslens'))
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

if !empty(glob('~/.config/nvim/bundle/remember.nvim'))
  lua require('remember')
endif

if !empty(glob('~/.config/nvim/bundle/vim-gutentags'))
  let g:gutentags_project_root = ['.git', '.svn', '.hg', '.project']
  let g:gutentags_ctags_tagfile = '.tags'
  let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
endif

if !empty(glob('~/.config/nvim/bundle/nvim-treesitter'))
lua <<EOF
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
  -- indent = { enable = true, disable = { "python" } },
  indent = { enable = false },
  -- extensions
  rainbow = { enable = true, extended_mode = true },
  textobjects = {
    select = {
      enable = false, -- 使用coc的text objects
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

if !empty(glob('~/.config/nvim/bundle/coc.nvim'))
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
        \'coc-ecdict',
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
        \'coc-python',
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
  nmap <silent> gR <Plug>(coc-rename)
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

  " nmap <leader>ff :CocList files<CR>
  " nmap <leader>fb :CocList buffers<CR>
  " nmap <leader>fr :CocList mru<CR>
  " nmap <leader>s :CocList gstatus<CR>
  " nmap <leader>c :CocList bcommits<CR>
  " nmap <leader>o :CocList outline<CR>
  " nmap <leader>y :<C-u>CocList -A --normal yank<CR>
  " nmap <leader>g :CocList grep<CR>
  " vmap <leader>g :<C-u><C-u>call <SID>grep_from_selected(visualmode())<CR><CR>
  nmap <leader>d :call <SID>coc_qf_diagnostic()<CR>
  nmap <leader>e :CocCommand explorer<CR>
  nmap <leader>r <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR><CR>
  nmap <leader>u :call CocAction('runCommand', 'git.chunkUndo')<CR>

  augroup cocaucmd
    autocmd!
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd VimEnter * if !argc() | call CocActionAsync('runCommand', 'explorer') | endif
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

  nnoremap <silent> <leader>ff :MoveBack<BAR>Files<CR>
  nnoremap <silent> <leader>fb :MoveBack<BAR>Buffers<CR>
  nnoremap <silent> <leader>fr :History<CR>
  nnoremap <silent> <leader>s  :GFiles?<CR>
  nnoremap <silent> <leader>c  :BCommits<CR>
  nnoremap <silent> <leader>g  :Ag <C-R><C-W><CR>
  xnoremap <silent> <leader>g  y:Ag <C-R>"<CR>
  nnoremap <silent> <leader>t  :Ag<CR>
  nnoremap <silent> <Leader>`  :Marks<CR>
endif
" }}}
