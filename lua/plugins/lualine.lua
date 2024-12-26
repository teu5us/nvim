return {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'Mofiqul/dracula.nvim',
        'folke/tokyonight.nvim',
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'tokyonight-night'
            }
        })
    end
}
