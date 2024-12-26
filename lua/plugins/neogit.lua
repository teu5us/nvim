return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
      { '<leader>og', c('Neogit'), desc = 'NeoGit' }
  };
  opts = {
      integrations = {
          telescope = true,
          diffview = true
      }
  },
  config = true
}
