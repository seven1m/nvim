local function path_exists(path)
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local node_path = "/opt/homebrew/bin/node"
if not path_exists(node_path) then
  node_path = "node"
end

return {
  "zbirenbaum/copilot.lua",
  opts = {
    -- copilot_model = "gpt-4o-copilot",
    copilot_node_command = node_path,
  },
}
