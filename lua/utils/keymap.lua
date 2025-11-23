local M = {}

function M.set(mode, key, callback, description)
	local opts = { silent = true, noremap = true, desc = description }
	vim.keymap.set(mode, key, callback, opts)
end

function M.lsp_set(mode, key, callback, bufnr, description)
	local opts = { silent = true, noremap = true, buffer = bufnr, desc = description }
	vim.keymap.set(mode, key, callback, opts)
end

return M
