local constants = require("jump-tag.utils.constants")

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function is_name_node (ft, type)
  if ft == 'jsx' then
    return constants.tag_names['jsx'] == type
  end
end

return {
  has_value = has_value,
  is_name_node = is_name_node
}
