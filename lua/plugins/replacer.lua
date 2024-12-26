return {
    'gabrielpoca/replacer.nvim',
    opts = {
        rename_files = false,
    },
    keys = {
        {
            '<leader>sr', function() require('replacer').run() end, desc = 'Replacer',
        }
    },
}
