return {
  "RRethy/nvim-treesitter-endwise",
  init = function()
    require("nvim-treesitter.configs").setup({
      endwise = {
        enable = true,
      },
    })
  end,
}
