-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- this file grows indefinitely and I only care about the current session
os.remove(vim.env.HOME .. "/.local/state/nvim/lsp.log")
vim.lsp.set_log_level("WARN") -- other options: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"

local utils = require("utils")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- print(client.name)
    -- print(vim.inspect(client))
    if client.name == "ruby_lsp" or client.name == "solargraph" then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    elseif client.name == "ts_ls" then
      if utils.project_has_old_typescript() then
        print("This project has old typescript")
        client.server_capabilities.inlayHintProvider = false
      end
    end
  end,
})

vim.opt.relativenumber = false
