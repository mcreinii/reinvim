vim.keymap.set("n", "<leader>ss", function()
	require("persistence").load()
end, { desc = "Load the session for current directory" })
vim.keymap.set("n", "<leader>sS", function()
	require("persistence").select()
end, { desc = "Select a session to load" })
vim.keymap.set("n", "<leader>sl", function()
	require("persistence").load({ last = true })
end, { desc = "Load the session for current directory" })
vim.keymap.set("n", "<leader>sd", function()
	require("persistence").load()
end, { desc = "Stop saving sessions till exit." })

return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
}
