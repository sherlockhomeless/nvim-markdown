local helpers = {}

function helpers.create_indented_line(indentation_level)
    local ws = ' '
    local s = ''
    for _ = 1, indentation_level do
        s = s..ws
    end
    s = s..'*'
    return s
end

function helpers.dump (o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. helpers.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return helpers
