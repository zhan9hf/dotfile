return {
  { "morhetz/gruvbox" },
  { "junegunn/seoul256.vim" },
  { "joshdick/onedark.vim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "tanvirtin/monokai.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  -- 加载 colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      -- colorscheme = "tokyonight",
      colorscheme = "monokai-pro",
      -- colorscheme = "gruvbox",
      -- colorscheme = "rose-pine",
      -- colorscheme = "seoul256",
    },
  },
}