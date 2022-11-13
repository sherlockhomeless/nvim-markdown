local api = vim.api

-- markdown extend

local mdGroup = api.nvim_create_augroup("ExpandMarkdown", { clear = true})
local isLineBulletList = function ()
    local cur_line = api.nvim_get_current_line()
    print(cur_line)
end


api.nvim_create_autocmd("CursorMoved", {
    pattern = { "*.md"},
--    event = { 'CursorMoved' },
--    command = "silent! ",
    callback = isLineBulletList,
    group = mdGroup
})

return mdGroup
