return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      highlights = {
        Normal = {
          guibg = "#16181a"
        }
      },
      shade_terminals = false
    }
    local map = vim.keymap
    map.set('t', "<C-c>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    map.set('t', "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    map.set('t', "<C-K>", "<C-\\><C-n><C-w><C-K>")
    map.set('n', "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Launch toggleterm" })

    vim.api.nvim_set_hl(0, "ToggleTerm1Normal", { bg = "#16181a" })
  end,
}
