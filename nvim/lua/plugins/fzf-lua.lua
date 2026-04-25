return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  ---
  config = function()
    local map = vim.keymap
    map.set("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
    map.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Grep files" })
    map.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
  end
}
