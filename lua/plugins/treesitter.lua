return {
    {
        enabled = false,
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = function()
            return require "settings/treesitter"
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
