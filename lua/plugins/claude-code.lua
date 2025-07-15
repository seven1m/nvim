return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  opts = function(_, opts)
    local local_claude_path = vim.fn.expand("~/.claude/local/claude")
    if vim.fn.filereadable(local_claude_path) == 1 then
      opts.command = "/opt/homebrew/bin/node ~/.claude/local/node_modules/.bin/claude"
    else
      opts.command = "/opt/homebrew/bin/node claude"
    end
  end,
}
