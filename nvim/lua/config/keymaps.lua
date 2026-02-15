-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- close current buffer with ctrl + x
vim.keymap.set("n", "<C-x>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- tabs stuff
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Prev Buffer" })
-- to close window type <Crtl+w> c

-- comment
vim.keymap.set("n", "<leader>f/", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
vim.keymap.del("n", "<leader>/") -- unmap so I could map comment one here
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle Comment" })

-- reload LSP
vim.keymap.set("n", "<leader>cR", ":LspRestart<CR>", { desc = "Restart LSP" })

-- settings for diffview.nvim plugin
-- vim.keymap.set(
--   "n",
--   "<leader>g/",
--   ":DiffviewOpen<CR>",
--   { desc = "Show diff on current file", noremap = true, silent = true }
-- )
-- vim.keymap.set("n", "<leader>g|", ":DiffviewToggleFiles<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
vim.keymap.set("n", "<leader>gD", ":DiffviewToggleFiles<CR>", { desc = "Toggle Diffview Files" })

vim.api.nvim_create_user_command("DebugKeymaps", function()
  local gd = vim.fn.maparg("<leader>gd", "n")
  local gD = vim.fn.maparg("<leader>gD", "n")
  print("✓ <leader>gd:", gd)
  print("✓ <leader>gD:", gD)
end, {})
