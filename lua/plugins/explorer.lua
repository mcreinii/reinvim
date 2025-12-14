return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Keymaps
		local keymap = require("utils.keymap")

		keymap.set("n", "<leader>e", ":Neotree toggle<cr>", "Toggle Neotree")

		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function(args)
		-- 		if vim.fn.isdirectory(args.file) == 1 then
		-- 			vim.cmd.cd(args.file)
		-- 			require("neo-tree").execute({ reveal = true })
		-- 		end
		-- 	end,
		-- })
		--
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
