return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_ls = {
        mason = false, -- I want to install it myself -- not with Mason
      },
    },
  },
}
