return {
	-- Autopairing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Whichkey
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>d", group = "Diagnostics" },
				{ "<leader>f", group = "Finder" },
				{ "<leader>l", group = "Language Tools" },
				{ "<leader>b", group = "Buffer" },
			})
		end,
	},
}
