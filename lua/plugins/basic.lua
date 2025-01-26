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
            { "3rd/image.nvim", opts = {} },
        }
    },
    { "kevinhwang91/nvim-hlslens" },
    { 'marko-cerovac/material.nvim', opts = {} },
    { "nvim-lualine/lualine.nvim", opts = {} },
    { "kevinhwang91/nvim-bqf", opts = {} },
    { "https://codeberg.org/esensar/nvim-dev-container", opts = {} },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
        },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "nvim-hlslens", "gitsigns.nvim" },
        opts = {}
    }
}
