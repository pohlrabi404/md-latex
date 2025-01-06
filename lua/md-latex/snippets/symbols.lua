local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local is_math = require("md-latex").is_math

local sc = function(trig, text)
	return s({ trig = trig, snippetType = "autosnippet", condition = is_math, wordTrig = false }, { t(text), i(1) })
end

return {
	sc(";a", "\\alpha"),
	sc(";b", "\\beta"),
	sc(";g", "\\gamma"),
	sc(";G", "\\Gamma"),
	sc(";d", "\\delta"),
	sc(";D", "\\Delta"),
	sc(";e", "\\epsilon"),
	sc(";E", "\\varepsilon"),
	sc(";z", "\\zeta"),
	sc(";t", "\\theta"),
	sc(";T", "\\Theta"),
	sc(":t", "\\vartheta"),
	sc(";i", "\\iota"),
	sc(";k", "\\kappa"),
	sc(";l", "\\lambda"),
	sc(";L", "\\Lambda"),
	sc(";s", "\\sigma"),
	sc(";S", "\\Sigma"),
	sc(";u", "\\upsilon"),
	sc(";U", "\\Upsilon"),
	sc(";o", "\\omega"),
	sc(";O", "\\Omega"),
	sc("pi", "\\pi"),
	sc("tau", "\\tau"),
	sc(";p", "\\phi"),
	sc(";P", "\\Phi"),
}
