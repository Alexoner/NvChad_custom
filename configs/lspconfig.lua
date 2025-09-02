-- Load NvChad LSP defaults
require("nvchad.configs.lspconfig").defaults()

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "pyright", "ts_ls", "jsonls", "rust_analyzer", "gopls", "html", "cssls", "yamlls", "solargraph"}

-- Enable LSP servers with new API
vim.lsp.enable(servers)


-- If generateing LSP config with custom tools, configure like this:
local function bemol()
 local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
 local ws_folders_lsp = {}
 if bemol_dir then
  local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
  if file then

   for line in file:lines() do
    table.insert(ws_folders_lsp, line)
   end
   file:close()
  end
 end

 for _, line in ipairs(ws_folders_lsp) do
  vim.lsp.buf.add_workspace_folder(line)
 end

end
bemol()


-- Custom LSP configurations using new API
local lspconfig = require "lspconfig"

-- Step 2: Call bemol() from your on_attach() function.
local on_attach_jdtls = function(_, bufnr)
  -- Get NvChad's default on_attach
  require("nvchad.configs.lspconfig").on_attach(_, bufnr)
  
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
  -- your other keymaps and the rest of your configuration here.
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = '[G]oto [R]eference' })
  vim.keymap.set('n', '<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", {})

  -- bemol()
end

-- Step 3: Custom server configurations
lspconfig["jdtls"].setup {
  on_attach = on_attach_jdtls,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
}

lspconfig["kotlin_language_server"].setup {
  on_attach = on_attach_jdtls,
  capabilities = require("nvchad.configs.lspconfig").capabilities,
}

-- lspconfig["ruby_lsp"].setup {
--   on_attach = (function(_, bufnr) bemol() end);
-- }
