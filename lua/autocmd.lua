local h = require("helper")

local M = {}

M.is_bullet_list = function(cur_line)
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

M.get_indendation_line = function(cur_line)
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

M.create_line = function(indentation)
    local indented_line = ''
    for _ = 1, indentation do
        indented_line = indented_line .. ' '
    end
    indented_line = indented_line .. '* '
    return indented_line
end

M.create_new_bullet_list_entry = function(key)

    local api = vim.api
    local file_type = vim.bo.filetype
    if file_type ~= 'markdown' then
        return
    end

    local mode = vim.api.nvim_get_mode()["mode"]
    if mode ~= 'i' then
        return
    end

    local cur_line_num = api.nvim_win_get_cursor(0)[1]
    local cont_prev_line = api.nvim_buf_get_lines(0, cur_line_num - 2, cur_line_num - 1, false)[1]
    local cont_cur_line = api.nvim_buf_get_lines(0, cur_line_num -1 , cur_line_num, false)[1]

    print('prev line: ', cont_prev_line, '\ncont_cur_line: ', cont_cur_line)

    if cur_line_num == 1 then
        return
    end

    -- cont_prev_line is bullet_list_line
    -- print('key pressed: ', key, 'type: ', type(key), 'bytes: ', string.byte(key))

    if string.byte(key) == 13 then
        -- check if previouse line was bullet list line
        if not is_line_bullet_list(cont_prev_line) then
            print('exiting, no bullet list: ', cont_prev_line)
            return
        end

        print('prev_line', cont_prev_line)
        local indent = get_indendation_line(cont_prev_line)
        local indented_line = create_line(indent)
        local lines = {}
        lines[1] = indented_line

        print(h.dump(lines))

--       api.nvim_buf_set_lines(0, cur_line_num, cur_line_num, false, lines)
        api.nvim_exec([[norm i]]..indented_line, false)
    end

end

vim.on_key(create_new_bullet_list_entry)

return M
