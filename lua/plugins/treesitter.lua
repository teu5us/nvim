return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            ensure_installed = 'all',
            highlight = { enable = true },
        })
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.filetype.add({
            pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }
        })
    end
}
