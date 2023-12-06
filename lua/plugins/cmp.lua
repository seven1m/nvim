return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Disable default selection when Enter is pressed. Use Ctrl-Y. :-)
    opts.mapping["<CR>"] = nil -- was: require("cmp").mapping.confirm({ select = true })
    return opts
  end,
}
