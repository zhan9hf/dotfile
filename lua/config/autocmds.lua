vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("some_indent", { clear = true }),
  pattern = {
    "cpp",
    "c",
    "yaml",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
