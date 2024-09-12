local conditions = require("heirline.conditions")

local git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,


    hl = { fg = "git_branch" },



    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
    },
    {

        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0

            return count > 0 and ("~" .. count)

        end,
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

return git
