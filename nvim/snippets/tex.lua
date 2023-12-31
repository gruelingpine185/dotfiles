local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


local in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local in_textzone = function()
    return in_mathzone() == 0
end


return {
    -- general regex (autosnippets)
    s(
        {
            trig = '([%(])%)',
            dscr = 'Prevent extra close parenthesis',
            regTrig = true,
            snippetType = 'autosnippet'
        },
        f(function(args, snip) return snip.captures[1] end)
    ),
    s(
        {
            trig = '([%]])%]',
            dscr = 'Prevent extra close bracket',
            regTrig = true,
            snippetType = 'autosnippet'
        },
        f(function(args, snip) return snip.captures[1] end)
    ),
    s(
        {
            trig = '([%}])%}',
            dscr = 'Prevent extra close brace',
            regTrig = true,
            snippetType = 'autosnippet'
        },
        f(function(args, snip) return snip.captures[1] end)
    ),

    -- general (autosnippets)
    s(
        {
            trig = '(',
            dscr = 'Expand parenthesis',
            snippetType = 'autosnippet'
        },
        fmta('(<>)<>', {i(1), i(2)})
    ),
    s(
        {
            trig = '[',
            dscr = 'Expand square brackets',
            snippetType = 'autosnippet'
        },
        fmta('[<>]<>', {i(1), i(2)})
    ),
    s(
        {
            trig = '{',
            dscr = 'Expand curly brace',
            snippetType = 'autosnippet'
        },
        fmta('{<>}<>', {i(1), i(2)})
    ),

    -- text mode
    s(
        {trig = 'bdef', dscr = 'Begin definition environment'},
        fmta(
            [[
                \begin{definition}[<>
                    <>
                \end{definition}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'beg', dscr = 'Begin example environment'},
        fmta(
            [[
                \begin{example}[<>
                    <>
                \end{example}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'prf', dscr = 'Create proof'},
        fmta(
            [[
                \begin{altproof}[<>]
                    <>
                \end{altproof}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        )
    ),
    s(
        {trig = 'lmm', dscr = 'Create lemma'},
        fmta(
            [[
                \begin{lemma}[<>]
                    <>
                \end{lemma}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'prob', dscr = 'Create problem'},
        fmta(
            [[
                \begin{problem}[<>]
                    <>
                \end{problem}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),

    s(
        {trig = 'sec', dscr = 'Create section'},
        fmta(
            [[
                \section{<>}
                    <>
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'tab', dscr = 'Create table'},
        fmta(
            [[
                \begin{table}[h!]
                    \centering
                    \begin{tabular}{|c|c|c|}
                        \hline
                        <>
                        \hline
                        \hline
                        <>
                        \hline
                        \end{tabular}
                \end{table}
                <>
            ]],
            {i(1, 'names'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'thm', dscr = 'Create theorem'},
        fmta(
            [[
                \begin{theorem}[<>]
                    <>
                \end{theorem}
                <>
            ]],
            {i(1, 'title'), i(2), i(3)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'ba', dscr = 'Begin align environment'},
        fmta(
            [[
                \begin{align}
                    <>
                \end{align}
                <>
            ]],
            {i(1), i(2)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'bm', dscr = 'Begin display math environment'},
        fmta(
            [[
                \[
                    <>
                \]
                <>
            ]],
            {i(1), i(2)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'ol', dscr = 'Begin Ordered list'},
        fmta(
            [[
                \begin{enumerate}
                    \item <>
                \end{enumerate}
                <>
            ]],
            {i(1), i(2)}
        ),
        {condition = in_textzone}
    ),
    s(
        {trig = 'ul', dscr = 'Begin Unordered list'},
        fmta(
            [[
                \begin{itemize}
                    \item <>
                \end{itemize}
                <>
            ]],
            {i(1), i(2)}
        ),
        {condition = in_textzone}
    ),

    -- text mode (autosnippets)
    s(
        {
            trig = '\'',
            dscr = 'Expand single quote',
            snippetType = 'autosnippet'
        },
        fmta('`<>\'<>', {i(1), i(2)}),
        {condition = in_textzone}
    ),
    s(
        {
            trig = '\"',
            dscr = 'Expand double quote',
            snippetType = 'autosnippet'
        },
        fmta('``<>\'\'<>', {i(1), i(2)}),
        {condition = in_textzone}
    ),
    s(
        {
            trig = 'mm',
            dscr = 'Begin display math environment',
            snippetType = 'autosnippet'
        },
        fmta('$<>$<>', {i(1), i(2)})
    ),
    
    -- math mode regex (autosnippets)
    s(
        {
            trig = '(%d+)deg',
            dscr = 'Expands nth degree symbol',
            regTrig = true,
            snippetType = 'autosnippet'
        },
        {f(function(args, snip)
            return snip.captures[1] .. '\\degree ' end
        )},
        {condition = in_mathzone}
    ),

    -- math mode (autosnippets)
    s(
        {
            trig = 'acos',
            dscr = 'Expands arccosine symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\arccos <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'asin',
            dscr = 'Expands arcsin symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\arcsin <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'atan',
            dscr = 'Expands arctangent symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\arctan <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'apx',
            dscr = 'Expands approximation symbol',
            snippetType = 'autosnippet'
        },
        t(' \\approx '),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'cos',
            dscr = 'Expands cosine symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\cos <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'cot',
            dscr = 'Expands cotangent symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\cot <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'csc',
            dscr = 'Expands cosicant symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\csc <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'int',
            dscr = 'Expands integral',
            snippetType = 'autosnippet'
        },
        fmta('\\int _{<>} ^{<>} <>', {i(1), i(2), i(3)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'lim',
            dscr = 'Expands limit',
            snippetType = 'autosnippet'
        },
        fmta('\\lim <>', {i(1)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'sec',
            dscr = 'Expands secant symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\sec <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'sin',
            dscr = 'Expands sin symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\sin <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'tan',
            dscr = 'Expands tangent symbol',
            snippetType = 'autosnippet'
        },
        fmta('\\tan <> ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'fa',
            dscr = 'Expands forall',
            snippetType = 'autosnippet'
        },
        fmta('\\forall <>', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'ff',
            dscr = 'Expands function f(x)',
            snippetType = 'autosnippet'
        },
        fmta('f(<>) ', {i(1, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'fn',
            dscr = 'Expands function',
            snippetType = 'autosnippet'
        },
        fmta('<>(<>) ', {i(1, 'f'), i(2, 'x')}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'in',
            dscr = 'Expands epsilon',
            snippetType = 'autosnippet'
        },
        t('\\in '),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'lg',
            dscr = 'Expands log function',
            snippetType = 'autosnippet'
        },
        fmta('\\log_{<>} <> ', {i(1), i(2)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'ln',
            dscr = 'Expands ln function',
                snippetType = 'autosnippet'
            },
        fmta('\\ln <> ', {i(1)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'oo',
            dscr = 'Expands infinity',
            snippetType = 'autosnippet'
        },
        t('\\infty'),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'pp',
            dscr = 'Expands superscript',
            snippetType = 'autosnippet'
        },
        fmta(' ^{<>} ', {i(1)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'ss',
            dscr = 'Expands subscript',
            snippetType = 'autosnippet'
        },
        fmta(' _{<>} ', {i(1)}),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = 'to',
            dscr = 'Expands approaches (\\to)',
            snippetType = 'autosnippet'
        },
        t(' \\to '),
        {condition = in_mathzone}
    ),

    -- math mode
    s(
        {
            trig = 't',
            dscr = 'Expands theta symbol'
        },
        t('\\theta '),
        {condition = in_mathzone}
    ),

    -- math operators (autosnippets)
    s(
        {
            trig = '!=',
            dscr = 'Expands inqeuivelance symbol',
            snippetType = 'autosnippet'
        },
        t('\\neq '),
        {condition = in_mathzone}
    ),
    s(
        {
            trig = '=',
            dscr = 'Expands equal sign',
            snippetType = 'autosnippet'
        },
        t('= '),
        {condition = in_mathzone}
    ),
}
