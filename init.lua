vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

if vim.g.neovide then
  require 'neovide' -- lua/neovide.lua
end

-- [[ Setting options ]]
require 'options' -- lua/options.lua

-- [[ Basic Keymaps ]]
require 'keymaps' -- lua/keymaps.lua

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap' -- lua/lazy-bootstrap.lua

-- [[ Configure and install plugins ]]
require 'lazy-plugins' -- lua/lazy-plugins.lua

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
