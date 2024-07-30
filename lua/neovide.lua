-- neovide settings
local allmodes = { '', '!', 't' }

vim.g.neovide_input_use_logo = true
vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.opt.linespace = 5
local change_scale_lineheight = function(delta)
  vim.opt.linespace = vim.g.opt.linespace + delta
end

-- increase font size
vim.keymap.set(allmodes, '<D-=>', function()
  change_scale_factor(1.1)
end)

-- decrease font size
vim.keymap.set(allmodes, '<D-->', function()
  change_scale_factor(1 / 1.1)
end)

-- reset font size
vim.keymap.set(allmodes, '<D-0>', function()
  vim.g.neovide_scale_factor = 1.0
end)

-- increase line height
vim.keymap.set(allmodes, '<D-+>', function()
  change_scale_lineheight(1)
end)

-- decrease line height
vim.keymap.set(allmodes, '<D-_>', function()
  change_scale_lineheight(1)
end)

-- reset line height
vim.keymap.set(allmodes, '<D-_>', function()
  vim.opt.linespace = 5
end)
