return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "ms-jpq/coq_nvim",
    { "linrongbin16/lsp-progress.nvim", opts = {}, },
    {
        'nvimdev/lspsaga.nvim',
        opts = {},
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    }
}
