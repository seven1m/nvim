-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Logs to ~/.local/state/nvim/lsp.log
--vim.lsp.set_log_level("DEBUG")

-- we format with Conform -- not with ruby-lsp or solargraph
require("lazyvim.util").lsp.on_attach(function(client, _)
  --print(vim.inspect(client))
  if client.name == "ruby_ls" or client.name == "solargraph" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end)
