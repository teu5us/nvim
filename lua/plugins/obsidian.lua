return {
    "epwalsh/obsidian.nvim",
    version = "*",
    keys = {
        { '<leader>n', group = 'notes', desc = 'notes' },
        { '<leader>ns', c('ObsidianSearch'), desc = 'Find Note' },
        { '<leader>not', c('ObsidianTOC'), desc = 'TOC' },
        { '<leader>no', group = 'open', desc = 'open' },
        { '<leader>nol', c('ObsidianLinks'), desc = 'Links' },
        { '<leader>nob', c('ObsidianBacklinks'), desc = 'Backlinks' },
        { '<leader>not', c('ObsidianTags'), desc = 'Tags' },
        { '<leader>nw', c('ObsidianWorkspace'), desc = 'Workspace' },
        { '<leader>nr', c('ObsidianRename'), desc = 'Rename' },
        { '<leader>nf', c('ObsidianQuickSwitch'), desc = 'Open Note' },
        { '<leader>nn', c('ObsidianNew'), desc = 'New Note' },
        { '<leader>nl', c('ObsidianLink'), desc = 'Link', mode = 'v' },
        { '<leader>nL', c('ObsidianLinkNew'), desc = 'Link New', mode = 'v' },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp"
    },
    opts = {
        disable_frontmatter = true,
        workspaces = {
            {
                name = 'personal',
                path = '~/Obsidian Vault',
            },
        },
        daily_notes = {
            folder = 'daily',
            date_format = '%d-%m-%Y',
        },
        templates = {
            folder = 'templates',
            date_format = '%d-%m-%Y',
        },
        note_id_func = function(title) return title end,
        follow_url_func = function(url) vim.fn.jobstart({'xdg-open', url}) end,
        follow_img_func = function(img) vim.fn.jobstart({'xdg-open', img}) end,
    },
}
