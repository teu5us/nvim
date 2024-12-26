return {
    'nanozuki/tabby.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'Mofiqul/dracula.nvim',
        'folke/tokyonight.nvim',
    },
    keys = {
        { '<leader>tt', c('Tabby jump_to_tab'), desc = 'Choose Tab' },
        { '<leader>ta', c('$tabnew'), desc = 'Add Tab' },
        { '<leader>td', c('tabclose'), desc = 'Kill Tab' },
    },
    config = function()
        require('tabby').setup({
            preset = 'active_wins_at_tail',
            option = {
                lualine_theme = 'tokyonight-night',
                nerdfont = true,
                -- tab_name = {
                --     name_fallback = function(tabid)
                --         return tabid
                --     end
                -- },
                buf_name = {
                    mode = 'unique',
                },
            },
        })
    end
}
