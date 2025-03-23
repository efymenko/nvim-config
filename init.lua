require("settings/basic_options")
require("lazy/lazy")

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "clangd" },
}

require("mason-lspconfig").setup_handlers {
    function (server_name)
        local coq = require "coq"
        require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities({}))
    end,
    ["lua_ls"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            settings = { Lua = { diagnostics = { globals = { "vim" } } } }
        }
    end,
}

require("keymaps")
vim.cmd([[colorscheme material-darker]])

