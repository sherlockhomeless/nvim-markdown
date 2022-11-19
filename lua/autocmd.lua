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

local get_indendation_line = function(cur_line)
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
    local cur_line = api.nvim_get_current_line()
    local is_cur_line_bullet_list = is_line_bullet_list(cur_line)

    if not is_cur_line_bullet_list then
        return
    end

    local cur_line_num = api.nvim_win_get_cursor(0)[1]
    local cont_prev_line = api.nvim_buf_get_lines(0, cur_line_num - 2, cur_line_num - 1, false)[1]

   iiii 

    print(h.dump(table))
end

local mdGroup = api.nvim_create_augroup("ExpandMarkdown", { clear = true })

api.nvim_create_autocmd("TextChangedI", {
    pattern = { "*.md" },
    callback = create_new_bullet_list_entry,
    group = mdGroup,
})

return mdGroup
