return {
    'vladdoster/remember.nvim',
    event = 'BufReadPost',
    config = function()
        require('remember')
    end
}
