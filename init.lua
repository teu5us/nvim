-- Basics
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.number = true
--vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = true
-- vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showtabline = 2
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
vim.opt.clipboard = 'unnamedplus'
vim.g.direnv_auto = 1
vim.o.foldenable = false
vim.o.conceallevel = 1
vim.o.linebreak = true
-- vim.o.completeopt = 'menu,menuone,noinsert'

vim.opt.title = true
-- vim.opt.titlestring = [[%f %h%m%r%w %{v:progname} (%{tabpagenr()} of %{tabpagenr('$')})]]
vim.opt.titlestring = [[%{substitute(getcwd(), $HOME, '~', '')}/%t %h%m%r%w %{v:progname} (%{tabpagenr()} of %{tabpagenr('$')})]]

-- Syntax and ft
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.g.mapleader = ' '

vim.cmd([[
nnoremap <C-z> /<C-^><C-c>
vnoremap <C-z> /<C-^><C-c>
lnoremap <C-z> <C-^>
inoremap <C-z> <C-^>
cnoremap <C-z> <C-^>
onoremap <C-z> <C-^>
inoremap <C-\> /
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1
]])

function c(cmd, input)
    input = input or false
    if input == true then
        return ':' .. cmd .. ' '
    else
        return '<Cmd>' .. cmd .. '<cr>'
    end
end

require('config.lazy')
-- require('lazy').setup('plugins')

-- require('lazy').setup({
--     spec = { import = 'plugins' },
--     change_detection = {
--         notify = false,
--     },
--     reset_packpath = false,
--     performance = {
--         rtp = {
--             reset = false
--         }
--     }
-- })
