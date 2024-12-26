return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'hrsh7th/nvim-cmp',
        {
            'stevearc/dressing.nvim',
            opts = {},
        },
        'nvim-telescope/telescope.nvim',
        'echasnovski/mini.diff',
    },
    keys = {
        { '<leader>a', group = 'assistant', desc = 'assistant' },
        { '<leader>ac', c('CodeCompanionToggle'), desc = 'Chat', mode = { 'n', 'v' } },
        { '<leader>aa', c('CodeCompanion'), desc = 'Inline Assistant', mode = { 'n', 'v' } },
        { '<leader>ap', ':CodeCompanion ', desc = 'Inline Assistant Cmdline', mode = { 'n', 'v' } },
        { '<leader>aA', c('CodeCompanionActions'), desc = 'Actions', mode = { 'n', 'v' } },
    },
    config = function()
        require('codecompanion').setup({
            strategies = {
                chat = {
                    adapter = 'ollama'
                },
                inline = {
                    adapter = 'ollama'
                },
                agent = {
                    adapter = 'ollama'
                },
            },
            adapters = {
                ollama = function()
                    return require('codecompanion.adapters').extend('ollama', {
                        env = {
                            url = 'http://localhost:11434',
                            -- api_key = 'OLLAMA_API_KEY',
                        },
                        headers = {
                            ['Content-Type'] = 'application/json',
                            -- ['Authorization'] = 'Bearer ${api_key}',
                        },
                        parameters = {
                            sync = true,
                        },
                        schema = {
                            model = {
                                default = 'codestral'
                            }
                        }
                    })
                end,
            },
        })
    end
}
