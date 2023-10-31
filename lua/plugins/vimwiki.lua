return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_map_prefix = "<leader>W"
    vim.g.vimwiki_global_ext = 0 -- only activate in the ~/vimwiki folder
  end,
}
