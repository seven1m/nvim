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

    opts.inlay_hints = {
      enabled = true,
      exclude = { "ruby" },
    }

    opts.servers = vim.tbl_deep_extend("force", opts.servers, {
      ruby_lsp = {
        mason = false,
        -- You need to install rubocop and ruby-lsp:
        --
        --     gem install ruby-lsp rubocop
        --
        cmd_env = {
          -- Neovim is overwriting GEM_HOME somehow.
          -- Setting it back to the value set by Devbox,
          -- which is also stored by Devbox in RUBY_CONFDIR.
          GEM_HOME = vim.env.RUBY_CONFDIR,
        },

        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" },
        },
      },
      syntax_tree = {
        mason = false,
        cmd_env = {
          -- Neovim is overwriting GEM_HOME somehow.
          -- Setting it back to the value set by Devbox,
          -- which is also stored by Devbox in RUBY_CONFDIR.
          GEM_HOME = vim.env.RUBY_CONFDIR,
        },
        -- You need to install syntax_tree
        --
        --     gem install syntax_tree
        --
      },
      tsserver = {
        cmd_env = {
          PATH = "node_modules/.bin:" .. vim.env.PATH,
        },
        settings = {
          typescript = {
            inlayHints = inlay_hints_settings,
          },
          javascript = {
            inlayHints = inlay_hints_settings,
          },
        },
        -- You need to install typescript-language-server
        --
        --     npm i typescript-language-server
      },
      vtsls = {
        -- This is buggy on my machine. Keeps saying:
        --
        --     Cannot find provider for feature
        enabled = false,
      },
      eslint = {
        enabled = true,
      },
    })

    return opts
  end,
}
