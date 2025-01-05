local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local is_math = require("md-latex").is_math
local not_math = function()
	return not is_math()
end

return {
	s(
		{
			trig = "mpb",
			desc = "Python Code Block",
			snippetType = "autosnippet",
			condition = not_math,
		},
		fmt(
			[[
  ```{python}
  <>
  ```
  <>
  ]],
			{
				i(1),
				i(2),
			},
			{ delimiters = "<>" }
		)
	),

	s(
		{
			trig = "dm",
			desc = "Math mode",
			snippetType = "autosnippet",
			condition = not_math,
		},
		fmt(
			[[
  $$
  <>
  $$
  <>
  ]],
			{ i(1), i(2) },
			{ delimiters = "<>" }
		)
	),
}
