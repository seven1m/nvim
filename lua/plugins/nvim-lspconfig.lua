return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = false,
    },
    --inlay_hints = {
    --enabled = true,
    --},
    --codelens = {
    --enabled = true,
    --},
    servers = {
      ruby_lsp = {
        -- NOTE TO SELF: If you get weird errors that don't go away when you save the file,
        -- you probably need to add 'rubocop' to the gemfile of the project!
        -- And if nothing works at all, try `gem install ruby-lsp` followed by `ruby-lsp` and Ctrl-C.
        mason = false, -- I install myself please
        cmd_env = { BUNDLE_GEMFILE = ".ruby-lsp/Gemfile" },
      },
      syntax_tree = {
        mason = false, -- I install myself please
      },
    },
  },
}
