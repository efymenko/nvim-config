-- my_rainbow_ts.lua
-- Радужная подсветка скобок для Neovim с Tree-sitter
-- () [] {} с мягкими цветами, игнорированием комментариев и строк

local M = {}
local ns = vim.api.nvim_create_namespace("my_rainbow_ts")

-- Цвета мягкие и в нужном порядке
local colors = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
}

-- Определяем highlight группы
vim.cmd("highlight RainbowDelimiterRed     guifg=#D16D6D gui=bold")
vim.cmd("highlight RainbowDelimiterYellow  guifg=#D1D18A gui=bold")
vim.cmd("highlight RainbowDelimiterBlue    guifg=#8AA6D1 gui=bold")
vim.cmd("highlight RainbowDelimiterOrange  guifg=#D1A77C gui=bold")
vim.cmd("highlight RainbowDelimiterGreen   guifg=#8AD18A gui=bold")
vim.cmd("highlight RainbowDelimiterViolet  guifg=#B48AD1 gui=bold")
vim.cmd("highlight RainbowDelimiterCyan    guifg=#8AD1D1 gui=bold")

-- Скобки
local brackets_open = { ["("]=true, ["["]=true, ["{"]=true }
local brackets_close = { [")"]="(", ["]"]="[", ["}"]="{" }

-- Типы узлов, которые нужно игнорировать полностью
local ignore_types = {
    comment = true,
    string = true,
    string_literal = true,
    char_literal = true,
}

-- Рекурсивная функция обхода дерева
local function highlight_node(bufnr, node, stack)
    local ntype = node:type()
    if ignore_types[ntype] then
        return -- игнорируем комментарии и строки полностью
    end

    -- Получаем диапазон узла
    local srow, scol, erow, ecol = node:range()
    local lines = vim.api.nvim_buf_get_lines(bufnr, srow, erow + 1, false)

    for i, line in ipairs(lines) do
        local row = srow + i - 1
        local start_col = 1
        local end_col = #line
        if i == 1 then start_col = scol + 1 end
        if i == #lines then end_col = ecol end

        for col = start_col, end_col do
            local char = line:sub(col, col)
            if brackets_open[char] then
                local color = colors[#stack % #colors + 1]
                table.insert(stack, {char=char, color=color})
                vim.api.nvim_buf_add_highlight(bufnr, ns, color, row, col - 1, col)
            elseif brackets_close[char] then
                if #stack > 0 and stack[#stack].char == brackets_close[char] then
                    local top = table.remove(stack)
                    vim.api.nvim_buf_add_highlight(bufnr, ns, top.color, row, col - 1, col)
                else
                    -- Незакрытая скобка
                    vim.api.nvim_buf_add_highlight(bufnr, ns, colors[1], row, col - 1, col)
                end
            end
        end
    end

    -- Рекурсивно для всех детей
    for child in node:iter_children() do
        highlight_node(bufnr, child, stack)
    end
end

-- Основная функция подсветки буфера
function M.highlight_buffer()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    local ok, parser = pcall(vim.treesitter.get_parser, bufnr, vim.bo.filetype)
    if not ok or not parser then return end

    local tree = parser:parse()[1]
    if not tree then return end

    highlight_node(bufnr, tree:root(), {})
end

-- Автокоманды для автообновления подсветки
vim.api.nvim_create_augroup("MyRainbowTS", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "TextChanged", "InsertLeave"}, {
    group = "MyRainbowTS",
    callback = M.highlight_buffer
})

return M


