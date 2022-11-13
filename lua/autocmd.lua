local api = vim.api

-- helper functions

local is_bullet_list = function(cur_line)
    for i = 1, #cur_line do
        local c = cur_line:sub(i, i)
        if c == '*' then
            if cur_line:sub(i + 1, i + 1) == ' ' then
                print(cur_line)
                return
            end
        else
            if c ~= ' ' then
                return false
            end
        end
    end
    return false
end



local mdGroup = api.nvim_create_augroup("ExpandMarkdown", { clear = true })
local isLineBulletList = function()
    local cur_line = api.nvim_get_current_line()
    if not is_bullet_list(cur_line)
    then
        return
    end
end


api.nvim_create_autocmd("CursorMoved", {
    pattern = { "*.md" },
    --    event = { 'CursorMoved' },
    --    command = "silent! ",
    callback = isLineBulletList,
    group = mdGroup
})

return mdGroup
