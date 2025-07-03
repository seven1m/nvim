return {
  "zbirenbaum/copilot.lua",
  opts = function()
    local node_command = "node"
    local homebrew_node = "/opt/homebrew/bin/node"

    -- Check if the homebrew node path exists
    local f = io.open(homebrew_node, "r")
    if f then
      f:close()
      node_command = homebrew_node
    end

    return {
      copilot_model = "gpt-4o-copilot",
      copilot_node_command = node_command,
    }
  end,
}
