local Util = require("util")

return {
    {
        "phaazon/hop.nvim",
        branch = 'v2',
        config = function()
            require 'hop'.setup({
                keys = 'etovxqpdygfblzhckisuran',
                case_insensitive = false,
                multi_windows = true,
            })
        end,
        keys = {
            Util.K("ss", "HopChar2", "Search 2 Char"),
        }
    },


    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {}
        end,
        keys = {
            Util.K("ff", "Telescope find_files", "Search File"),
            Util.K("fg", "Telescope live_grep", "Search Grep"),
            Util.K("<leader>gc", "Telescope git_commits", "commits"),
            Util.K("<leader>gs", "Telescope git_status", "status")
        }
    }

}