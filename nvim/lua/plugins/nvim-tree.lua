return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

nvimtree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  view = {
    relativenumber = true,
  },
})

    local map = vim.keymap
    map.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle nvim tree"})
    map.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", {desc = "Focus nvim tree"})
    map.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", {desc = "Find file in nvim tree"})
  end,
}
