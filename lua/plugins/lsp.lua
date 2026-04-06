return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            pylsp = { enabled = false }, -- Disable pylsp, keep pyright + ruff
        },
    },
}
