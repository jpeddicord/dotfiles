-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.relativenumber = false

vim.g.snacks_animate = false

-- better colors for snacks explorer
vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })
