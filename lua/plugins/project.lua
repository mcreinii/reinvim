return {
	"ahmedkhalf/project.nvim",
	opts = {},
	config = function()
		local _, telescope = pcall(require, "telescope")

		while not telescope do
			_, telescope = pcall(require, "telescope")
		end

		telescope.load_extension("projects")
	end,
}
