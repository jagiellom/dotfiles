return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    require("ibl").setup {
      indent = { char = "|" },
      scope = {
        enabled = true,
        priority = 2000,
        show_start = false,
        show_end = false,
        char = { "▎" },
        highlight = { "Keyword" }
      },
    }
  end
}
