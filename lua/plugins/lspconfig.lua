return {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
        'hrsh7th/nvim-cmp',
        'lukas-reineke/lsp-format.nvim',
    },
    config = function()
        require('lsp-format').setup()
        local function on_attach(client, bufnr)
            require('lsp-format').on_attach(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require('lspconfig')

        lspconfig.arduino_language_server.setup({
            cmd = {
                'arduino-language-server',
                '-cli-config',
                '~/.arduino15/arduino-cli.yaml',
                '-fqbn',
                'esp32:esp32:esp32',
                '-clangd', 'clangd',
                '-cli', 'arduino-cli',
                -- '-log',
            }
        })

        lspconfig.basedpyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        })
        
        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            -- cmd = { "clangd", "--background-index", "--query-driver=~/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20230928/**/bin/xtensa-esp-elf-*" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        })

        lspconfig.dockerls.setup({})
        lspconfig.docker_compose_language_service.setup({})

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = { "rustls" },
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig.nixd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ['nixd'] = {
                    formatting = {
                        command = { 'nixfmt' }
                    }
                }
            }
        })

        lspconfig.marksman.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig.html.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig.cssls.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        local black_group = vim.api.nvim_create_augroup('Black', { clear = true })
        vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = '*.py',
            command = 'silent !black %',
            group = black_group
        })

        local docker_compose_group = vim.api.nvim_create_augroup('DockerCompose', { clear = true })
        local function set_filetype(pattern, filetype)
            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                pattern = pattern,
                command = "set filetype=" .. filetype,
                group = docker_compose_group
            })
        end

        set_filetype({ "docker-compose.yml", "docker-compose.yaml", "compose.yaml", "compose.yml" }, "yaml.docker-compose")
    end
}
