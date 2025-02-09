return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme cyberdream")
    local hl_group = vim.api.nvim_get_hl(0, { name = "@keyword.type", link = false })
    hl_group.italic = false
    vim.api.nvim_set_hl(0, "@keyword.type", hl_group);
  end,
}
