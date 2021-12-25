local ts_utils = require("nvim-treesitter.ts_utils")

local opts = {
  verbose = false
}

local get_tag_name_from_element
get_tag_name_from_element = function (node)
  for n in node:iter_children() do
    if(n == nil) then
      if opts.verbose == true then
        error("That node has no children")
      end
      return nil
    end
    local type = n:type()
    if type == 'tag_name' then
      return n
    end
    -- Recurse until finding tag_name
    if n:child_count() ~= 0 then
      return get_tag_name_from_element(n)
    end
  end
  error("Could not find tag name.")
end

local get_prev_sibling_of_same_type = function (node)
  local type = node:type()
  local sibling = node:prev_sibling()
  if(sibling == nil) then
      if opts.verbose == true then
        error("There is no previous sibling")
      end
      return nil
  end

  while sibling:type() ~= type do
    sibling = sibling:prev_sibling()
    if(sibling == nil) then
      if opts.verbose == true then
        error("There is no previous sibling")
      end
      return nil
    end
  end
  return sibling
end

local get_next_sibling_of_same_type = function (node)
  local type = node:type()
  local sibling = node:next_sibling()
  if(sibling == nil) then
    if opts.verbose == true then
      error("There is no next siling")
    end
    return nil
  end

  while sibling:type() ~= type do
    sibling = sibling:next_sibling()
    if(sibling == nil) then
      if opts.verbose == true then
        error("There is no next sibling")
      end
      return nil
    end
  end
  return sibling
end

local get_parent = function (node)
  local prev = ts_utils.get_previous_node(node, true, true)
  if(prev == nil) then
    if opts.verbose == true then
      error("There is no parent")
    end
    return nil
  end
  while(prev:parent() == node:parent()) do
    if(prev == nil) then
      if opts.verbose == true then
        error("There is no parent")
      end
      return nil
    end
    node = prev
    if(ts_utils.get_previous_node(prev, true, true) == nil) then
      -- If we're at the last node...
      return node
    end
    prev = ts_utils.get_previous_node(prev, true, true)
  end
  return node
end

local get_master_node = function ()
  local node = ts_utils.get_node_at_cursor()
  if node == nil then
    error("No Treesitter parser found.")
  end
  local start_row = node:start()
  local parent = node:parent()
  while(parent ~= nil and parent:start() == start_row) do
    node = parent
    parent = node:parent()
  end
  return node
end

local jumpParent = function ()
  local node = get_master_node()
  local parent = get_parent(node)
  if(parent == nil) then
    return
  end
  local tag_name = parent:child(1)
  if(tag_name == nil) then
    return
  end
  ts_utils.goto_node(tag_name)
end

local jumpNextSibling = function ()
  local node = get_master_node()
  local sibling = get_next_sibling_of_same_type(node)
  if(sibling == nil) then
    return
  end
  local tag_name = get_tag_name_from_element(sibling)
  ts_utils.goto_node(tag_name)
end

local jumpPrevSibling = function ()
  local node = get_master_node()
  local sibling = get_prev_sibling_of_same_type(node)
  if(sibling == nil) then
    return
  end
  local tag_name = get_tag_name_from_element(sibling)
  ts_utils.goto_node(tag_name)
end

return {
  jumpParent = jumpParent,
  jumpNextSibling = jumpNextSibling,
  jumpPrevSibling = jumpPrevSibling
}
