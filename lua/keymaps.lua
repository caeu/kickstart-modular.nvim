-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands #czr replaced with tmux-nvim
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- <D-s> to save in all modes
vim.keymap.set({ '', '!' }, '<D-s>', function()
  vim.cmd 'write'
  print('FILE SAVED: ' .. vim.fn.expand '%:p')
end)

-- copy paste using <D-s> with system register
-- paste
vim.keymap.set({ 'n', 'v' }, '<D-v>', '"+P')
-- paste
vim.keymap.set({ 'i', 'c', 't' }, '<D-v>', '<C-r>+')
-- copy
vim.keymap.set({ 'v' }, '<D-c>', '"+y')

-- czr- highlight the visual selection after pressing enter.
-- https://vi.stackexchange.com/questions/20077/automatically-highlight-all-occurrences-of-the-selected-text-in-visual-mode
vim.cmd [[
  xnoremap <silent> <cr> "*y:silent! let searchTerm = '\V' .substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>
]]
-- Give ctrl+q a job when it is otherwise being wasted!
-- Now it toggles `hlsearch` while in NORMAL mode:
vim.cmd [[
  nnoremap <silent> <c-q> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
]]

-- to use :DiffOrig to the show the difference between the edited buffer and the last saved point of the file
vim.cmd [[
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
]]

-- Put <enter> to work too! Otherwise <enter> moves to the next line, which we can
-- already do by pressing the <j> key, which is a waste of keys!
-- Be useful <enter> key! Highlight all instances of the underlying word:
vim.cmd [[
  nnoremap <silent> <cr> :let searchTerm = '\v<'.expand("<cword>").'>' <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>
]]

-- restore cursor after leaving neovim
--  https://github.com/neovim/neovim/issues/4396#issuecomment-1377191592
vim.cmd [[
autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]]

-- vim: ts=2 sts=2 sw=2 et
