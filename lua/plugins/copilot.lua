return {
  "zbirenbaum/copilot.lua",
  opts = function()
    local node_path = "/opt/homebrew/bin/node"
    local copilot_node_command = vim.fn.filereadable(node_path) == 1 and node_path or "node"
    return {
      copilot_model = "gpt-4o-copilot",
      copilot_node_command = copilot_node_command,
    }
  end,
}
