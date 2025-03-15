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

---
--SUBSTITUTE--
---

vim.keymap.set("n", "<leader>su", ":%s/<c-r><c-w>//gc<left><left><left>", { desc = "Substitute" })
vim.keymap.set("v", "<leader>su", function()
  local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
  vim.api.nvim_feedkeys(esc, "x", false)

  local _, ls, cs = unpack(vim.fn.getpos("'<")) -- start of selection
  local _, le, ce = unpack(vim.fn.getpos("'>")) -- end of selection
  local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)

  local selection
  if #lines == 1 then
    selection = string.sub(lines[1], cs, ce)
  else
    selection = lines[1]:sub(cs) .. "\n" .. table.concat(lines, "\n", 2, #lines - 1) .. "\n" .. lines[#lines]:sub(1, ce)
  end

  selection = vim.fn.escape(selection, "/\\")

  vim.api.nvim_feedkeys(":%s/" .. selection .. "//gc", "n", false)

  local move_cursor = vim.api.nvim_replace_termcodes("<left><left><left>", true, false, true)
  vim.api.nvim_feedkeys(move_cursor, "n", false)
end, { desc = "Search and replace with visual selection", silent = true })
