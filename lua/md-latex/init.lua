local M = {}

--lookup table
local check = {
	displayed_equation = true,
	inline_formula = true,
}

---@return boolean
M.is_math = function()
	if not vim.treesitter.get_parser() then
		return false
	end
	local node = vim.treesitter.get_node({ ignore_injections = false })
	while node do
		if check[node:type()] then
			return true
		end
		node = node:parent()
	end
	return false
end

M.setup = function()
	require("luasnip").config.setup({
		enable_autosnippets = true,
	})

	local ls = require("luasnip")
	local dirs = {
		"markdown",
		"symbols",
		"operations",
	}
	local table = {}
	for _, dir in ipairs(dirs) do
		local itable = require("md-latex.snippets." .. dir)
		table = vim.list_extend(table, itable)
	end
	ls.add_snippets("markdown", table, {})
end

return M
