local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
s({trig="dfn", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Definition}[colbacktitle=red!75!black]{<>}{}
      <>
      \end{Definition}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),

s({trig="thm", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Theorem}{<>}{}
      <>
      \end{Theorem}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),

s({trig="cor", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Corollary}{<>}{}
      <>
      \end{Corollary}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),


s({trig="len", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Lenma}{<>}{}
      <>
      \end{Lenma}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),

s({trig="prop", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Prop}{<>}{}
      <>
      \end{Prop}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),


s({trig="ex", snippetType="autosnippet"},
  fmta(
    [[
      \begin{Example}{<>}{}
      <>
      \end{Example}

      <>
    ]],
    {
      i(1, "Title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),

s({trig="qs", snippettype="autosnippet"},
  fmta(
    [[
      \begin{question}{<>}{}
      <>
      \end{question}

      <>
    ]],
    {
      i(1, "title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),


s({trig="proof", snippettype="autosnippet"},
  fmta(
    [[
      \begin{myproof}{}{}
      <>
      \end{myproof}

      <>
    ]],
    {
      i(1),
      i(0)
    }
  ),
  {condition = line_begin}
),

s({trig="note", snippettype="autosnippet"},
  fmta(
    [[
      \begin{note}{<>}{}
      <>
      \end{note}

      <>
    ]],
    {
      i(1, "title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),


s({trig="qs", snippettype="autosnippet"},
  fmta(
    [[
      \begin{question}{<>}{}
      <>
      \end{question}

      <>
    ]],
    {
      i(1, "title"),
      i(2),
      i(0)
    }
  ),
  {condition = line_begin}
),
}
