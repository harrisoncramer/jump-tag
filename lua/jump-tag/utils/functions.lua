local constants = require("jump-tag.utils.constants")

local function coerce_ft ()
  local ft = vim.bo.filetype
  if ft == 'javascriptreact' then return 'jsx' end
end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function is_name_node (ft, type)
  return has_value(constants.tag_names[ft], type)
end

return {
  has_value = has_value,
  is_name_node = is_name_node,
  coerce_ft = coerce_ft
}
