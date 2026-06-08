-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>K")

-- close current buffer with ctrl + x
vim.keymap.set("n", "<C-x>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- tabs stuff
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Prev Buffer" })

vim.keymap.set("n", "<leader>f/", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
vim.keymap.set("n", "<leader>f.", function()
  Snacks.picker.grep({ cwd = vim.fn.getcwd() })
end, { desc = "Grep (CWD)" })

-- comment
vim.keymap.del("n", "<leader>/") -- unmap so I could map comment one here
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle Comment" })

-- reload LSP
vim.keymap.set("n", "<leader>cV", ":LspRestart<CR>", { desc = "Restart LSP" })

-- settings for diffview.nvim plugin
vim.keymap.set("n", "<leader>g/", function()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end, { desc = "Toggle Diffview", silent = true })

-- vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
