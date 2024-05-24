-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/

local luasnip = require("luasnip")
local snippet = luasnip.snippet
local insert = luasnip.insert_node
local func = luasnip.function_node
local dynamic = luasnip.dynamic_node
local format = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local get_visual = function(_, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return snippet(nil, insert(1, parent.snippet.env.LS_SELECT_RAW))
	else
		return snippet(nil, insert(1, ""))
	end
end

local in_env = function(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local in_list = function()
	return in_env("enumerate")
end

local in_math = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local in_text = function()
	return not in_math()
end

local in_flalign = function()
	return in_env("flalign*")
end

return {
	snippet(
		{
			trig = "doc",
			descr = "LaTeX document boilerplate",
		},
		format(
			[[
				%! TEX program = pdf_escaped
				\documentclass[11pt, preview, border=1in]{standalone}
				\usepackage{mathtools, amssymb, amsthm, graphicx, enumitem, titlesec, tikz, minted, xparse, tcolorbox}
				\usepackage[a4paper, margin=1in]{geometry}
				\mathtoolsset{showonlyrefs}
				\graphicspath{ {./images/} }
				\usepackage[parfill]{parskip}
				\setlength{\parindent}{0pt}
				\usepackage[T1]{fontenc}
				\usepackage{lmodern}
				\usepackage{polynom}
				\newcommand{\polynomdiv}[2]{\par\polylongdiv[style=C,div=:]{#1}{#2}\par}

				\title{\vspace{-2cm}<>}
				\date{<>}
				\author{<>}

				\renewcommand{\labelenumi}{\alph{enumi})}
				\titleformat*{\section}{\fontsize{14}{18}\selectfont}
				\titleformat*{\subsection}{\fontsize{10}{12}\selectfont}
				\pagestyle{empty}
				\pagenumbering{gobble}

				\begin{document}

				\definecolor{bg}{HTML}{282828}
				\usemintedstyle{native}
				\setminted{bgcolor=bg}

				\newtcolorbox{mintedbox}{
					arc=5mm,
					colframe = bg,
					colback = bg,
				}

				\maketitle

				<>

				\end{document}
			]],
			{ insert(1, "Title"), insert(2, "Date"), insert(3, "Author"), insert(4) }
		),
		{ condition = line_begin }
	),
	-------------------
	-- Math Snippets --
	-------------------
	snippet(
		{
			trig = "mm",
			descr = "Inline Math",
			snippetType = "autosnippet",
			wordTrig = true,
		},
		format([[<>$ <> $]], { func(function(_, snip)
			return snip.captures[1]
		end), insert(1) }),
		{ condition = in_text }
	),
	snippet(
		{
			trig = "ml",
			descr = "Multiline Math",
			snippetType = "autosnippet",
			wordTrig = true,
		},
		format(
			[[
				\begin{flalign*}
					& <> & <>
				\end{flalign*}
			]],
			{ insert(1), insert(0) }
		),
		{ condition = line_begin }
	),
	snippet(
		{
			trig = "(%s)ll",
			descr = "Left-aligned newline",
			snippetType = "autosnippet",
			wordTrig = true,
			regTrig = true,
		},
		format(
			[[
				<> \\[5pt]
				& <> &
			]],
			{ func(function(_, snip)
				return snip.captures[1]
			end), insert(1) }
		),
		{ condition = in_flalign }
	),
	---------------------
	snippet({
		trig = "pp",
		descr = "Parenthesis",
		snippetType = "autosnippet",
		wordTrig = false,
	}, format([[\left(<>\right)]], { insert(1) }), { condition = in_math }),
	snippet({
		trig = "ff",
		descr = "Fraction",
		snippetType = "autosnippet",
		wordTrig = true,
	}, format([[\frac{<>}{<>}]], { insert(1), insert(2) }), { condition = in_math }),
	snippet(
		{
			trig = "([%s])aa",
			descr = "Answer (Double underline)",
			snippetType = "autosnippet",
			wordTrig = true,
			regTrig = true,
		},
		format(
			[[
				<>\underline{\underline{<>}}
			]],
			{ func(function(_, snip)
				return snip.captures[1]
			end), dynamic(1, get_visual) }
		)
	),
	snippet({
		trig = "ss",
		descr = "Square root",
		wordTrig = true,
		snippetType = "autosnippet",
	}, format([[\sqrt{<>}]], { insert(1) }), { condition = in_math }),
	snippet({
		trig = "rr",
		descr = "Nth root",
		wordTrig = true,
		snippetType = "autosnippet",
	}, format([[\sqrt[<>]{<>}]], { insert(1), insert(2) }), { condition = in_math }),
	snippet({
		trig = "^",
		descr = "Exponent",
		snippetType = "autosnippet",
		wordTrig = false,
	}, format([[^{<>}]], { insert(1) }), { condition = in_math }),
	snippet(
		{ trig = "ar", descr = "Equation system", snippetType = "autosnippet", wordTrig = true },
		format(
			[[
				\begin{bmatrix}
				<> &=& <>	\\[5pt]
				<> &=& <>
				\end{bmatrix}
			]],
			{ insert(1), insert(2), insert(3), insert(4) }
		),
		{ condition = in_math }
	),
	snippet(
		{
			trig = "abc",
			descr = "ABC-formula",
			wordTrig = true,
		},
		format([[x=\frac{-<>\pm\sqrt{<>^{2}-4*<>*<>}}{2*<>}]], { insert(2), rep(2), insert(1), insert(3), rep(1) }),
		{ condition = in_math }
	),
	snippet({
		trig = "poldiv",
		descr = "Polynomdivision",
		wordTrig = true,
		snippetType = "autosnippet",
	}, format([[\polynomdiv{<>}{<>}]], { insert(1), insert(2) }), { condition = line_begin }),
	----------
	-- Text --
	----------
	snippet(
		{
			trig = "(%s)ll",
			descr = "Newline with spacing",
			snippetType = "autosnippet",
			regTrig = true,
			wordTrig = true,
		},
		format("<>\\\\[5pt]", { func(function(_, snip)
			return snip.captures[1]
		end) }),
		{ condition = in_text }
	),
	snippet({
		trig = "text",
		descr = "Text",
		wordTrig = true,
	}, format([[\text{<>}]], { insert(1) })),
	snippet({
		trig = "sec",
		descr = "Section",
		wordTrig = true,
		snippetType = "autosnippet",
	}, format([[\section*{<>}]], { insert(1, "Section") }), { condition = line_begin }),
	----------
	-- List --
	----------
	snippet(
		{
			trig = "ls",
			descr = "List a) b) c)",
			snippetType = "autosnippet",
			wordTrig = true,
		},
		format(
			[[
				\begin{enumerate}
					<>
				\end{enumerate}
			]],
			{ insert(1) }
		),
		{ condition = line_begin }
	),
	snippet(
		{
			trig = "lr",
			descr = "Resume list",
			snippetType = "autosnippet",
			wordTrig = true,
		},
		format(
			[[
				\begin{enumerate}[resume]
					<>
				\end{enumerate}
			]],
			{ insert(1) }
		),
		{ condition = line_begin }
	),
	snippet(
		{
			trig = "li",
			descr = "List item",
			snippetType = "autosnippet",
			wordTrig = true,
		},
		format([[<>\item <>]], { func(function(_, snip)
			return snip.captures[1]
		end), insert(1) }),
		{ condition = in_list and line_begin }
	),
	snippet(
		{
			trig = "(%s)lm",
			descr = "List multiline math",
			snippetType = "autosnippet",
			wordTrig = false,
			regTrig = true,
		},
		format(
			[[
				<>
					\begin{flalign*}
						& <> & <>
					\end{flalign*}
			]],
			{ func(function(_, snip)
				return snip.captures[1]
			end), insert(1), insert(2) }
		),
		{ condition = in_list }
	),
	-----------
	-- Other --
	-----------
	snippet(
		{
			trig = "img",
			descr = "Image",
			wordTrig = true,
		},
		format(
			[[<>\includegraphics[width=0.9\textwidth]{<>}]],
			{ func(function(_, snip)
				return snip.captures[1]
			end), insert(1) }
		),
		{ condition = in_text }
	),
	snippet(
		{
			trig = "new",
			descr = "Generic environment",
			wordTrig = true,
		},
		format(
			[[
				\begin{<>}
					<>
				\end{<>}
			]],
			{ insert(1), insert(2), rep(1) }
		),
		{ condition = line_begin }
	),
}
