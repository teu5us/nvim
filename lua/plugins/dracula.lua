return {
    'Mofiqul/dracula.nvim',
    lazy = true,
    priority = 1000,
    config = function()
        vim.cmd([[colo dracula]])
    end
}
