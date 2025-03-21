return {
  "stevearc/conform.nvim",
  opts = {
    -- log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      bash = { "shfmt" },
      cpp = { "clang_format" },
      javascript = { "eslint_d", "prettier" },
      javascriptreact = { "eslint_d", "prettier" },
      ruby = { "syntax_tree", lsp_format = "never" },
      typescript = { "eslint_d", "prettier" },
      typescriptreact = { "eslint_d", "prettier" },
    },
    stop_after_first = true,
    formatters = {
      --injected = { options = { ignore_errors = true } },
      --
      -- NOTE: If this doesn't work, then be sure to install eslint_d:
      --
      --     npm install eslint_d
      eslint_d = {
        condition = function(_, ctx)
          local b = vim.b[vim.api.nvim_get_current_buf()]
          if b.eslint_has_prettier ~= nil then
            return b.eslint_has_prettier
          end

          b.eslint_has_prettier = false
          local path =
            vim.fs.find({ ".eslintrc", ".eslintrc.js", ".eslintrc.json" }, { path = ctx.filename, upward = true })[1]
          if path then
            local file = io.open(path, "r")
            if file then
              local content = file:read("*a") -- *a or *all reads the whole file
              if string.find(content, "prettier/prettier") or string.find(content, "prettier/recommended") then
                b.eslint_has_prettier = true
              end
              file:close()
            end
          end

          return b.eslint_has_prettier
        end,
      },
      syntax_tree = {
        tmpfile_format = "$FILENAME.conform.tmp",
        args = { "write", "$RELATIVE_FILEPATH" },
        condition = function(_, ctx)
          local path = vim.fs.find({ ".streerc" }, { path = ctx.filename, upward = true })[1]
          if path then
            return true
          else
            return false
          end
        end
      }
    },
  },
}
