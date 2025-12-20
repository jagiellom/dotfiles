return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    vim.api.nvim_set_hl(0, "IblIndent", { link = "Comment" })
    require("ibl").setup {
      indent = { char = "┊", highlight = "IblIndent" },
      scope = {
        enabled = true,
        priority = 2000,
        show_start = false,
        show_end = false,
        char = { "┊" },
        highlight = "Keyword"
      },
    }
  end
}
