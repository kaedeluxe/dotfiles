return {
	-- Themes
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true
			})
		end,
	},

	-- Using feline as a statusbar instead
	-- {
	-- 	"glepnir/galaxyline.nvim",
	-- 	config = function()
	-- 		require("plugins.galaxyline")
	-- 	end,
	-- 	event = "VeryLazy",
	-- },

	{
		"freddiehaddad/feline.nvim",
		config = function()
			require("plugins.feline")
		end,
	},

	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("plugins.alpha")
		end,
	},

	-- Replace netrw
	{
		"luukvbaal/nnn.nvim",
		config = function()
			require("plugins.nnn")
		end,
	},

	{
		"knubie/vim-kitty-navigator",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		config = function()
			require("plugins.treesitter")
		end,
		dependencies = {
			"hiphish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
	},

	--Telescope/Tree
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		config = function()
			require("plugins.telescope")
		end,
	},

	-- Lsp Base
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},

	},

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
	},

	-- Lsp Cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"RRethy/vim-illuminate",
			"saadparwaiz1/cmp_luasnip",
			{ "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" },
			{
				"David-Kunz/cmp-npm",
				config = function()
					require("plugins.cmp-npm")
				end,
			},
		},
	},

	-- Lsp addons
	{
		"onsails/lspkind-nvim",
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			require("plugins.dressing")
		end,
	},

	{
		"nvim-lua/popup.nvim"
	},

	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("plugins.trouble")
		end,
	},

	{
		"sbdchd/neoformat",
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
	},

	-- General
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.which-key")
		end,
	},

	{
		"NumToStr/Comment.nvim",
		lazy = false,
		branch = "jsx",
		config = function()
			require("plugins.comment")
		end,
	},

	{
		"kylechui/nvim-surround",
		lazy = false,
		config = true,
	},

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.colorizer")
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
		end,
	},

	{
		"AndrewRadev/switch.vim",
		lazy = false,
	},

	{
		"folke/twilight.nvim",
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
		init = function()
			local banned_messages = {
				"No information available",
				"LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.",
				"LSP[tsserver] Inlay Hints request failed. File not opened in the editor.",
			}
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return require("notify")(msg, ...)
			end
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"echasnovski/mini.bufremove",
		},
		version = "*",
		config = function()
			require("plugins.bufferline")
		end,
	},

	{
		"NvChad/nvterm",
		config = function()
			require("plugins.nvterm")
		end,
	},

	{
		"LudoPinelli/comment-box.nvim",
		lazy = false,
		keys = {
			{ "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", desc = "Comment box" },
			{
				"<leader>ac",
				"<cmd>lua require('comment-box').lbox()<CR>",
				mode = "v",
				desc =
				"Comment box"
			},
		}
	},

	{
		"folke/todo-comments.nvim",
		lazy = false,
		event = "BufEnter",
		config = function()
			require("plugins.todo-comments")
		end,
	},

	{
		"folke/noice.nvim",
		lazy = false,
		config = function()
			require("plugins.noice")
		end,
	},

	{
		"folke/zen-mode.nvim",
		opts = {
			kitty = {
				enabled = true,
				font = "+4",
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.blankline")
		end,
	},
}
