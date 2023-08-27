require("nnn").setup({
	picker = {
		cmd = "nnn -Pp",
		session = "shared",
		fullscreen = false,
	},
	explorer = {
		cmd = "nnn",
		session = "shared",
		fullscreen = false,
	},
	replace_netrw = "picker",
	quitcd = "cd",
	offset = true,
})
