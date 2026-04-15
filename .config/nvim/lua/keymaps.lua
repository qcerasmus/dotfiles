local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<nop>")
keymap( { "n", "v", "i" }, "<leader><leader>", "<esc>")
keymap("n", "<leader>nt", "<cmd>tabnew<cr>", s)
keymap("n", "<leader>_", "<cmd>vsplit<cr>", s)
keymap("n", "<leader>-", "<cmd>split<cr>", s)

local opts = { noremap = true, silent = true }
keymap("n", "bc", "<cmd>bd<cr>")
keymap("n", "-", "<cmd>Oil<cr>")
keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
keymap("n", "gk", "<cmd>lua vim.lsp.buf.format()<cr>")
keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-j>", "<C-W>j")
keymap("n", "<C-k>", "<C-W>k")
keymap("n", "<C-l>", "<C-W>l")
keymap("n", "gn", ":bnext<cr>")
keymap("n", "gp", ":bprevious<cr>")
