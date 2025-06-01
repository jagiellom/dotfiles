return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local mason = require("mason")
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local map = vim.keymap
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(e)
        local opts = { buffer = e.buf, silent = true }
        opts.desc = "Find all references"
        map.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Find definitions"
        map.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Go to declaration"
        map.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Rename"
        map.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
        opts.desc = "Show code actions"
        map.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Format buffer"
        map.set({ "n", "v" }, "<leader>fm", vim.lsp.buf.format, opts)
        opts.desc = "Show docs"
        map.set({ "n", "v" }, "<leader>dc", vim.lsp.buf.hover, opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason.setup()
    mason_lspconfig.setup()

    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })

    lspconfig.gopls.setup({
      capabilities = capabilities
    })

    lspconfig.pylsp.setup({
      capabilities = capabilities
    })
  end,
}
