vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.laststatus = 3

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.g.omni_sql_no_default_maps = 1


vim.cmd "set noshowmode"

vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.buf.signature_help({
      border = 'rounded',
      close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
    })
vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.buf.hover({
      border = 'rounded',
    })
