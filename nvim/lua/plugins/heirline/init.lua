local function colors()
	local utils = require("heirline.utils")
    local git_del  = utils.get_highlight("diffDeleted").fg
    -- not all colorscheme have a "diffDeleted" member, we are using this patch
    if git_del == nil
        then git_del = utils.get_highlight("DiagnosticError").fg
    end
	return {
	    bright_bg = utils.get_highlight("Folded").bg,
	    bright_fg = utils.get_highlight("Folded").fg,
	    red = utils.get_highlight("DiagnosticError").fg,
	    dark_red = utils.get_highlight("DiffDelete").bg,
	    green = utils.get_highlight("String").fg,
	    blue = utils.get_highlight("Function").fg,
	    gray = utils.get_highlight("NonText").fg,
	    orange = utils.get_highlight("Constant").fg,
	    purple = utils.get_highlight("Statement").fg,
	    cyan = utils.get_highlight("Special").fg,
	    diag_warn = utils.get_highlight("DiagnosticWarn").fg,
	    diag_error = utils.get_highlight("DiagnosticError").fg,
	    diag_hint = utils.get_highlight("DiagnosticHint").fg,
	    diag_info = utils.get_highlight("DiagnosticInfo").fg,
	    git_del = git_del,
	    git_add = utils.get_highlight("diffAdded").fg,
	    git_change = utils.get_highlight("diffChanged").fg,
        git_branch = utils.get_highlight("Comment").fg,
        dateTime = utils.get_highlight("Comment").fg,
        lsp = utils.get_highlight("Comment").fg,
    }
end

local function ruler()
	return {
	    -- %l = current line number
	    -- %L = number of lines in the buffer
	    -- %c = column number
	    -- %P = percentage through file of displayed window
	    provider = "%7(%l/%3L%):%2c %P",
	}
end

local Align = {provider = "%="}
local Space = {provider = " "}


local function defaultStatusLine(utils)
    local viMode  = utils.surround({" ", " " }, nil, require("plugins.heirline.vimode"))
    local filenameComp = require("plugins.heirline.filename_component")
    local activeLsp = require("plugins.heirline.lsp_component")
    local diagnostics = require("plugins.heirline.diagnostics_component")
    local gitComp = require("plugins.heirline.git_component")
	return {
        viMode, Space, filenameComp, Space, gitComp, Space, diagnostics, Align,
        activeLsp, Space, ruler(),
	}
end

local function inactiveStatusLine(conditions)
    local filenameComp = require("plugins.heirline.filename_component")
    return {
        condition = conditions.is_not_active,
        filenameComp,
    }
end

return {
	"rebelot/heirline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
        'lewis6991/gitsigns.nvim',
	},
	config = function()
		local utils = require("heirline.utils")
        local conditions = require("heirline.conditions")

        local statusLines = {
            hl = function ()
                if conditions.is_active() then
                    return "StatusLine"
                else
                    return "StatusLineNC"
                end
            end,
            fallthrough = false,
            inactiveStatusLine(conditions),defaultStatusLine(utils)
        }


		require("heirline").setup({
			opts = {
				colors = colors(),
			},
			statusline = statusLines,
        })
	end,
	--[[opts = { 
		statusline = StatusLine,
	}]]--NOTE: folke suggests to use opts instead of config, but with opts it was not working. To investigate
}

