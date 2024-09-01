-- tokyonight
return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require('tokyonight').setup({
            transparent = true,
            styles = {
                floats = "transparent"
            }
        })
        vim.cmd.colorscheme('tokyonight')
    end
}

--[[ return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require ('nordic').setup({
            transparent_bg = true,
            telescope = {
                style = 'classic',
            }
        })
    end
} ]]--

--[[ return {
  "0xstepit/flow.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("flow").setup{
      transparent = true, -- Set transparent background.
      fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
      mode = "normal", -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
      aggressive_spell = false, -- Display colors for spell check.
    }

    vim.cmd "colorscheme flow"
  end,
}]] --
