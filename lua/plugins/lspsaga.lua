return {
    'nvimdev/lspsaga.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    ft = { 'python', 'dart', 'html', 'css', 'sh', 'bash', 'json', 'yaml', 'nix', 'rust', 'dockerfile', 'go', 'arduino', 'c', 'cpp' },
    keys = {
        { '<leader>ca', c('Lspsaga code_action'), desc = 'Code Actions' },
        { '<leader>co', c('Lspsaga outline'), desc = 'Code Outline' },
        { '<leader>cr', c('Lspsaga rename'), desc = 'Rename' },
        { '<leader>cd', c('Lspsaga goto_definition'), desc = 'Go To Definition' },
        { '<leader>ct', c('Lspsaga goto_definition'), desc = 'Go To Type Definition' },
        { '<leader>cpt', c('Lspsaga peek_definition'), desc = 'Peek Type Definition' },
        { '<leader>cpd', c('Lspsaga peek_definition'), desc = 'Peek Definition' },
        { '<leader>ck', c('Lspsaga hover_doc'), desc = 'Doc' },
        { '<leader>cf', c('Lspsaga finder'), desc = 'Finder' },
        { '<leader>cci', c('Lspsaga incoming_calls'), desc = 'Incoming Calls' },
        { '<leader>cco', c('Lspsaga outgoing_calls'), desc = 'Outgoing Calls' },
        { 'gd', c('Lspsaga goto_definition'), desc = 'Go To Definition' },
        { '<leader>ce', group = 'diagnostics', desc = 'diagnostics' },
        { '<leader>cew', c('Lspsaga show_workspace_diagnostics'), desc = 'Workspace Diagnostics' },
        { '<leader>ceb', c('Lspsaga show_buf_diagnostics'), desc = 'Buffer Diagnostics' },
        { '<leader>cel', c('Lspsaga show_line_diagnostics'), desc = 'Line Diagnostics' },
        { '<leader>cec', c('Lspsaga show_line_diagnostics'), desc = 'Cursor Diagnostics' },
    },
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                sign = false
            }
        })
    end
}
