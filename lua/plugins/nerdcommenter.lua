local Util = require("util")

return {
    {
        "preservim/nerdcommenter",
        lazy = true,
        init = function()
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDDefaultAlign = 'left'
        end,
        keys = {
            Util.K("<leader>cc", "NERDCommenterComment", "Comment out the current line or text selected in visual mode."),
            Util.K("<leader>cu", "NERDCommenterUncomment", "Uncomments the selected line(s)."),
        }
    }


}



