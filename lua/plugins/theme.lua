-- tokyonight
--[[ return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require('tokyonight').setup({
            transparent = true
        })
    end
}]]--

return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
}
