return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
        local wk = require('which-key')
        local wke = require('which-key.extras')
        local telescope = require('telescope')
        local sessions = require('sessions')

        -- vim.o.timeout = true
        -- vim.o.timeoutlen = 300
        --
        -- local lmu = require('langmapper.utils')
        -- local view = require('which-key.view')
        -- local execute = view.execute
        --
        -- -- wrap `execute()` and translate sequence back
        -- view.execute = function(prefix_i, mode, buf)
        --   -- Translate back to English characters
        --   prefix_i = lmu.translate_keycode(prefix_i, 'default', 'ru')
        --   execute(prefix_i, mode, buf)
        -- end
        --
        -- -- If you want to see translated operators, text objects and motions in
        -- -- which-key prompt
        -- -- local presets = require('which-key.plugins.presets')
        -- -- presets.operators = lmu.trans_dict(presets.operators)
        -- -- presets.objects = lmu.trans_dict(presets.objects)
        -- -- presets.motions = lmu.trans_dict(presets.motions)
        -- -- etc

        function telescope_recent(cwd)
            cwd = cwd or false
            telescope.extensions.recent_files.pick({ only_cwd = cwd })
        end

        wk.add({
            {
                '<leader>?',
                function()
                    wk.show({ global = false })
                end,
                desc = 'Buffer Local Keys'
            },
            { '<leader>;', ':', desc = 'CmdLine' },

            -- WINDOWS
            { '<leader>w', proxy = '<C-w>', group = 'windows' },
            {
                '<C-s>',
                group = 'winswitch',
                expand = function()
                    return wke.expand.win()
                end
            },
            { '<C-h>', '<C-w>h', desc = 'Go to the left window' },
            { '<C-l>', '<C-w>l', desc = 'Go to the right window' },
            { '<C-j>', '<C-w>j', desc = 'Go to the down window' },
            { '<C-k>', '<C-w>k', desc = 'Go to the up window' },

            -- BUFFERS
            {
                '<leader>b',
                group = 'buffers',
                expand = function()
                    return wke.expand.buf()
                end
            },
            { '<leader>bd', c('bdelete'), desc = 'Close Buffer' },

            -- TABS
            { '<leader>t', group = 'tab', desc = 'Tabs' },

            -- FILES
            { '<leader>f', group = 'file', desc = 'File Commands' },
            { '<leader>fs', c('w ++p'), desc = 'Save File' },

            -- SEARCH
            { '<leader>s', group = 'search', desc = 'Search Commands' },

            -- UTILS
            { '<leader>o', group = 'openers' },

            -- TOGGLES
            { '<leader>T', group = 'toggles' },

            -- SESSIONS
            { '<leader>q', group = 'session', desc = 'Session' },
            { '<leader>qq', c(':qall'), desc = 'Quit' },
            { '<leader>qQ', c('qall!'), desc = 'Force Quit' },

            -- LSP
            { '<leader>c', group = 'lsp', desc = 'LSP' },
            { '<leader>cp', group = 'peek', desc = 'Peek' },
            { '<leader>cc', group = 'calls', desc = 'Calls' },

            -- WORKSPACES
            { '<leader>p', group = 'workspace', desc = 'Workspaces' },
        })
    end
}
