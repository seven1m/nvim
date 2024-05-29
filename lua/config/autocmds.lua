-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363#issuecomment-1538607633
vim.cmd("autocmd FileType ruby setlocal indentkeys-=. indentkeys-=0{")

-- https://vi.stackexchange.com/questions/6512/neovim-hides-the-chars-when-editing-markdown
vim.cmd("autocmd FileType markdown set conceallevel=0")
vim.cmd("autocmd FileType json set conceallevel=0")

-- Autoformat Ruby only if there is an .streerc
local utils = require("utils")
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "ruby",
  callback = function()
    vim.b.autoformat = utils.project_has_syntax_tree_config()
  end,
})
