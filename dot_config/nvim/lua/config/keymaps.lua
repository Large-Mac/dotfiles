-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>nn", ":Denote note<cr>", { desc = "New note" })
vim.keymap.set({ "n", "v" }, "<leader>nt", ":Denote title<cr>", { desc = "Change title" })
vim.keymap.set({ "n", "v" }, "<leader>nk", ":Denote keywords<cr>", { desc = "Change keywords" })
vim.keymap.set({ "n", "v" }, "<leader>nz", ":Denote signature<cr>", { desc = "Change signature" })
vim.keymap.set({ "n", "v" }, "<leader>ne", ":Denote extension<cr>", { desc = "Change extension" })
