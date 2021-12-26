local ts_utils = require("nvim-treesitter.ts_utils")
local constants = require("jump-tag.utils.constants")
local f = require("jump-tag.utils.functions")

local opts = {verbose = false}

-- Gets node at cursor
local get_master_node = function()
    local node = ts_utils.get_node_at_cursor()
    if node == nil then error("No Treesitter parser found.") end
    return node
end

-- Gets enclosing HTML/JSX Element
local get_enclosing_element = function(ft, node)
    if (node == nil) then return end
    local parent = node:parent()
    if (parent == nil) then return end

    while not f.has_value(constants.elements[ft], parent:type()) do
        parent = parent:parent()
        if (parent == nil) then return nil end
    end
    return parent
end

local get_parent = function(node)
  if node == nil then return end
  return node:parent()
end

local get_prev_element = function(ft, node)
    if (node == nil) then return end
    local sibling = node:prev_sibling()
    if (sibling == nil) then
        if opts.verbose == true then
            error("There is no previous sibling")
        end
        return nil
    end

    while not f.has_value(constants.elements[ft], sibling:type()) do
        sibling = sibling:prev_sibling()
        if (sibling == nil) then
            if opts.verbose == true then
                error("There is no previous sibling")
            end
            return nil
        end
    end
    return sibling
end

local get_next_element = function(ft, node)
    if (node == nil) then return end
    local sibling = node:next_sibling()
    if (sibling == nil) then
        if opts.verbose == true then error("There is no next sibling") end
        return nil
    end

    while not f.has_value(constants.elements[ft], sibling:type()) do
        sibling = sibling:next_sibling()
        if (sibling == nil) then
            if opts.verbose == true then
                error("There is no next sibling")
            end
            return nil
        end
    end
    return sibling
end

-- Gets tag name to jump to
local get_tag_name_from_element
get_tag_name_from_element = function(ft, node)
    if (node == nil) then return end
    for child in node:iter_children() do
        if (child == nil) then
            if opts.verbose == true then
                error("That node has no children")
            end
            return nil
        end
        if f.is_name_node(ft, child:type()) then
            return child
        end
        if child:child_count() ~= 0 then
            return get_tag_name_from_element(ft, child)
        else
        end
    end

    -- If node does not have children and is a valid top-level node
    if (node:type() == 'jsx_fragment') then return node end
end

local jumpParent = function()
    local ft = f.coerce_ft()
    local node = get_master_node()
    local element = get_enclosing_element(ft, node)
    local parent = get_parent(element)
    local tag_name = get_tag_name_from_element(ft, parent)
    ts_utils.goto_node(tag_name)
end

local jumpNextSibling = function()
    local ft = f.coerce_ft()
    local node = get_master_node()
    local element = get_enclosing_element(ft, node)
    local sibling = get_next_element(ft, element)
    local tag_name = get_tag_name_from_element(ft, sibling)
    ts_utils.goto_node(tag_name)
end

local jumpPrevSibling = function()
    local ft = f.coerce_ft()
    local node = get_master_node()
    local element = get_enclosing_element(ft, node)
    local sibling = get_prev_element(ft, element)
    local tag_name = get_tag_name_from_element(ft, sibling)
    ts_utils.goto_node(tag_name)
end

return {
    jumpParent = jumpParent,
    jumpNextSibling = jumpNextSibling,
    jumpPrevSibling = jumpPrevSibling
}
