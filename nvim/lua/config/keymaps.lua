vim.g.mapleader = " "

local map = vim.keymap

map.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

map.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
map.set("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

map.set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help", remap = true })


map.set("n", "<M-,>", "<C-w>5<", { desc = "Resize left"})
map.set("n", "<M-.>", "<C-w>5>", { desc = "Resize right"})
map.set("n", "<M-;>", "<C-w>-", { desc = "Resize down"})
map.set("n", "<M-'>", "<C-w>+", { desc = "Resize up"})
map.set("t", "<M-q>", "<C-\\><C-n>", { desc = "Exit terminal mode"})
