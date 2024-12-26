return {
  'folke/zen-mode.nvim',
  dependencies = {
      'folke/twilight.nvim'
  },
  keys = {
      { '<leader>Tz', c('ZenMode'), desc = 'Zen Mode' }
  },
  opts = {
      window = {
          width = 100,
      },
      plugins = {
          twilight = { enabled = false },
      }
  }
}
