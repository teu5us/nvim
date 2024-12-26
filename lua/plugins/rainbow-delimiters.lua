return {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'ColorScheme',
    config = function()
        require('rainbow-delimiters.setup').setup()
    end
}
