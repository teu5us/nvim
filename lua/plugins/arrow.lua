return {
    'otavioschwanck/arrow.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('arrow').setup({
            show_icons = true,
            leader_key = '<leader>M',
            buffer_leader_key = '<leader>m'
        })
    end
}
