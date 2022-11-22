vim = {}
vim.on_key = function ()
   return 
end

local autocmd = require('autocmd')

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

print('no errors')
