return {
    'brenoprata10/nvim-highlight-colors',
    -- lazy = true,
    keys = {
        { '<leader>Tc', '<Cmd>HighlightColors Toggle<cr>', desc = 'Show Colors' },
    },
    config = function()
        require('nvim-highlight-colors').setup({
            render = 'background'
        })
    end
}
