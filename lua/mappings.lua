require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

---- Dknt customized ----
-- Exchange code between lines
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- `x`, `d` to null buffer
map("x", "p", '"_dP')
map("n", "y", '"+y')
map("v", "y", '"+y')
map("n", "Y", '"+Y')
map("n", "d", '"_d')
map("v", "d", '"_d')
map("n", "x", '"+x')
map("v", "x", '"+x')

-- Move the view
map({ "n", "v" }, "<A-j>", "<C-e>", { noremap = true, silent = true })
map({ "n", "v" }, "<A-k>", "<C-y>", { noremap = true, silent = true })
map("i", "<A-j>", "<Esc><C-e>a", { noremap = true, silent = true })
map("i", "<A-k>", "<Esc><C-y>a", { noremap = true, silent = true })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("i", "<C-x>", "<Esc> dbi", { noremap = true, silent = true })

-- Doge DocGen
vim.api.nvim_del_keymap("n", "<leader>d")
map("n", "<Leader>dg", ":DogeGenerate 1<CR>", { noremap = true, silent = true })
map({"i" }, "kk", "<Plug>(doge-comment-jump-forward)")

-- Copilot
map("i", "`<Tab>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
}) vim.g.copilot_no_tab_map = true

map({ "n", "v", "i" }, "<C-f>", "<C-u>", { noremap = true, silent = true })
map({ "n", "v", "i" }, "<C-u>", "<C-i>", { noremap = true, silent = true })

-- DAP
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })
map("n", "<leader>dt", "<cmd>DapStepOver<CR>", { desc = "Step over" })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })
map("n", "<leader>do", "<cmd>DapStepOut<CR>", { desc = "Step out" })
