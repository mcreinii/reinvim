local M = {}

M.colors = {
	normal = "#FF1744",
	insert = "#00E676",
	visual = "#2979FF",
	select = "#FFAB00",
	replace = "#F500B5",
	command = "#B388FF",
	terminal = "#C6FF00",

	blue = "#4287f5",
	red = "#f54242",
	yellow = "#f5ec42",
	cyan = "#42eff5",
	green = "#48f542",
}

function M.get()
	return M.colors
end

return M
