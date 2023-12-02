local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'morhetz/gruvbox',
    init = function()
      vim.cmd([[colorscheme gruvbox]])
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    config = function()
      require("which-key").setup()
    end
  },
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          disabled_filetypes = {
            'coc-explorer',
          }
        }
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "bash", "c", "cmake", "comment", "cpp", "csv", "c_sharp", "diff", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "html", "ini", "json", "java", "lua", "make", "markdown", "ninja", "proto", "python", "query", "regex", "rust", "sql", "todotxt", "toml", "vim", "vimdoc", "xml", "yaml" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Tab>",     -- normal mode
            node_incremental = "<Tab>",   -- visual mode
            node_decremental = "<S-Tab>", -- visual mode
          },
        },
        -- extensions
        matchup = { enable = true },
      })
    end
  },
  'andymass/vim-matchup',
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup {
        exclude = {
          filetypes = {
            "startify",
          },
        },
      }
    end,
  },
  'norcalli/nvim-colorizer.lua',
  'hiphish/rainbow-delimiters.nvim',
  'tpope/vim-sleuth',
  {
    'vladdoster/remember.nvim',
    config = function()
      require('remember')
    end
  },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end
  },
  'bronson/vim-visual-star-search',
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  'romainl/vim-cool',
  {
    't9md/vim-choosewin',
    keys = {
      {
        "-",
        "<Plug>(choosewin)",
        desc = "Choose window to edit",
      },
    }
  },
  {
    'phaazon/hop.nvim',
    config = function()
      require 'hop'.setup {}
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  },
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      vim.api.nvim_create_augroup("BQFGroup", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "list",
        callback = function()
          require('bqf.magicwin.handler').attach()
        end,
        group = "BQFGroup"
      })
    end
  },
  'tpope/vim-fugitive',
  {
    'vim-scripts/DoxygenToolkit.vim',
    init = function()
      vim.g.DoxygenToolkit_authorName = "Haifeng Zhang"
    end
  },
  {
    'neoclide/coc.nvim',
    branch = 'release',
    init = function()
      vim.g.mapleader = ' '
      vim.g.maplocalleader = '\\'
      -- Some servers have issues with backup files, see #649
      vim.opt.backup = false
      vim.opt.writebackup = false

      -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
      -- delays and poor user experience
      vim.opt.updatetime = 300

      -- Always show the signcolumn, otherwise it would shift the text each time
      -- diagnostics appeared/became resolved
      vim.opt.signcolumn = "yes"

      vim.opt.tagfunc = [[CocTagFunc]]
      vim.opt.formatexpr = [[CocActionAsync('formatSelected')]]

      -- vim.g.coc_enable_locationlist = 0
      vim.g.coc_global_extensions = {
        'coc-clang-format-style-options',
        'coc-clangd',
        'coc-cmake',
        'coc-diagnostic',
        'coc-dictionary',
        'coc-docker',
        'coc-emoji',
        'coc-explorer',
        'coc-git',
        'coc-gitignore',
        'coc-go',
        'coc-highlight',
        'coc-html',
        'coc-java',
        'coc-json',
        'coc-lines',
        'coc-lists',
        'coc-markdownlint',
        'coc-marketplace',
        'coc-mocword',
        'coc-pairs',
        'coc-powershell',
        'coc-pyright',
        'coc-rls',
        'coc-sh',
        'coc-snippets',
        'coc-sql',
        'coc-sqlfluff',
        'coc-sumneko-lua',
        'coc-swagger',
        'coc-tag',
        'coc-toml',
        'coc-tsserver',
        'coc-typos',
        'coc-vimlsp',
        'coc-word',
        'coc-xml',
        'coc-yaml',
        'coc-yank'
      }

      vim.g.coc_filetype_map = {
        asciidoc = 'markdown'
      }

      local keyset = vim.keymap.set
      -- Autocomplete
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Use Tab for trigger completion with characters ahead and navigate
      -- NOTE: There's always a completion item selected by default, you may want to enable
      -- no select by setting `"suggest.noselect": true` in your configuration file
      -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
      -- other plugins before putting this into your config
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts)
      keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

      -- Use <c-j> to trigger snippets
      keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
      -- Use <c-space> to trigger completion
      keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
      -- Use <c-e> to cacel completion
      keyset('i', '<c-e>', [[coc#pum#visible() ? coc#pum#cancel() : "\\<End>"]],
        opts)

      -- Use `[d` and `]d` to navigate diagnostics
      -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
      keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
      keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })
      keyset('n', '[h', '<Plug>(coc-git-prevchunk)', { silent = true })
      keyset('n', ']h', '<Plug>(coc-git-nextchunk)', { silent = true })
      keyset('n', '[c', '<Plug>(coc-git-prevconflict)', { silent = true })
      keyset('n', ']c', '<Plug>(coc-git-nextconflict)', { silent = true })
      keyset('n', ']s', '<Plug>(coc-typos-next)', { silent = true })
      keyset('n', '[s', '<Plug>(coc-typos-prev)', { silent = true })
      keyset('n', 'z=', '<Plug>(coc-typos-fix)', { silent = true })

      -- GoTo code navigation
      keyset('n', 'gs', '<Plug>(coc-git-chunkinfo)', { silent = true })
      keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
      keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      keyset('n', 'gr', '<Plug>(coc-references-used)', { silent = true })
      keyset("n", "gR", "<Plug>(coc-rename)", { silent = true })
      keyset('n', 'gl', '<Plug>(coc-codeaction-line)', { silent = true })
      keyset('n', 'ga', '<Plug>(coc-codeaction-cursor)', { silent = true })
      keyset('n', 'gk', '<Plug>(coc-fix-current)', { silent = true })

      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = [[silent call CocActionAsync('highlight')]],
        desc = "Highlight symbol under cursor on CursorHold"
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        group = "CocGroup",
        desc = "Update signature help on jump placeholder"
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        command = [[if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'coc-explorer') | q | endif]],
        group = "CocGroup",
      })
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        command = [[if !argc() | call CocActionAsync('runCommand', 'explorer') | endif]],
        group = "CocGroup",
      })

      vim.cmd [[
      function! GrepFromSelected(type)
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

      vnoremap <leader>g :<C-u>call GrepFromSelected(visualmode())<CR>

      command! -nargs=+ -complete=custom,GrepArgs Rg exe 'CocList grep '.<q-args>

      function! GrepArgs(...)
        let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
              \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
        return join(list, "\n")
      endfunction
      ]]

      keyset('n', '<leader>ff', ':<C-u>CocList -A files<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>fb', ':<C-u>CocList -A --normal buffers<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>fr', ':<C-u>CocList -A --normal mru<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>o', ':<C-u>CocList -A outline<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>y', ':<C-u>CocList -A --normal yank<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>g', [[:exe 'CocList -I --input='.expand('<cword>').' grep'<cr>]],
        { noremap = true, silent = true })
      keyset('n', '<leader>e', ':<C-u>CocCommand explorer<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>a', ':<C-u>CocCommand clangd.switchSourceHeader<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>u', ':<C-u>CocCommand git.chunkUndo<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>d', ':<C-u>CocList -A --normal diagnostics<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>hi', '<ESC>:<C-u>CocCommand git.chunkInfo<cr>', { noremap = true, silent = true })
      keyset('n', '<leader>hb', '<ESC>:<C-u>CocCommand git.showBlameDoc<cr>', { noremap = true, silent = true })
      keyset("n", "<leader>p", ":<C-u>CocListResume<cr>", { noremap = true, silent = true })

      -- Remap keys for apply refactor code actions.
      keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
      keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

      -- Run the Code Lens actions on the current line
      keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })


      -- Map function and class text objects
      -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
      keyset("x", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
      keyset("o", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true })
      keyset("x", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
      keyset("o", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true })
      keyset("x", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
      keyset("o", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true })
      keyset("x", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
      keyset("o", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true })
      keyset("x", "ig", "<Plug>(coc-git-chunk-inner)", { silent = true, nowait = true })
      keyset("o", "ig", "<Plug>(coc-git-chunk-inner)", { silent = true, nowait = true })
      keyset("x", "ag", "<Plug>(coc-git-chunk-outer)", { silent = true, nowait = true })
      keyset("o", "ag", "<Plug>(coc-git-chunk-outer)", { silent = true, nowait = true })

      -- Remap <C-f> and <C-b> to scroll float windows/popups
      ---@diagnostic disable-next-line: redefined-local
      local opts = { silent = true, nowait = true, expr = true }
      keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
      keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
      keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
      keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

      -- Use CTRL-S for selections ranges
      -- Requires 'textDocument/selectionRange' support of language server
      keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
      keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })

      -- Add `:Format` command to format current buffer
      vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

      -- " Add `:Fold` command to fold current buffer
      vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

      -- Add `:OR` command for organize imports of the current buffer
      vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

      vim.api.nvim_create_user_command('Todos', function()
        vim.cmd("CocList -A --normal grep -w TODO|FIXME|FIX|FIXIT|BUG|HACK|XXX")
      end, { nargs = 0 })

      -- Add (Neo)Vim's native statusline support
      -- NOTE: Please see `:h coc-status` for integrations with external plugins that
      -- provide custom statusline: lightline.vim, vim-airline
      -- vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")
    end
  },
  'github/copilot.vim',
  'honza/vim-snippets',
})

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"
-- vim.opt.termencoding = "utf-8"
vim.opt.fileformats = 'unix,mac,dos'
vim.opt.fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1'

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.guioptions = ''
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.cursorline = false
vim.opt.cmdheight = 2
vim.opt.scrolloff = 5
vim.opt.shortmess:append("c")
vim.opt.list = true
vim.opt.listchars = 'tab:→\\ ,trail:·,precedes:«,extends:»,eol:¬'
vim.opt.mouse = "a"
vim.opt.mousehide = true
vim.opt.helplang = "cn"

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.foldmethod = 'expr'
vim.opt.backspace = 'indent,eol,start'
vim.opt.inccommand = 'split'
vim.opt.jumpoptions = 'stack'
vim.opt.tags = '.tags,./.tags'
vim.opt.clipboard = 'unnamed'
vim.opt.clipboard:append("unnamedplus")
vim.opt.hidden = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.magic = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*.~,*.?~,*.sw?,*.bak,*.hi,*.pyc,*.out,*.lock,'
vim.opt.wildignore:append('*.DS_Store,*.tags')
vim.opt.wildignore:append('.hg,.git,.svn')
vim.opt.wildignore:append('*.jpg,*.bmp,*.gif,*.png,*.jpeg')
vim.opt.wildignore:append('*.o,*.obj,*.exe,*.dll,*.so,*.manifest')

vim.api.nvim_create_augroup("PrivateGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Dockerfile*",
  command = "set filetype=dockerfile",
  group = "PrivateGroup",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.bean", "*.beancount" },
  command = "set filetype=beancount",
  group = "PrivateGroup",
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "json", "vim", "yaml", "cpp", "c", "cmake" },
--   callback = function()
--     vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2
--   end,
--   group = "PrivateGroup",
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    if vim.fn.mapcheck('<esc>', 'n') == '' then
      vim.api.nvim_buf_set_keymap(0, 'n', '<esc>', ':cclose<bar>lclose<CR>', { noremap = true, silent = true })
    end
  end,
  group = "PrivateGroup",
})

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   pattern = [[*.log]],
--   command = [[normal! G]],
--   group = "PrivateGroup",
-- })

vim.api.nvim_create_user_command("E", "e", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("T", "tabnew", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("JSONPretty", "%!python3 -m json.tool", {})
vim.api.nvim_create_user_command("VSCode", "silent! execute ':!code -g %:p:' . line('.') . ':' . col('.')", {})
vim.api.nvim_create_user_command("BOnly", "silent! execute '%bd|e#|bd#'", {})

vim.api.nvim_set_keymap('n', '<leader>w', ':w!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Q', ':qa!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Insert>', '<C-R>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>i', ':e $MYVIMRC<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '?', '/\\<\\><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\\\')<cr><cr>', { noremap = true })
