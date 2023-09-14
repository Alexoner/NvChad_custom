---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["H"] = {":NvCheatsheet<CR>", "cheatsheet", opts = {}},
  },
}

-- more keybinds!

return M
