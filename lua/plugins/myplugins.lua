return {
  { "morhetz/gruvbox" },
  { "junegunn/seoul256.vim" },
  { "jdsimcoe/abstract.vim" },
  { "joshdick/onedark.vim" },

  -- 加载 colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      -- colorscheme = "tokyonight",
      colorscheme = "catppuccin",
      -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
    },
    config = true,
    keys = {
      {
        "<leader>gg",
        "<cmd>Neogit cwd=%:p:h<cr>",
        desc = "Neogit root",
      },
      { "<leader>gG", "<cmd>Neogit<cr>", desc = "Neogit current" },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
          index = "index",
          path_html = "~/vimwiki_html/",
          template_path = "~/vimwiki/templates/",
          template_default = "default",
          template_ext = ".md",
          table_mappings = 0,
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
    keys = { {
      "<leader>ww",
      "<cmd>VimwikiIndex<cr>",
      desc = "Vimwiki Index",
    } },
  },

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

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cmake = { "cmake_format" },
      },
      -- format_on_save = {
      --   timeout_ms = 2000,
      -- },
    },
  },

  -- {
  --   "echasnovski/mini.starter",
  --   opts = {
  --     header = table.concat({
  --       "███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗███████╗",
  --       "╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔════╝",
  --       "  ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗███████║█████╗  ",
  --       " ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══╝  ",
  --       "███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║     ",
  --       "╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ",
  --     }, "\n"),
  --   },
  -- },

  -- {
  --   "nvimdev/dashboard-nvim",
  --   opts = function(_, opts)
  --     local logo = [[
  -- ███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗███████╗
  -- ╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔════╝
  --   ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗███████║█████╗
  --  ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══╝
  -- ███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║
  -- ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
  -- ]]
  --     logo = string.rep("\n", 6) .. logo .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local opts = {
        theme = "hyper",
        shortcut_type = "number",
        change_to_vcs_root = true,
        hide = { statusline = false },
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = "󰒲 Lazy", action = "Lazy", key = "l" },
            { desc = " New file", action = "ene | startinsert", key = "n" },
            { desc = " Session", action = 'lua require("persistence").load()', key = "s" },
            { desc = " Files", action = "Telescope find_files", key = "f" },
            { desc = " Quit", action = "qa", key = "q" },
          },
          project = { enable = false, limit = 8, icon = " ", action = "Telescope projects" },
        },
      }

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        beancount = {},
        cssls = {},
        cssmodules_ls = {},
        denols = {},
        gradle_ls = {},
        html = {},
        kotlin_language_server = {},
        lemminx = {},
        neocmake = {
          init_options = {
            format = {
              enable = false,
            },
          },
        },
        sqlls = {},
        taplo = {},
        vimls = {},
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- opts.close_if_last_window = true -- Close Neo-tree if it is the last window left in the tab
      -- opts.enable_git_status = false
      opts.window = {
        width = 28,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["m"] = { "move", config = { show_path = "absolute" } }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
        },
      }
    end,
  },

  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  { "echasnovski/mini.comment", enabled = false },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("Comment").setup(opts)
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

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "cmp-emoji" },
        { name = "ultisnips" },
        { name = "doxygen" },
      }))
    end,
  },
}
