return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
        select = {
          keymaps = {
            ["if"] = { query = "@function.inner", desc = "Select inside function" },
            ["af"] = { query = "@function.outer", desc = "Select around function" },
            ["ic"] = { query = "@class.inner", desc = "Select inside class" },
            ["ac"] = { query = "@class.outer", desc = "Select around class" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inside parameter/argument" },
            ["aa"] = { query = "@parameter.outer", desc = "Select around parameter/argument" },
          },
          --selection_modes = {
          --["@function.inner"] = "V",
          --["@function.outer"] = "V",
          --["@class.inner"] = "V",
          --["@class.outer"] = "V",
          --},
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>csna"] = { query = "@parameter.inner", desc = "Swap parameter/argument with next one" },
            ["<leader>csnf"] = { query = "@function.outer", desc = "Swap function with next one" },
          },
          swap_previous = {
            ["<leader>cspa"] = { query = "@parameter.inner", desc = "Swap parameter/argument with previous one" },
            ["<leader>cspf"] = { query = "@function.outer", desc = "Swap function with previous one" },
          },
        },
      },
    },
    init = function()
      local wk = require("which-key")
      wk.register({
        s = {
          desc = "+swap",
          n = { desc = "+swap next" },
          p = { desc = "+swap previous" },
        },
        prefix = "<leader>c",
      })
    end,
  },
}
