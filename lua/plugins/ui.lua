return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.close_if_last_window = true
      opts.window = {
        width = 28,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          -- ["m"] = { "move", config = { show_path = "absolute" } }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
        },
      }
    end,
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

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
   ███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗███████╗
   ╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔════╝
     ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗███████║█████╗  
    ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══╝  
   ███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║     
   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     
]],
        },
      },
    },
  },

  -- {
  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function(_, opts)
  --     local logo = [[
  --       ███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗███████╗
  --       ╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔════╝
  --         ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗███████║█████╗
  --        ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══╝
  --       ███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║
  --       ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
  --       ]]
  --
  --     logo = string.rep("\n", 8) .. logo .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
}
