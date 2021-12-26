local elements = {
    jsx = {'jsx_element', 'jsx_self_closing_element', 'jsx_fragment'},
    html = {'element'}
}
local tag_names = {jsx = {'identifier'}, html = {'tag_name'}}
return {elements = elements, tag_names = tag_names}
