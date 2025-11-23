return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	opts = {},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Keymaps
		local keymap = require("utils.keymap")

		keymap.set("n", "<leader>e", ":Neotree toggle<cr>", "Toggle Neotree")
	end,
}
