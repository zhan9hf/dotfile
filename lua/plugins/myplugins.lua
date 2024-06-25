return {
  { "morhetz/gruvbox" },
  { "junegunn/seoul256.vim" },
  { "joshdick/onedark.vim" },

  -- 加载 colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      -- colorscheme = "tokyonight",
      colorscheme = "gruvbox",
      -- colorscheme = "seoul256",
    },
  },

  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- {
  --   "s1n7ax/nvim-window-picker",
  --   name = "window-picker",
  --   event = "VeryLazy",
  --   version = "2.*",
  --   config = function()
  --     require("window-picker").setup()
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cmake = { "cmake_format" },
      },
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
      opts.close_if_last_window = true
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

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      -- opts.preselect = "None"
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
