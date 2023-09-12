local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "clangd", "pyright", "html", "cssls", "tsserver", "jsonls", "yamlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

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


-- Step 2: Call bemol() from your on_attach() function.
local on_attach_jdtls = function(_, bufnr)
  on_attach(_, bufnr)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
  -- your other keymaps and the rest of your configuration here.
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = '[G]oto [R]eference' })


  bemol()
end

-- Step 3: Make sure you pass on_attach to lspconfig.
local server_name = 'jdtls' -- or whatever lsp you're using.
lspconfig[server_name].setup {
  on_attach = on_attach_jdtls,
}
