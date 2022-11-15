local h = require("helper")

local api = vim.api

local is_line_bullet_list = function(cur_line)
    for i = 1, #cur_line do
        local c = cur_line:sub(i, i)
        if c == '*' then
            if cur_line:sub(i + 1, i + 1) == ' ' then
                return true
            end
        else
            if c ~= ' ' then
                return false
            end
        end
    end
    return false
end

local get_indendation_line = function (cur_line)
    local indentation = 0
    for i = 1, #cur_line do
        local c = cur_line:sub(i, i)
        if c == ' ' then
            indentation = indentation + 1
        else
            return indentation
        end
    end
end


local create_new_bullet_list_entry = function(table)
    -- print(h.dump(table))
    local cur_line = api.nvim_get_current_line()
    local is_bullet_list = is_line_bullet_list(cur_line)

    if not is_bullet_list then
        print('no bullet list')
        return
    end

    local indentation = get_indendation_line(cur_line)
    print('indentation', indentation)
end

local mdGroup = api.nvim_create_augroup("ExpandMarkdown", { clear = true })

api.nvim_create_autocmd("InsertCharPre", {
    pattern = { "*.md" },
    callback = create_new_bullet_list_entry,
    group = mdGroup
})

return mdGroup
