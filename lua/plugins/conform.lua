return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      cpp = { "clang_format" },
      javascript = { { "eslint_d", "prettier" } },
      javascriptreact = { { "eslint_d", "prettier" } },
      typescript = { { "eslint_d", "prettier" } },
      typescriptreact = { { "eslint_d", "prettier" } },
      ruby = { { "stree" } },
    },
    formatters = {
      --injected = { options = { ignore_errors = true } },
      eslint_d = {
        condition = function(ctx)
          local eslint_has_prettier = false
          local path = vim.fs.find({ ".eslintrc.json" }, { path = ctx.filename, upward = true })[1]
          if path then
            local file = io.open(path, "r")
            if file then
              local content = file:read("*a") -- *a or *all reads the whole file
              if string.find(content, "prettier/prettier") then
                eslint_has_prettier = true
              end
              file:close()
            end
          end
          return eslint_has_prettier
        end,
      },
      stree = {
        inherit = false,
        command = "bundle",
        args = { "exec", "stree", "format", "$FILENAME" },
        condition = function(ctx)
          local config_path = vim.fs.find({ ".streerc" }, { path = ctx.filename, upward = true })[1]
          if config_path then
            return true
          else
            return false
          end
        end,
      },
    },
  },
}
