return {
    'asiryk/auto-hlsearch.nvim',
    event = 'BufEnter',
    config = function()
        require('auto-hlsearch').setup()
    end
}
