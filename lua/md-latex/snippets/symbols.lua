local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local is_math = require("md-latex").is_math

local sc = function(trig, text)
	return s({ trig = trig, snippetType = "autosnippet", condition = is_math }, { t(text), i(1) })
end

return {
	-- Lower case
	sc("alp", "\\alpha"),
	sc("bet", "\\beta"),
	sc("gam", "\\gamma"),
	sc("del", "\\delta"),
	sc("eps", "\\epsilon"),
	sc("vep", "\\varepsilon"),
	sc("zet", "\\zeta"),
	sc("eta", "\\eta"),
	sc("the", "\\theta"),
	sc("vth", "\\vartheta"),
	sc("iot", "\\iota"),
	sc("kap", "\\kappa"),
	sc("lam", "\\lambda"),
	sc("mu", "\\mu"),
	sc("nu", "\\nu"),
	sc("xi", "\\xi"),
	sc("pi", "\\pi"),
	sc("vpi", "\\varpi"),
	sc("rho", "\\rho"),
	sc("vrh", "\\varrho"),
	sc("sig", "\\sigma"),
	sc("vsi", "\\varsigma"),
	sc("tau", "\\tau"),
	sc("ups", "\\upsilon"),
	sc("phi", "\\phi"),
	sc("vph", "\\varphi"),
	sc("chi", "\\chi"),
	sc("psi", "\\psi"),
	sc("ome", "\\omega"),

	-- Upper case
	sc("Gam", "\\Gamma"),
	sc("Del", "\\Delta"),
	sc("The", "\\Theta"),
	sc("Lam", "\\Lambda"),
	sc("Xi", "\\Xi"),
	sc("Pi", "\\Pi"),
	sc("Sig", "\\Sigma"),
	sc("Ups", "\\Upsilon"),
	sc("Phi", "\\Phi"),
	sc("Psi", "\\Psi"),
	sc("Ome", "\\Omega"),

	-- others
	sc("inf", "\\infty"),
}
