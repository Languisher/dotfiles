local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
s({trig="draw", snippetType="autosnippet"},
  fmta(
    [[
      \begin{center}
          \begin{tikzpicture}
            %\draw[option] (pos)--(pos);
            %\filldraw (pos) circle (rad);
            <>
          \end{tikzpicture}
      \end{center}

      <>
    ]],
    {
      i(1, "contents"),
      i(0),
    }
  ),
  {condition = line_begin}
),

s({trig="func", snippettype="autosnippet"},
  fmta(
    [[
      \draw[domain =<>:<>] plot (\x ,{<>}) node[right] {$<>$};
      <>
    ]],
    {
      i(1, "left domain"),
      i(2, "right domain"),
      i(3, "function expression"),
      i(4, "label"),
      i(0)
    }
  )
)
}
