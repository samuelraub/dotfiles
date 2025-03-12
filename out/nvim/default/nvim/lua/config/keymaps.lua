-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

---
--TELEKASTEN--
---

-- Most used functions
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

---
--DELETE BUFFERS--
---

vim.keymap.del("n", "<leader>bd")

vim.keymap.set("n", "<leader>bdd", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>bda", function()
  Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })

---
--SEARCH AND REPLACE--
---

vim.keymap.del("n", "<leader>sr")

vim.keymap.set("n", "<leader>srb", function()
  require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Search and replace in buffer" })

vim.keymap.set("n", "<leader>sra", function()
  require("grug-far").open()
end, { desc = "Search and replace in CWD" })
