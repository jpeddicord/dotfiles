-- Keymaps are automatically loaded on the VeryLazy event
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set
local del = vim.keymap.del

-- open explorer on space-a
map("n", "<Leader>a", function()
  if Snacks.picker.get({ source = "explorer" })[1] == nil then
    Snacks.picker.explorer()
  else
    Snacks.picker.get({ source = "explorer" })[1]:focus()
  end
end, { desc = "Focus explorer" })

-- fully remove lazyvim's window movements; remapped below
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

-- experimental colemak movement swaps
-- do
--   -- K => down (j), N => up (k); H and L remain left and right
--   -- J becomes N since N is now up
--   map("n", "k", "j")
--   map("n", "K", "J")
--   map("n", "n", "k")
--   map("n", "N", "K")
--   map("n", "j", "n")
--   map("n", "J", "N")
-- end

-- colemak extend layer; mostly for ipad over ssh. emulated with ctrl.
do
  -- move cursor with unei
  map({ "n", "i" }, "<C-u>", "<Up>")
  map({ "n", "i" }, "<C-n>", "<Left>")
  map({ "n", "i" }, "<C-e>", "<Down>")
  map({ "n", "i" }, "<C-i>", "<Right>")
  -- move to window with ctrl-w ctrl-unei chords
  map({ "n" }, "<C-w><C-u>", "<C-w><Up>")
  map({ "n" }, "<C-w><C-n>", "<C-w><Left>")
  map({ "n" }, "<C-w><C-e>", "<C-w><Down>")
  map({ "n" }, "<C-w><C-i>", "<C-w><Right>")
  -- home, end, pgup, pgdn
  map({ "n", "i" }, "<C-l>", "<Home>")
  map({ "n", "i" }, "<C-y>", "<End>")
  map({ "n", "i" }, "<C-j>", "<PageUp>")
  map({ "n", "i" }, "<C-h>", "<PageDown>")
  -- backspace, delete, esc
  map({ "n", "i" }, "<C-a>", "<BS>")
  map({ "n", "i" }, "<C-o>", "<BS>")
  map({ "n", "i" }, "<C-;>", "<Del>")
  map({ "n", "i" }, "<C-q>", "<Esc>")
end
