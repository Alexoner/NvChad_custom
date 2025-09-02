# NvChad Custom Configuration Architecture

This directory contains custom NvChad configuration that follows the **new NvChad starter architecture**.

See: https://github.com/NvChad/starter/tree/main.

## Directory Structure

```
NvChad_custom/
├── ARCHITECTURE.md         # This documentation
├── chadrc.lua              # Theme and UI configuration (uses M.base46)
├── mappings.lua            # Custom key mappings
├── autocmds.lua            # Auto commands
├── init.lua                # Custom Neovim settings
├── highlights.lua          # Custom highlights
├── plugins/
│   └── init.lua            # Custom plugin specifications
└── configs/
    ├── lspconfig.lua       # LSP configurations
    ├── telescope.lua       # Telescope setup
    ├── overrides.lua       # Plugin overrides
    └── ...                 # Other plugin configs
```

## New Architecture Changes

### 1. Theme Configuration (chadrc.lua)
**Old API (deprecated):**
```lua
M.ui = {
  theme = "chadracula",
  theme_toggle = { "chadracula", "one_light" },
  -- ...
}
```

**New API:**
```lua
M.base46 = {
  theme = "chadracula", 
  theme_toggle = { "chadracula", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.ui = {
  statusline = { theme = "vscode_colored" },
  lsp_semantic_tokens = true,
}
```

### 2. Plugin Loading
**Old approach:** `M.plugins = "custom.plugins"`

**New approach:** Files in `/lua/plugins/*.lua` are automatically imported via `{ import = "plugins" }`

### 3. File Linking Strategy

The `init-neovim-nvchad.sh` script creates symlinks to integrate repository files with the new architecture:

```bash
# New architecture symlinks
~/.config/nvim/lua/chadrc.lua      -> ~/.dev-env/NvChad_custom/chadrc.lua
~/.config/nvim/lua/mappings.lua    -> ~/.dev-env/NvChad_custom/mappings.lua
~/.config/nvim/lua/autocmds.lua    -> ~/.dev-env/NvChad_custom/autocmds.lua
~/.config/nvim/lua/plugins/custom.lua -> ~/.dev-env/NvChad_custom/plugins/init.lua
~/.config/nvim/lua/configs/custom/ -> ~/.dev-env/NvChad_custom/configs/

# Legacy compatibility
~/.config/nvim/lua/custom/         -> ~/.dev-env/NvChad_custom/
```

## Plugin Specification Format

Plugins in `plugins/init.lua` should use lazy.nvim specification:

```lua
return {
  {
    "plugin/name",
    event = "VeryLazy",
    config = function()
      require("plugin").setup({})
    end,
  },
  
  -- Override NvChad defaults
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua", "python", "javascript" }
    }
  },
  
  -- Disable default plugins
  {
    "folke/which-key.nvim",
    enabled = false,
  },
}
```

## Migration Benefits

1. **New Architecture Compliance**: Works with latest NvChad starter approach
2. **Plugin Auto-loading**: `{ import = "plugins" }` automatically loads all plugin files
3. **Proper Theme API**: Uses `M.base46` for base46 theming system
4. **Repository Integration**: All custom files stay in repository for automation
5. **Legacy Compatibility**: Maintains `custom` symlink for existing `require "custom.*"` calls

## References

- [NvChad Plugin Documentation](https://nvchad.com/docs/config/plugins)
- [NvChad Starter Repository](https://github.com/NvChad/starter)
- [Lazy.nvim Plugin Specification](https://github.com/folke/lazy.nvim#-plugin-spec)
