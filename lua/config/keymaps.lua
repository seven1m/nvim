-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function unmap(mode, lhs)
  vim.keymap.del(mode, lhs)
end

local wk = require("which-key")

map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<leader>wH", "<C-w>H", { desc = "Move window left", remap = true })
map("n", "<leader>wJ", "<C-w>J", { desc = "Move window down", remap = true })
map("n", "<leader>wK", "<C-w>K", { desc = "Move window up", remap = true })
map("n", "<leader>wL", "<C-w>L", { desc = "Move window right", remap = true })

map("n", "<leader>wc", "<C-w>c", { desc = "Close this window", remap = true })
map("n", "<leader>ws", "<C-w>s", { desc = "Split this window horizontally", remap = true })
map("n", "<leader>wv", "<C-w>v", { desc = "Split this window vertically", remap = true })
map("n", "<leader>wo", "<C-w>o", { desc = "Close all windows but this one", remap = true })
map("n", "<leader>w=", "<C-w>=", { desc = "Resize all windows evenly", remap = true })

wk.register({ ["<leader>j"] = { name = "+jump" } })
map("n", "<leader>ja", ":lua vim.lsp.buf.code_action()<CR>", {})
map("n", "<leader>jb", ":Telescope buffers<CR>", { desc = "List buffers in project", remap = true })
map("n", "<leader>jd", ":Telescope lsp_definitions<CR>", { desc = "List LSP definitions in project", remap = true })
map("n", "<leader>jf", ":Telescope find_files<CR>", { desc = "List files in project", remap = true })
map("n", "<leader>jg", ":Telescope live_grep<CR>", { desc = "Search for strings in project", remap = true })
map("n", "<leader>jr", ":Telescope lsp_references<CR>", { desc = "List LSP references in project", remap = true })
map("n", "<leader>jr", ":Telescope lsp_references<CR>", { desc = "List LSP references in project", remap = true })
map(
  "n",
  "<leader>js",
  ":Telescope treesitter<CR>",
  { desc = "Lists Function names and variables from Treesitter", remap = true }
)
map("n", "<leader>jt", ":Telescope tags<CR>", { desc = "List tags in project", remap = true })

--map(
--"n",
--"<leader>jS",
--":Telescope lsp_document_symbols<CR>",
--{ desc = "List all Treesitter symbols in project", remap = true }
--)
--map(
--"n",
--"<leader>jW",
--"<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<cr>",
--":Telescope lsp_workspace_symbols{}<CR>",
--{ desc = "List all Treesitter symbols in project", remap = true }
--)

--map("n", "K", vim.lsp.buf.hover)
--map("n", "H", vim.lsp.buf.implementation)
--map("n", "S", vim.lsp.buf.signature_help)

map("n", "<leader>clr", ":LspRestart<CR>", { desc = "Restart LSP", remap = true })

-- I don't use Vim tabs
unmap("n", "<leader><tab>l")
unmap("n", "<leader><tab>f")
unmap("n", "<leader><tab><tab>")
unmap("n", "<leader><tab>]")
unmap("n", "<leader><tab>d")
unmap("n", "<leader><tab>[")

-- Alt j/k also doubles as <Esc>j and <Esc>k which I accidentally do all the time!
unmap("n", "<A-j>")
unmap("n", "<A-k>")
unmap("i", "<A-j>")
unmap("i", "<A-k>")
unmap("v", "<A-j>")
unmap("v", "<A-k>")
-- Let's change it to Ctrl-j and Ctrl-k.
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- And let's use Ctrl-h and Ctrl-l for navigating the bufferline.
map("n", "<C-h>", ":BufferLineCyclePrev<CR>")
map("n", "<C-l>", ":BufferLineCycleNext<CR>")

map("n", "<leader><tab>", ":b#<CR>", { desc = "Switch to last Buffer", remap = true })

-- blackhole those single-character deletes
map("n", "x", '"_x', { noremap = true })
map("n", "X", '"_X', { noremap = true })

-- open in GitHub
map("n", "<Leader>G", ":OpenInGHFile<CR>", { desc = "Open in GitHub", silent = true, noremap = true })
map("v", "<Leader>G", ":OpenInGHFileLines<CR>", { desc = "Open in GitHub", silent = true, noremap = true })

-- show file path for current buffer
map("n", "<Leader>fp", ':echo expand("%:p")<CR>', { desc = "Display current file path", noremap = true })
map("n", "<Leader>fy", ':let @* = expand("%:p")<CR>', { desc = "Yank current file path", noremap = true })

-- additional Neotest mappings
local neotest = require("neotest")
map("n", "<Leader>ta", function()
  neotest.run.attach()
end, { desc = "Attach to running process", noremap = true })

local function alternateFile()
  local file_path = vim.fn.expand("%")
  if string.find(file_path, "spec/") then
    return file_path:gsub("spec/", "app/"):gsub("_spec.rb", ".rb")
  else
    return file_path:gsub("app/", "spec/"):gsub(".rb", "_spec.rb")
  end
end

wk.register({ ["<leader>a"] = { name = "+alternate" } })
map("n", "<Leader>aa", function()
  vim.api.nvim_command("edit " .. alternateFile())
end, { desc = "Open alternate file", silent = true, noremap = true })
map("n", "<Leader>as", function()
  vim.api.nvim_command("split " .. alternateFile())
end, { desc = "Open alternate file in horizontal split", silent = true, noremap = true })
map("n", "<Leader>av", function()
  vim.api.nvim_command("vsplit " .. alternateFile())
end, { desc = "Open alternate file in vertical split", silent = true, noremap = true })

map("v", "<Leader>cf", function()
  vim.lsp.buf.format({
    async = true,
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    },
  })
end, { desc = "Format selection", silent = true, noremap = true })
