return {
    'natecraddock/sessions.nvim',
    keys = {
        { '<leader>qs', function() require('sessions').save() end, desc = 'Save Session' },
        { '<leader>ql', function() require('sessions').load() end, desc = 'Load Session' },
    },
    config = function()
        require('sessions').setup({
            events = { 'VimLeavePre' },
            session_filepath = vim.fn.stdpath('data') .. '/sessions',
            absolute = true
        })
    end
}
