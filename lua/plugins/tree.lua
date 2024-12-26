return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        { '<leader>ot', c('NvimTreeToggle'), desc = 'Tree' },
    },
    config = function()
        require('nvim-tree').setup({
            hijack_cursor = true,
            hijack_netrw = false,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
            },
        })

        -- local tree_api = require('nvim-tree.api')
        -- local tree_group = vim.api.nvim_create_augroup('NvimTree', { clear = true })
        -- vim.api.nvim_create_autocmd('TabNewEntered', {
        --     callback = function()
        --         if tree_api.tree.is_visible({ any_tabpage = true }) then
        --             tree_api.tree.open()
        --         end
        --     end
        -- })
    end
}
