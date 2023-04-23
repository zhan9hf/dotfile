return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "neovim/nvim-lspconfig",
    -- tag = "v0.1.6",
    ---@class PluginLspOpts
    dependencies = {
      "p00f/clangd_extensions.nvim",
    },
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        beancount = {},
        clangd = { cmd = { "clangd", "--offset-encoding=utf-16" } },
        clojure_lsp = {},
        cssls = {},
        cssmodules_ls = {},
        denols = {},
        docker_compose_language_service = {},
        dockerls = {},
        golangci_lint_ls = {},
        gradle_ls = {},
        groovyls = {},
        html = {},
        jsonls = {},
        kotlin_language_server = {},
        lemminx = {},
        ltex = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        marksman = {},
        neocmake = {},
        -- powershell_es = {},
        pylsp = {},
        rust_analyzer = {},
        sqlls = {},
        taplo = {},
        tsserver = {},
        vimls = {},
        yamlls = {},
      },
      setup = {
        clangd = function(_, opts)
          require("clangd_extensions").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      -- ensure_installed = {
      --   "bash",
      --   "html",
      --   "javascript",
      --   "json",
      --   "lua",
      --   "markdown",
      --   "markdown_inline",
      --   "python",
      --   "query",
      --   "regex",
      --   "tsx",
      --   "typescript",
      --   "vim",
      --   "yaml",
      --   "c",
      --   "cpp",
      --   "java",
      --   "rust",
      -- },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    -- tag = "2.56",
    opts = function(_, opts)
      opts.close_if_last_window = true -- Close Neo-tree if it is the last window left in the tab
      opts.window = {
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
              show_path = "none", -- "none", "relative", "absolute"
            },
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
        },
      }
    end,
  },

  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "SirVer/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "honza/vim-snippets",
      "paopaol/cmp-doxygen",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      }

      opts.preselect = "None"

      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end
        end, { "i", "s" }),
      })

      opts.sources = cmp.config.sources({
        { name = "cmp-emoji" },
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "buffer" },
        { name = "path" },
        { name = "doxygen" },
      })
    end,
  },
}
