local wk = safe_require("which-key")
if not wk then return end
local gs = safe_require('gitsigns')
-- if not gs then return end
local wp = safe_require('window-picker')
-- if not wp then return end

local M = {}

M.whichkey_binds = {
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>qa<CR>", "Quit" },
    ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Comment" },
    s = {
        name = "Telescope",
        t = { "<cmd>Telescope live_grep<cr>", "Grep files" },
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps list" },
        h = { "<cmd>Telescope colorscheme<cr>", "List of themes" },
        n = { "<cmd>Telescope notify<cr>", "Notify messages" },
    },
    e = {
        name = "Tree explorer",
        e = { "<cmd>Neotree filesystem left<cr>", "Open File Tree" },
        g = { "<cmd>Neotree float source=git_status<cr>", "Open Git Status" },
        c = { "<cmd>NeoTreeClose<cr>", "Close Tree" },
        -- TODO expand options here
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
            "<cmd>Telescope diagnostics<cr>",
            "Document Diagnostics",
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format{async = true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = {
            "<cmd>lua vim.diagnostic.goto_next()<CR>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
    },
    o = {
        name = "Misc",
        q = { "gq", "Reformat line widths" },
        h = { "<cmd>nohls<cr>", "Hide search highlight" },
    },
    -- add one for window
    -- add one for barbar
    -- easy access
    b = {
        name = "Buffers",
        l = { "<Cmd>BufferOrderByLanguage<CR>", "Order Buffers by Language" },
        p = { "<cmd>BufferPin<cr>", "Pin Buffer" },
        c = { "<cmd>BufferClose<cr>", "Close Buffer" },
    },
    h = {
        name = "Gitsigns",
        j = { function() gs.preview_hunk() end, "Preview Hunk" },
        b = { function() gs.blame_line { full = true } end, "Blame Line" },

        S = { function() gs.stage_buffer() end, "Stage Buffer" },
        u = { function() gs.undo_stage_hunk() end, "Undo Stage Hunk" },
        i = { function()
            vim.cmd('Gitsigns toggle_linehl')
            vim.cmd('Gitsigns toggle_numhl')
            vim.cmd('Gitsigns toggle_word_diff')
        end, "Toggle Line Highlighting" },
        s = { '<CMD>Gitsigns stage_hunk<CR>', "Stage Hunk", mode = { 'n', 'v' } },
        r = { '<CMD>Gitsigns reset_hunk<CR>', "Reset Hunk", mode = { 'n', 'v' } },
        --map('n', '<leader>hR', gs.reset_buffer)
        --map('n', '<leader>tb', gs.toggle_current_line_blame)
        --map('n', '<leader>hd', gs.diffthis)
        --map('n', '<leader>hD', function() gs.diffthis('~') end)
        --map('n', '<leader>td', gs.toggle_deleted)

    },

    d = {
        name = 'Duck?',
        d = { function()
            local duck = safe_require('duck')
            if not duck then return else end
            duck.hatch()
        end, 'Hatch Duck'
        },
        k = { function()
            local duck = safe_require('duck')
            if not duck then return else end
            duck.cook()
        end, 'Catch Duck'
        },
    },
    i = {
        name = 'Code Window',
        o = {
            function() require("codewindow").open_minimap() end, "Open Minimap"
        },
        c = {
            function() require("codewindow").close_minimap() end, "Close Minimap"
        },
        f = {
            function() require("codewindow").toggle_focus() end, "Focus Toggle Minimap"
        },
        t = {
            function() require("codewindow").toggle_minimap() end, "Toggle Minimap"
        },
    },
    t = {
        name = 'To[ggle]',
        g = {
            name = 'Git',
            b = { function() gs.toggle_current_line_blame() end, 'Toggle Line Blame' },
        },
    },
    ["n"] = { function()
        local picked_window_id = wp.pick_window() or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
    end,
        "Window Picker" },
    -- make me a menu
    ["c"] = { function() require('bufdelete').bufdelete(0) end, "Close Buffer" },
    ["f"] = { "<CMD>Legendary<CR>", "Open command legend" },
}
M.whichkey_opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

wk.setup {
    disable = {
        filetypes = { "TelescopePrompt" }
    }
}

wk.register(M.whichkey_binds, M.whichkey_opts)

return M
