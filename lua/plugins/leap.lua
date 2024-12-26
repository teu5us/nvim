return {
    'ggandor/leap.nvim',
    lazy = false,
    dependencies = {
        'tpope/vim-repeat',
    },
    config = function()
        -- require("leap.util")["get-input"] = function()
        --     local ok, ch = pcall(vim.fn.getcharstr)
        --     if ok and ch ~= vim.api.nvim_replace_termcodes("<esc>", true, false, true) then
        --         return require("langmapper.utils").translate_keycode(ch, "default", "ru")
        --     end
        -- end
        --
        -- require('leap').create_default_mappings()
        vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap)')
        vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end
}
