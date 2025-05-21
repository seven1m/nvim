local copilot_node_command = "node"
local homebrew_node_path = "/opt/homebrew/bin/node"
if vim.fn.filereadable(homebrew_node_path) == 1 then
  copilot_node_command = homebrew_node_path
end

return {
  "zbirenbaum/copilot.lua",
  opts = {
    copilot_model = "gpt-4o-copilot",
    copilot_node_command = copilot_node_command,
  },
}
