return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
    opts = {
      context = "bffers",
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    },
    init = function()
      local wk = require("which-key")
      wk.register({ ["<leader>C"] = { name = "+CopilotChat" } })
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>Ct",
        "<cmd>CopilotChatToggle<cr>",
        desc = "Toggle floating window",
      },
      { "<leader>Ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
      { "<leader>CT", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
      {
        "<leader>Cf",
        "<cmd>CopilotChatFixDiagnostic<cr>",
        desc = "Fix diagnostic under cursor",
      },
      {
        "<leader>Cr",
        "<cmd>CopilotChatReset<cr>",
        desc = "Reset chat history and clear buffer",
      },
    },
  },
}
