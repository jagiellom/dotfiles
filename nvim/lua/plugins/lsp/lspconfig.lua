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
        map.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)
        opts.desc = "Find definitions"
        map.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)
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

    mason.setup()
    mason_lspconfig.setup({
      automatic_installation = false,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })

    lspconfig.pylsp.setup({
      capabilities = capabilities
    })

    lspconfig.clangd.setup({
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
      },
      capabilities = capabilities,
      handlers = {
        ["textDocument/signatureHelp"] = function() end,
      },
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      virtual_text = false,
      underline = true,
      severity_sort = true,
      update_in_insert = false,
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
    })
    vim.o.updatetime = 300;

    vim.api.nvim_create_autocmd({ "BufWritePost", "ModeChanged" }, {
      callback = function(args)
        if args.event == "BufWritePost"
            or (args.event == "ModeChanged"
              and args.match:match("^i.*:n$"))
        then
          vim.diagnostic.show(nil, args.buf)
        end
      end,
    })
  end,
}
