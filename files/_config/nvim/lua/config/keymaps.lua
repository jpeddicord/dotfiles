-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- open explorer on space-a
map("n", "<Leader>a", function()
	if Snacks.picker.get({ source = "explorer" })[1] == nil then
		Snacks.picker.explorer()
	else
		Snacks.picker.get({ source = "explorer" })[1]:focus()
	end
end, { desc = "Focus explorer" })
