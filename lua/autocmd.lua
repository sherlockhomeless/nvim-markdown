local api = vim.api

-- markdown extend

local mdGroup = api.nvim_create_augroup("ExpandMarkdown", { clear = true})
    api.nvim_create_autocmd("ExpandBulletList", {
    pattern = { "*.md"},
    event = { 'CursorMoved' },
--    command = "silent! ",
    callback = function () print('CursorMoved') end,
    group = mdGroup
})

return mdGroup
