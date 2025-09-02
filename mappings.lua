require "nvchad.mappings"
-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")



M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["H"] = {"<Nop>", "NOP, NO-OP", opts = { desc = "I hate default H behaviour" }},
    ["?"] = {":NvCheatsheet<CR>", "cheatsheet", opts = {}},
    ["<A-o>"] = {"<Cmd>lua require'jdtls'.organize_imports()<CR>", "jdtls.organize_imports", opts = {}},
  },
  i = {
    -- universal INSERT MODE editting key mappings to be compatible with editors
    -- Ctrl-S to save in insert mode
    ["<c-s>"] = {"<Esc>:w<CR>a", "Save file" , opts = { desc = "Save file" }},
    ["<C-a>"] = {"<Home>", "<Home>" , opts = { desc = "<Home>" }},
    ["<C-e>"] = {"<End>", "<End>" , opts = { desc = "<End>" }},
    ["<C-z>"] = {"<Esc>ua", "undo" , opts = { desc = "undo" }}, -- undo
    ["<C-r>"] = {"<Esc>:redo<CR>a", "redo" , opts = { desc = "redo" }}, -- undo
  },
  v = {
    ["H"] = {"<Nop>", "NOP, NO-OP", opts = { desc = "I hate default H behaviour" }},
    -- https://vim.fandom.com/wiki/Shifting_blocks_visually
    [">"] = {">gv", ">gv", "", opts = {}},
    ["<"] = {"<gv", "<gv", "", opts = {}},
  }
}
