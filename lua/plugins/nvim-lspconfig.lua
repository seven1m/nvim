return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = false,
    },
    servers = {
      ruby_ls = {
        mason = false, -- ruby-lsp installs itself
      },
      syntax_tree = {},
    },
  },
}
