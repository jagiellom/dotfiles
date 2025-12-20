-- return {
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme cyberdream")
--     local hl_group = vim.api.nvim_get_hl(0, { name = "@keyword.type", link = false })
--     hl_group.italic = false
--     vim.api.nvim_set_hl(0, "@keyword.type", hl_group);
--   end
--
-- }

-- return {
--   "vague2k/vague.nvim",
--   lazy = false,
--   config = function()
--     require("vague").setup({
--       italic = false,
--     })
--     vim.cmd("colorscheme vague")
--   end,
-- }
--
--
return {
  "aktersnurra/no-clown-fiesta.nvim",
  config = function()
    local palette = require("no-clown-fiesta.palette")
    vim.cmd("colorscheme no-clown-fiesta")

    vim.api.nvim_set_hl(0, "@type", { fg = palette.cyan })
    vim.api.nvim_set_hl(0, "@type.builtin.go", { link = "@type" })
  end,
}
