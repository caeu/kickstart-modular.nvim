-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    -- https://github.com/mikavilpas/yazi.nvim
    ---@type LazySpec
    {
      'mikavilpas/yazi.nvim',
      event = 'VeryLazy',
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          '<leader>-',
          function()
            require('yazi').yazi()
          end,
          desc = 'Open the file manager',
        },
        {
          -- Open in the current working directory
          '<leader>cw',
          function()
            require('yazi').yazi(nil, vim.fn.getcwd())
          end,
          desc = "Open the file manager in nvim's working directory",
        },
        {
          '<c-up>',
          function()
            -- NOTE: requires a version of yazi that includes
            -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
            require('yazi').toggle()
          end,
          desc = 'Resume the last yazi session',
        },
      },
      ---@type YaziConfig
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = true,

        -- enable these if you are using the latest version of yazi
        -- use_ya_for_events_reading = true,
        -- use_yazi_client_id_flag = true,
        --
        -- the transparencyof the yazi floating window (0-100). see :h winblend
        yazi_floating_window_winblend = 20,

        keymaps = {
          show_help = '<f1>',
        },
      },
    },
  },
}
