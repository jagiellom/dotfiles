local M = {}

M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    width = 45
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
