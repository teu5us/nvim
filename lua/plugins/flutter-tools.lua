return {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp',
        'lukas-reineke/lsp-format.nvim',
    },
    config = function()
        require('lsp-format').setup()
        local function on_attach(client, bufnr)
            require('lsp-format').on_attach(client, bufnr)
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require('flutter-tools').setup({
            widget_guides = {
                enabled = false,
            },
            outline = {
                auto_open = false,
                open_cmd = "40vnew",
            },
            lsp = {
                capabilities = capabilities,
                on_attach = on_attach,
                color = {
                    enabled = true,
                    virtual_text = true,
                    virtual_text_str = "■",
                },
            }
        })
    end
}
