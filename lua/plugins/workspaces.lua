return {
    'natecraddock/workspaces.nvim',
    dependencies = {
        'natecraddock/sessions.nvim',
        'nvim-tree/nvim-tree.lua',
    },
    keys = {
        { '<leader>pa', c('WorkspacesAdd'), desc = 'Add Workspace' },
        { '<leader>pd', c('WorkspacesRemove'), desc = 'Remove Workspace' },
    },
    config = function()
        require('workspaces').setup({
            hooks = {
                open = { 'NvimTreeOpen', 'Telescope find_files' },
                open_pre = { 'SessionsStop', 'silent %bdelete!' }
            }
        })
    end
}
