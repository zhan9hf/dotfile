-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "<S-Insert>", "<C-R>+", { noremap = true, desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<C-R>+", { noremap = true, desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("v", "<S-Insert>", '"0p', { noremap = true, desc = "Paste from clipboard" })
vim.api.nvim_set_keymap("n", ";w", ":w<cr>", { noremap = true, desc = "Save file" })
vim.api.nvim_set_keymap("n", ";q", ":q<cr>", { noremap = true, desc = "Quit" })
vim.api.nvim_set_keymap("n", ";i", ":e $MYVIMRC<cr>", { noremap = true, desc = "Edit init.lua" })
vim.api.nvim_set_keymap("n", ";d", ":Neogen<cr>", { noremap = true, desc = "Generate Annotation" })
