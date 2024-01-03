-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3363#issuecomment-1538607633
vim.cmd("autocmd FileType ruby setlocal indentkeys-=. indentkeys-=0{")

-- https://vi.stackexchange.com/questions/6512/neovim-hides-the-chars-when-editing-markdown
vim.cmd("autocmd FileType markdown set conceallevel=0")
vim.cmd("autocmd FileType json set conceallevel=0")
