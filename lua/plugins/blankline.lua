return { 'lukas-reineke/indent-blankline.nvim', 
main = 'ibl', 
opts = {
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
			char_highlight_list = {
				"IndentBlanklineIndent1",
				"IndentBlanklineIndent2",
				"IndentBlanklineIndent3",
				"IndentBlanklineIndent4",
				"IndentBlanklineIndent5",
				"IndentBlanklineIndent6",
			},

},
config = function ()
    require('ibl').setup()
end    
}
