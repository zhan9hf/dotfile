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
    "jamespeilunli/nvim-flatbuffers",
    event = "LspAttach",
    config = function()
      require("flatbuffers").setup()
    end,
  },

  {
    "zchee/vim-flatbuffers",
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   opts = function(_, opts)
  --     -- opts.preselect = "None"
  --     table.insert(opts.sources, { name = "emoji" })
  --     local cmp = require("cmp")
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ---@diagnostic disable-next-line: no-unknown
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ---@diagnostic disable-next-line: no-unknown
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },

  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     keymap = {
  --       preset = "enter",
  --       ["<C-y>"] = { "select_and_accept" },
  --       ["<Tab>"] = {
  --         function(cmp)
  --           if cmp.snippet_active() then
  --             return cmp.snippet_forward()
  --           else
  --             return cmp.select_next()
  --           end
  --         end,
  --         "fallback",
  --       },
  --       ["<S-Tab>"] = {
  --         function(cmp)
  --           if cmp.snippet_active() then
  --             return cmp.snippet_backward()
  --           else
  --             return cmp.select_prev()
  --           end
  --         end,
  --         "fallback",
  --       },
  --     },
  --   },
  -- },
}
