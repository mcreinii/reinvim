-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = require("utils.keymap")

-- Buffers
keymap.set("n", "<leader>w", ":w<cr>", "Write Buffer")
keymap.set("n", "<leader>c", ":q<cr>", "Close current buffer")

-- Quiting
keymap.set("n", "<leader>Q", ":qa<cr>", "Quit ReiNvim")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local keymap = require("utils.keymap")

		local bufnr = args.buf

		keymap.lsp_set("n", "<leader>li", vim.lsp.buf.definition, bufnr, "Information")
		keymap.lsp_set("n", "<leader>lh", vim.lsp.buf.hover, bufnr, "Hover")
		keymap.lsp_set("n", "<leader>lr", vim.lsp.buf.rename, bufnr, "Rename")
		keymap.lsp_set("n", "<leader>la", vim.lsp.buf.code_action, bufnr, "Code Action")
		keymap.lsp_set("n", "<leader>lR", vim.lsp.buf.references, bufnr, "References")
	end,
})
