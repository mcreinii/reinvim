return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			themable = true,
			numbers = "none",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			separator_style = "thin",
		},
	},
	config = function(_, opts)
		local bufferline = require("bufferline")
		local vesper = require("vesper")

		if vesper then
			table.insert(opts.options, { highlights = require("vesper").bufferline.highlights })
		end

		bufferline.setup(opts)

		local map = require("utils.keymap").set

		map("n", "<leader>bb", ":BufferlinePick<cr>", "Select a buffer")
		map("n", "<leader>bc", ":BufferlinePickClose<cr>", "Select a buffer to close")
	end,
}
