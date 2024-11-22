return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        cmake = { "cmake_format" },
      },
    },
  },

  {
    "Saghen/blink.cmp",
    version = "v0.5.1",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = function(_, opts)
      -- opts.preselect = "None"
      table.insert(opts.sources, { name = "emoji" })
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ---@diagnostic disable-next-line: no-unknown
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ---@diagnostic disable-next-line: no-unknown
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
