vim.pack.add({
    'https://github.com/joshdick/onedark.vim',
    'https://github.com/junegunn/fzf.vim',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/vim-airline/vim-airline-themes',
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/rcarriga/nvim-dap-ui',
    'https://github.com/nvim-neotest/nvim-nio',
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
require("dap").adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-dap",
    name = "lldb"
}
local lldb = {
    name = "Launch lldb",
    type = "lldb",
    request = "launch",
    program = function()
        return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
        )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false
}
require('dap').configurations.cpp = {
    lldb
}
local dap, dapui = require("dap"), require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
vim.api.nvim_create_user_command("DapCloseUI", function()
    require("dapui").close()
end, {})
