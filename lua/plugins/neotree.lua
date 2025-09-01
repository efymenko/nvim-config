require('neo-tree').setup({
    filesystem = {
        window = {
            mappings = {
                ["/"] = "noop",
                ["f"] = "fuzzy_finder",
            },
        },
    },
})
