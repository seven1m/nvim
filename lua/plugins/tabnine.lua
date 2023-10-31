return {
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "tabnine" } }))
    end,
  },
}
