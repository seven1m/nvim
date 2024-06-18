local M = {}

function M.find_nearest_path(path)
  return vim.fs.find(path, { path = vim.api.nvim_buf_get_name(0), upward = true })[1]
end

function M.project_has_syntax_tree_config()
  local b = vim.b[vim.api.nvim_get_current_buf()]
  if b.has_stree ~= nil then
    return b.has_stree
  end

  local stree_path = M.find_nearest_path({ ".streerc" })
  b.has_stree = stree_path and true or false
  return b.has_stree
end

function M.project_has_old_typescript()
  local version = M.get_typescript_version()
  if not version then
    return false
  end
  return version:match("^3") and true or false
end

function M.get_typescript_version()
  local path = M.find_nearest_path({ "yarn.lock", "package-lock.json" })
  local file = io.open(path, "r")
  if not file then
    return nil
  end

  for line in file:lines() do
    if line:find("^typescript@") then
      file:close()
      return line:match("@%^*(.+):")
    end
  end

  file:close()
  return nil
end

return M
