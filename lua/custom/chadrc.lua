---@type ChadrcConfig
local M = {}
M.ui = {
  theme = 'onenord',
  hl_override = {
    Comment = { fg = "vibrant_green" },
    DiffChange = { fg = "yellow" },
    LineNr = { fg = "orange"}
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
