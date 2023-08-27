local map = require("helpers.keys").map
local silent = { silent = true }

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Primeagen maps
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Buffers
map("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
map("n", "<leader>x", "<cmd>bd<CR>", "Close buffer")
map("n", "<F11>", "<cmd>ZenMode<CR>")

-- Nnn
map("n", "<leader>pp", "<cmd>NnnPicker<CR>", silent)
map("n", "<leader>pe", "<cmd>NnnExplorer<CR>", silent)

-- LSP
-- map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent) -- Replaced with Glance plugin
-- map("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent) -- Replaced with Glance plugin
map("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
map("v", "<leader>la", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
-- map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
map("n", "<leader>ff", "<cmd>Neoformat<CR>")
-- map("v", "<leader>ff", function()
--   local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
--   local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))
--
-- 	vim.lsp.buf.format({
-- 		range = {
-- 			["start"] = { start_row, 0 },
-- 			["end"] = { end_row, 0 },
-- 		},
-- 		async = true,
-- 	})
-- end, silent)
map("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
map("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
map("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
map("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
map("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
map("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)
