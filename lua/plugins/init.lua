vim.pack.add({
    'https://github.com/HiPhish/rainbow-delimiters.nvim',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/NeogitOrg/neogit',
    'https://github.com/antosha417/nvim-lsp-file-operations',
    'https://github.com/folke/which-key.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-neo-tree/neo-tree.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/rcarriga/nvim-notify',
    'https://github.com/scottmckendry/cyberdream.nvim',
    'https://github.com/sindrets/diffview.nvim',
    'https://github.com/folke/noice.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/kevinhwang91/nvim-bqf',
    'https://github.com/junegunn/fzf',
    'https://github.com/OXY2DEV/helpview.nvim',
    'https://github.com/MagicDuck/grug-far.nvim',
    'https://github.com/cbochs/grapple.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-cmdline',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
});

require('plugins/cyberdream')
require('plugins/lsp')
require('lsp-file-operations').setup()
require('plugins/cmp')

require('plugins/treesitter')
require('grug-far').setup({})

require('neogit').setup()
require('noice').setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
    }
})

require('plugins/neotree')
require('lualine').setup()

