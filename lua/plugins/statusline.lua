return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
		},
		sections = (function()
			local colors = require("utils.colors").get()

			local sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}

			local function add_to_left(component)
				table.insert(sections.lualine_c, component)
			end

			local function add_to_right(component)
				table.insert(sections.lualine_x, component)
			end

			-- Mode
			add_to_left({
				function()
					return "  "
				end,
				color = function()
					local mode_colors = {
						-- NORMAL
						n = colors.normal,
						no = colors.normal,
						-- INSERT
						i = colors.insert,
						ic = colors.insert,
						-- VISUAL
						v = colors.visual,
						V = colors.visual,
						[""] = colors.visual,
						-- SELECT
						s = colors.select,
						S = colors.select,
						[""] = colors.select,
						-- REPLACE
						R = colors.replace,
						Rv = colors.replace,
						r = colors.replace,
						rm = colors.replace,
						["r?"] = colors.replace,
						-- COMMAND / EX / OPERATOR / PROMPT
						c = colors.command,
						cv = colors.command,
						ce = colors.command,
						["!"] = colors.command,
						-- TERMINAL
						t = colors.terminal,
					}

					return { bg = mode_colors[vim.fn.mode()] }
				end,
				padding = { left = 0 },
			})

			-- Git branches
			add_to_left({
				"branch",
				icon = " ",
				color = { fg = colors.green },
			})

			-- Filetype
			add_to_left({ "filetype" })

			-- Git diff
			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			add_to_left({
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			-- Diagnostics
			add_to_right({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.cyan },
				},
			})

			-- LSP
			add_to_right({
				function()
					local msg = "..."
					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return msg
					end
					msg = ""
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							msg = msg .. ", " .. client.name
						end
					end
					return string.sub(msg, 3)
				end,
				icon = "",
				color = { fg = "#ffffff" },
			})

			-- Location
			add_to_right({
				"location",
			})

			-- Progress bar.
			add_to_right({
				function()
					local current_line = vim.fn.line(".")
					local total_lines = vim.fn.line("$")
					local icons = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }

					local line_ratio = current_line / total_lines

					local index = math.ceil(line_ratio * #icons)

					return icons[index]
				end,
				color = {
					fg = colors.blue,
				},
				padding = { left = 0, right = 0 },
			})

			return sections
		end)(),
	},
}
