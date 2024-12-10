local config = {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local actions = require('fzf-lua.actions')
            require("fzf-lua").setup({
                keymap = {
                    builtin = {
                    },
                },
                defaults = {
                    formatter = "path.filename_first",
                },
                winopts = {
                    preview = {
                        wrap = 'wrap',
                        layout = 'vertical',
                        title_pos = 'left',
                    },
                },
            })
        end
    }
}
return config
