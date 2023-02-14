local lspconfig = require("lspconfig")

local configs = require("lspconfig/configs")

-- require("lspinstall").setup()

M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local has_run = {}

augroup = function(name, callback)
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")
  callback(function(cmd)
    vim.cmd("autocmd " .. cmd)
  end)
  vim.cmd("augroup END")
end

local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>Gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_opts)

M.on_attach = function(_, bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  map("n", "<Leader>af", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", map_opts)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
  map("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
  map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<cr>", map_opts)
  map("n", "g0", "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>", map_opts)
  map("n", "gW", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<cr>", map_opts)
  map("n", "tt", "<cmd>lua require'telescope.builtin'.treesitter{}<cr>", map_opts)

  augroup("auto_format", function(autocmd)
	  autocmd([[BufWritePre <buffer> noautocmd silent update | lua vim.lsp.buf.formatting_seq_sync()]])

  end)

end

vim.lsp.handlers["window/logMessage"] = function(_, _, log)
  if log.type == 4 then
    print(log.message)
  end
end

M.setup = function(name, opts)
  if not has_run[name] then
    has_run[name] = true
    lspconfig[name].setup(vim.tbl_extend("force", {
      log_level = vim.lsp.protocol.MessageType.Log,
      message_level = vim.lsp.protocol.MessageType.Log,
      capabilities = capabilities,
      on_attach = M.on_attach,
    }, opts))
  end
end

vim.lsp.set_log_level(2)

return M
