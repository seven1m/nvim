return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.diagnostics.underline = false

    local inlay_hints_settings = {
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayParameterNameHints = "literals",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
    }

    -- opts.inlay_hints.enabled = false

    opts.servers = vim.tbl_deep_extend("force", opts.servers, {
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
      tsserver = {
        settings = {
          typescript = {
            inlayHints = inlay_hints_settings,
          },
          javascript = {
            inlayHints = inlay_hints_settings,
          },
        },
      },
      vtsls = {
        -- This is buggy on my machine. Keeps saying:
        --
        --     Cannot find provider for feature
        enabled = false,
      },
    })

    return opts
  end,
}
