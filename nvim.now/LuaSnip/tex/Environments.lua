local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
s({trig="beg", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1, "environment name"),
      i(2, "contents"),
      rep(1),  -- this node repeats insert node i(1)
    }
  ),
  {condition = line_begin}
),

s({trig="fig", snippettype="autosnippet"},
  fmta(
    [[
      \begin{figure}[H] %h:当前位置, t:顶部, b:底部, p:浮动页
        \centering
        \includegraphics[width=0.8\textwidth]{./assets/<>}
        \caption{<>}
        \label{fig:<>}
      \end{figure}

      <>
    ]],
    {
      i(1, "figure name"),
      rep(1),
      rep(1),
      i(0)
    }
  ),
  {condition = line_begin}
),
-- ITEMIZE
s({trig="item", snippetType="autosnippet"},
  fmta(
    [[
    \begin{itemize}

        \item <>

    \end{itemize}
  ]],
    {
      i(0),
    }
  ),
  {condition = line_begin}
),
-- ENUMERATE
s({trig="enum", snippetType="autosnippet"},
  fmta(
    [[
    \begin{enumerate}

        \item <>

    \end{enumerate}
  ]],
    {
      i(0),
    }
  )
),
}
