--vim = {}
--vim.on_key = function () end

local autocmd = require('autocmd')


--- is_bullet_list
local is_bullet_list = '* bla'
local is_bullet_list1 = '    * bla'
local is_no_bullet_list = '*'
local is_no_bullet_list1 = 'i*'

if not autocmd.is_bullet_list(is_bullet_list) and not autocmd.is_bullet_list(is_bullet_list1) then
    error('Error with: '..is_bullet_list)
end

if autocmd.is_bullet_list(is_no_bullet_list) and autocmd.is_bullet_list(is_no_bullet_list1) then
    error('Error with: '..is_no_bullet_list)
end

--- create_line
if autocmd.create_line(2) ~= '  *' and autocmd.create_line(2) == '  *' then
    error('error with 2 indentation')
end



print('no errors')
