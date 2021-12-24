fun! Reload()
  lua for k in pairs(package.loaded) do if k:match("^jump%-tag") then package.loaded[k] = nil end end
endfun

fun! JumpParent()
  call Reload()
  lua require("jump-tag").jumpParent()
endfun

fun! JumpNextSibling()
  call Reload()
  lua require("jump-tag").jumpNextSibling()
endfun

fun! JumpPrevSibling()
  call Reload()
  lua require("jump-tag").jumpPrevSibling()
endfun

augroup JumpTag
  autocmd!
augroup END
