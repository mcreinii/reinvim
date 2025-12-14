local opt = vim.o
local g = vim.g

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.relativenumber = true
opt.hlsearch = false
opt.wrap = true
opt.autoindent = true
opt.clipboard = "unnamed"
opt.termguicolors = true

if vim.g.neovide then
	opt.guifont = "MesloLGM Nerd Font Mono,JetBrainsMono Nerd Font:h10"
	-- g.neovide_opacity = 0.8
	-- g.neovide_normal_opacity = 0.8
	g.neovide_hide_mouse_when_typing = true
	vim.notify("Using Neovide.\nCertain options are enabled.", vim.log.levels.INFO)
end
