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
        mason = false,
        -- You need to install rubocop and ruby-lsp:
        --
        --     gem install ruby-lsp rubocop
        --
        --cmd_env = { BUNDLE_GEMFILE = ".ruby-lsp/Gemfile" },
        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" },
        },
      },
      syntax_tree = {
        mason = false,
        -- You need to install syntax_tree
        --
        --     gem install syntax_tree
        --
      },
    },
  },
}
