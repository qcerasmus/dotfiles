vim.pack.add({
    'https://github.com/joshdick/onedark.vim',
    'https://github.com/junegunn/fzf.vim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/vim-airline/vim-airline-themes',
})
require("oil").setup()
require("nvim-autopairs").setup()
require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    }
})
