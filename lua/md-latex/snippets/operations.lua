local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

local is_math = require("md-latex").is_math
local sc = function(context, nodes, opts)
	local default = { snippetType = "autosnippet", condition = is_math, wordTrig = false }
	context = vim.tbl_deep_extend("force", default, context)
	return s(context, nodes, opts)
end

return {

	-- Fraction
	sc({ trig = "//" }, fmta([[ \frac{<>}{<>}<>]], { i(1), i(2), i(0) })),
	-- normal case
	sc(
		{ trig = "([^)%s]+)/", regTrig = true },
		fmta([[\frac{<>}{<>}<>]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(0),
		})
	),
	-- function case
	sc(
		{ trig = "(\\[^)%s]+)/", regTrig = true },
		fmta([[\frac{<>}{<>}<>]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(0),
		})
	),
	-- handle bracket case
	sc(
		{ trig = "(.+%))/", regTrig = true },
		fmta([[<>{<>}<>]], {
			f(function(_, snip)
				local text = snip.captures[1]
				print(text)
				local depth = 0
				local index = string.len(text)
				while true do
					print(depth)
					if string.sub(text, index, index) == ")" then
						depth = depth + 1
					elseif string.sub(text, index, index) == "(" then
						depth = depth - 1
					end
					if depth == 0 then
						break
					end
					index = index - 1
				end
				return string.sub(text, 1, index - 1) .. "\\frac{" .. string.sub(text, index + 1, -2) .. "}"
			end),
			i(1),
			i(0),
		})
	),

	-- power
	sc({ trig = "rd" }, fmta([[^{<>}<>]], { i(1), i(0) })),
	sc({ trig = "ss" }, fmta([[^2<>]], { i(0) })),
	sc({ trig = "cc" }, fmta([[^3<>]], { i(0) })),
	sc({ trig = "ee" }, fmta([[e^{<>}<>]], { i(1), i(0) })),
	sc({ trig = "invs" }, fmta([[^{-1}<>]], { i(0) })),

	-- supscript
	sc({ trig = "_" }, fmta([[_{<>}<>]], { i(1), i(0) })),
	sc(
		{ trig = "([%a])([%d])", regTrig = true },
		fmta([[<>_{<><>}<>]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
			i(1),
			i(0),
		})
	),

	-- trig
	sc({ trig = "cos", wordTrig = true }, fmta([[\cos(<>)<>]], { i(1), i(0) })),
	sc({ trig = "sin", wordTrig = true }, fmta([[\sin(<>)<>]], { i(1), i(0) })),
	sc({ trig = "tan", wordTrig = true }, fmta([[\tan(<>)<>]], { i(1), i(0) })),
	sc({ trig = "cot", wordTrig = true }, fmta([[\cot(<>)<>]], { i(1), i(0) })),
	sc({ trig = "acos", wordTrig = true }, fmta([[\arccos(<>)<>]], { i(1), i(0) })),
	sc({ trig = "asin", wordTrig = true }, fmta([[\arcsin(<>)<>]], { i(1), i(0) })),
	sc({ trig = "atan", wordTrig = true }, fmta([[\arctan(<>)<>]], { i(1), i(0) })),

	-- integral
	sc(
		{ trig = "int", wordTrig = true },
		fmta(
			[[
    \int_{<>}^{<>} <>
    ]],
			{ i(1, "-\\infty"), i(2, "\\infty"), i(0) }
		)
	),

	-- sum
	sc(
		{ trig = "sum", wordTrig = true },
		fmta(
			[[
    \sum_{<> = <>}^{<>} <>
    ]],
			{ i(1, "n"), i(2, "0"), i(3, "\\infty"), i(0) }
		)
	),

	-- square root
	sc(
		{ trig = "sq", wordTrig = true },
		fmta(
			[[
    \sqrt{<>}<>
    ]],
			{ i(1), i(0) }
		)
	),

	-- hat
	sc(
		{ trig = "(%a)hat", regTrig = true },
		fmta([[\hat{<>}<>]], {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(0),
		})
	),
	sc(
		{ trig = "hat", wordTrig = true },
		fmta([[\hat{<>}<>]], {
			i(1),
			i(0),
		})
	),
}
