return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = false,
    },
    servers = {
      ruby_ls = {
        -- NOTE TO SELF: If you get weird errors that don't go away when you save the file,
        -- you probably need to add 'rubocop' to the gemfile of the project!
        mason = false, -- I install myself please
      },
      syntax_tree = {
        mason = false, -- I install myself please
      },
    },
  },
}
