local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "pyright", "html", "cssls", "tsserver", "jsonls", "yamlls", "jdtls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

-- lspconfig.java_language_server.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {"/home/hao/oss/java-language-server/dist/lang_server_linux.sh"},
-- }
