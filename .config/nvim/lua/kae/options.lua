local opts = {
	wrap = true,
	termguicolors = true,
	number = true,
	relativenumber = true,
	completeopt = "menu,menuone,noselect",
	foldlevel = 99,
	foldlevelstart = 99,
	scrolloff = 8,
	signcolumn = "yes:2",
	showmode = false,
	shiftwidth = 8,
	tabstop = 8,
	list = true,
}

vim.opt.listchars:append "eol:↴"


-- vim.cmd [['hilite IndentBLHi1 guifg=#eba0ac']]
-- vim.cmd [['hilite IndentBLHi2 guifg=#cba6f7']]

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

local icons = require("utils.icons")

EcoVim = {
	colorscheme = "catppuccin",
	ui = {
		float = {
			border = "rounded",
		},
	},
	plugins = {
		ai = {
			chatgpt = {
				enabled = false,
			},
			codeium = {
				enabled = false,
			},
			copilot = {
				enabled = false,
			},
			tabnine = {
				enabled = false,
			},
		},
		completion = {
			select_first_on_enter = false,
		},
		-- Completely replaces the UI for messages, cmdline and the popupmenu
		experimental_noice = {
			enabled = true,
		},
		-- Enables moving by subwords and skips significant punctuation with w, e, b motions
		jump_by_subwords = {
			enabled = false,
		},
		rooter = {
			-- Removing package.json from list in Monorepo Frontend Project can be helpful
			-- By that your live_grep will work related to whole project, not specific package
			patterns = { ".git", "package.json", "_darcs", ".bzr", ".svn", "Makefile" }, -- Default
		},
		-- <leader>z
		zen = {
			alacritty_enabled = false,
			kitty_enabled = false,
			wezterm_enabled = true,
			enabled = true, -- sync after change
		},
	},
	-- Please keep it
	icons = icons,
	-- Statusline configuration
	statusline = {
		path_enabled = false,
		path = "relative", -- absolute/relative
	},
	lsp = {
		virtual_text = true, -- show virtual text (errors, warnings, info) inline messages
	},
}
