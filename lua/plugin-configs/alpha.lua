local alpha = safe_require('alpha')
if not alpha then return end

local dashboard = safe_require("alpha.themes.dashboard")
if not dashboard then return end

dashboard.section.header.val = {
 [[  /\ \              __                  ]],
 [[  \_\ \    __  __  /\_\     ___ ___     ]],
 [[  /'_` \  /\ \/\ \ \/\ \  /' __` __`\   ]],
 [[ /\ \L\ \ \ \ \_/ | \ \ \ /\ \/\ \/\ \  ]],
 [[ \ \___,_\ \ \___/   \ \_\\ \_\ \_\ \_\ ]],
 [[  \/__,_ /  \/__/     \/_/ \/_/\/_/\/_/ ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("v", "  Edit dvim", ":e ~/.config/nvim/lua/plugins.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
	return "https://github.com/d-3nnis/dvim"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
