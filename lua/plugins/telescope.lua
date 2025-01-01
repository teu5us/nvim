return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'natecraddock/workspaces.nvim',
        'smartpde/telescope-recent-files',
        'lpoto/telescope-docker.nvim',
        'LukasPietzschmann/telescope-tabs',
        'nvim-telescope/telescope-file-browser.nvim',
        { 
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        }
    },
    keys = {
        {
            '<leader>wt',
            c('Telescope telescope-tabs list_tabs theme=dropdown'),
            desc = 'Select Tab'
        },
        { '<leader>bb', c('Telescope buffers'), desc = 'Buffer List' },
        { '<leader>,', c('Telescope buffers'), desc = 'Buffer List' },
        { '<leader>ff', c('Telescope find_files'), desc = 'Find File' },
        { '<leader>.', c('Telescope find_files'), desc = 'Find File' },
        { '<leader>fr', function() telescope_recent(false) end, desc = 'Recent File' },
        -- { '<leader>ss', c('Telescope live_grep'), desc = 'Live Grep' },
        { '<leader>ss', c('lua require("telescope").extensions.live_grep_args.live_grep_args()'), desc = 'Live Grep' },
        { '<leader>od', c('Telescope docker'), desc = 'Docker' },
        { '<leader>of', c('Telescope file_browser'), desc = 'File Browser' },
        -- { '<leader>;', c('Telescope commands'), desc = 'Command' },
        -- { '<leader>:', c('Telescope command_history'), desc = 'Command History' },
        { '<leader>h', c('Telescope help_tags'), desc = 'Help' },
        { '<leader>pp', c('Telescope workspaces'), desc = 'Change Workspace' },
        { '<leader>pr', function() telescope_recent(true) end, desc = 'Recent File' },
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local lga_actions = require("telescope-live-grep-args.actions")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-h>'] = 'which_key',
                        ["<C-l>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                    n = {
                        ["<C-l>"] = actions.send_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                find_files = {
                    theme = 'ivy',
                },
                live_grep = {
                    theme = 'ivy',
                },
                buffers = {
                    theme = 'dropdown',
                    previewer = false,
                },
                commands = {
                    theme = 'dropdown',
                },
                help_tags = {
                    theme = 'dropdown',
                },
                command_history = {
                    theme = 'dropdown',
                },
            },
            extensions = {
                workspaces = {
                    theme = 'ivy',
                    keep_insert = true,
                    path_hl = 'String'
                },
                docker = {
                    theme = 'ivy',
                },
                recent_files = {
                    theme = 'ivy',
                },
                file_browser = {
                    theme = 'ivy',
                    hijack_netrw = true,
                },
                live_grep_args = {
                    auto_quoting = false,
                    theme = 'ivy',
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                    },
                },
            }
        })

        -- EXTENSIONS
        telescope.load_extension('workspaces')
        telescope.load_extension('recent_files')
        telescope.load_extension('docker')
        telescope.load_extension('file_browser')
        telescope.load_extension('telescope-tabs')
        telescope.load_extension('live_grep_args')
        require('telescope-tabs').setup({
            show_preview = false,
            theme = 'dropdown'
        })
    end
}
