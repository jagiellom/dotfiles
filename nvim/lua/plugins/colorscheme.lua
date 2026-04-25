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

    local function set_git_hunk_highlights()
      local colors = {
        Add = palette.green,
        Change = palette.orange,
        Delete = palette.red,
        Changedelete = palette.orange,
        Topdelete = palette.red,
        Untracked = palette.green,
      }

      for name, color in pairs(colors) do
        vim.api.nvim_set_hl(0, "GitSigns" .. name, { fg = color, bg = "NONE" })
        vim.api.nvim_set_hl(0, "GitSignsStaged" .. name, { fg = color, bg = "NONE" })
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("GitHunkHighlights", { clear = true }),
      callback = set_git_hunk_highlights,
    })

    vim.api.nvim_set_hl(0, "@type", { fg = palette.cyan })
    vim.api.nvim_set_hl(0, "@type.builtin.go", { link = "@type" })
    vim.api.nvim_set_hl(0, "@type.builtin.c", { link = "@type" })
    vim.api.nvim_set_hl(0, "@lsp.type.function.c", { link = "@variable" })
    set_git_hunk_highlights()
  end,
}
