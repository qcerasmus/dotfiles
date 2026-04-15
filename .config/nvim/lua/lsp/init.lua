vim.lsp.config('clang', {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'h', 'hpp' },
})
vim.lsp.enable('clang')

vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
})
vim.lsp.enable('luals')
