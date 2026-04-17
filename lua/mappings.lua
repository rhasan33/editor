require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<leader>cc', '<cmd>ClaudeCode<CR>', { desc = 'Toggle Claude Code' })

-- DAP (debugger) keymaps
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "DAP Continue" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "DAP Step Into" })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "DAP Step Over" })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "DAP Step Out" })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "DAP Terminate" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
