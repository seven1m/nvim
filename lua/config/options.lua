-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- this file grows indefinitely and I only care about the current session
os.remove(vim.env.HOME .. "/.local/state/nvim/lsp.log")
vim.lsp.set_log_level("WARN") -- other options: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"

local utils = require("utils")

require("lazyvim.util").lsp.on_attach(function(client, _)
  --print(vim.inspect(client))
  if client.name == "ruby_ls" or client.name == "solargraph" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  if client.name == "syntax_tree" and not utils.project_has_syntax_tree_config() then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end)
