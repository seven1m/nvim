return {
  "codeindulgence/vim-tig",
  init = function()
    local wk = require("which-key")
    wk.add({ "<leader>ct", group = "tig" })
  end,
  keys = {
    {
      "<leader>ctb",
      function()
        vim.cmd("Tig blame " .. vim.fn.expand("%"))
      end,
      desc = "Tig blame current file",
    },
    {
      "<leader>cts",
      function()
        vim.cmd("Tig status")
      end,
      desc = "Tig status",
    },
    {
      "<leader>ctl",
      function()
        vim.cmd("Tig log")
      end,
      desc = "Tig log",
    },
    {
      "<leader>ctL",
      function()
        vim.cmd("Tig log " .. vim.fn.expand("%"))
      end,
      desc = "Tig log current file",
    },
  },
}
