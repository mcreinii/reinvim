return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = require("utils.keymap")

		local builtin = require("telescope.builtin")
		keymap.set("n", "<leader>ff", builtin.find_files, "Telescope find files")
		keymap.set("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
		keymap.set("n", "<leader>fb", builtin.buffers, "Telescope buffers")
		keymap.set("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
	end,
}
