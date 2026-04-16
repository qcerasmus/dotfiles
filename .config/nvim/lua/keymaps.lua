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
keymap("n", "rs", ":call vimspector#Reset()<cr>")

--Debugger stuff
keymap("n", "<F9>", "<cmd>DapToggleBreakpoint<cr>")
keymap("n", "<F5>", "<cmd>DapContinue<cr>")
keymap("n", "<F10>", "<cmd>DapStepOver<cr>")
keymap("n", "<F11>", "<cmd>DapStepInto<cr>")
keymap("n", "<F12>", "<cmd>DapStepOut<cr>")
keymap("n", "<leader>rs", "<cmd>DapTerminate<cr><cmd>DapCloseUI<cr>")

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = { 'cpp', 'c', 'h', 'hpp' },
    callback = function(opts)
        keymap("n", "<C-b>", "<cmd>!./build.sh<cr>")
        keymap("n", "<C-r>", "<cmd>!./build.sh release<cr>")
    end,
})

autocmd("FileType", {
    pattern = { 'cs' },
    callback = function(opts)
        keymap("n", "<C-b>", "<cmd>!dotnet build<cr>")
        keymap("n", "<C-b>", "<cmd>:!dotnet build --configuration Release<cr>")
    end,
})

