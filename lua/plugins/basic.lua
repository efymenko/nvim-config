return {
    {
    	"tversteeg/registers.nvim",
        cmd = "Registers",
        config = true,
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-R>", mode = "i" }
        },
        name = "registers",
    },
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
    { 'marko-cerovac/material.nvim', opts = {} }
}
