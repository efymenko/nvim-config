return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    { "kevinhwang91/nvim-hlslens" },
    { 'marko-cerovac/material.nvim', opts = {} },
    { "nvim-lualine/lualine.nvim", opts = {} },
    { "kevinhwang91/nvim-bqf", opts = {} },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}
