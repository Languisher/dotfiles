return {
s({trig="bf"},
  fmta(
    [[
      \textbf{<>}
    ]],
    {
      i(1, "Text"),
    }
  )
),
s({trig="uu", snippetType="autosnippet"},
  fmta(
    [[
      \underline{<>}
    ]],
    {
      i(1, "Text"),
    }
  )
),
s({trig="it"},
  fmta(
    [[
      \textit{<>}
    ]],
    {
      i(1, "Text"),
    }
  )
),
-- Example use of insert node placeholder text
s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
  fmta(
    [[\href{<>}{<>}]],
    {
      i(1, "url"),
      i(2, "display name"),
    }
  )
)
}
