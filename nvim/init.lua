require("options")

-- sets up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- tokyonight
--vim.cmd.colorscheme('tokyonight')
-- nord
vim.cmd.colorscheme('nordic')

local keyMaps = require("keymaps")
keyMaps.config()

--local lsp = require("lsp")
--lsp.setup()
