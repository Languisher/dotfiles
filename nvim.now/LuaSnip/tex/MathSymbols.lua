-- Math context detection 
local tex = {}
local line_begin = require("luasnip.extras.expand_conditions").line_begin
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  ----------------------------------
  -- Creating Math Environments
  ----------------------------------
  s({trig="mk", snippetType="autosnippet"},
    fmta(
      [[
        $<>$
      ]],
      {
        i(1, "Equation"),
      }
    )
  ),

  s({trig="dm", snippettype="autosnippet"},
    fmta(
      [[
        \begin{equation}
          <>
        \end{equation}
      ]],
      {
        i(1, "equation"),
      },
      {condition = line_begin}  -- set condition in the `opts` table
    )
  ),

  s({trig="ali", snippettype="autosnippet"},
    fmta(
      [[
        \begin{align}
          <>
        \end{align}
      ]],
      {
        i(1, "equation"),
      },
      {condition = line_begin}  -- set condition in the `opts` table
    )
  ),

  s({trig="gat", snippettype="autosnippet"},
    fmta(
      [[
        \begin{gather}
          <>
        \end{gather}
      ]],
      {
        i(1, "equation"),
      },
      {condition = line_begin}  -- set condition in the `opts` table
    )
  ),


  ----------------------------------
  -- Text
  ----------------------------------
  s({trig="tt", snippettype="autosnippet"},
    fmta(
      [[
        \text{<>}
      ]],
      {
        i(1),
      },
      {condition = tex.in_mathzone}
    )
  ),
  ----------------------------------
  -- Operations (Text)
  ----------------------------------
  s({trig="xx", snippetType="autosnippet"},
    {
      t("\\times"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig=">=", snippetType="autosnippet"},
    {
      t("\\ge"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="<=", snippetType="autosnippet"},
    {
      t("\\le"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="=>", snippetType="autosnippet"},
    {
      t("\\implies"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="->", snippetType="autosnippet"},
    {
      t("\\to"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="=<", snippetType="autosnippet"},
    {
      t("\\impliedby"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="iff", snippetType="autosnippet"},
    {
      t("\\iff"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="card", snippetType="autosnippet"},
    {
      t("\\mathrm{card}"),
    },
      {condition = tex.in_mathzone}
  ),


  s({trig="exp", snippetType="autosnippet"},
    {
      t("\\exp"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="ln", snippetType="autosnippet"},
    {
      t("\\ln"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="sr", snippetType="autosnippet"},
    {
      t("^2"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="ooo", snippetType="autosnippet"},
    {
      t("\\infty"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="cc", snippetType="autosnippet"},
    {
      t("\\subset"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="AA", snippetType="autosnippet"},
    {
      t("\\forall"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="EE", snippetType="autosnippet"},
    {
      t("\\exists"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="xnn", snippetType="autosnippet"},
    {
      t("\\x_{n}"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="ynn", snippetType="autosnippet"},
    {
      t("\\y_{n}"),
    },
      {condition = tex.in_mathzone}
  ),

  -- PARALLEL SYMBOL, i.e. \parallel
  s({trig = "||", snippetType="autosnippet"},
    {
      t("\\parallel"),
    }
  ),

  -- Equiv
  s({trig = "eqq", snippetType="autosnippet"},
      {
        t("\\equiv "),
      }
    ),
  -- Intégrals

  s({trig="in2", snippetType="autosnippet"},
    {
      t("\\iint"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="in3", snippetType="autosnippet"},
    {
      t("\\iiint"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig = "oi1", snippetType="autosnippet"},
    {
      t("\\oint"),
    },
    {condition = tex.in_mathzone}
  ),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({trig = "oi2", snippetType="autosnippet"},
    {
      t("\\oiint"),
    },
    {condition = tex.in_mathzone}
  ),

  s({trig="int", snippetType="autosnippet"},
    fmta(
      "\\int_{<>}^{<>}",
      {
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),


  s({trig="intf", snippetType="autosnippet"},
    {
      t("\\int_{\\infty}^{\\infty}"),
    },
      {condition = tex.in_mathzone}
  ),
  s({trig="tt", snippettype="autosnippet"},
    fmta(
      [[
        \text{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="td", snippettype="autosnippet"},
    fmta(
      [[
        ^{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),


  s({trig="ee", snippetType="autosnippet"},
    fmta(
      [[
        e^{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="ss", snippetType="autosnippet"},
      {
        t("_{"),
        i(1),
        t("}")
      },
    {condition = tex.in_mathzone}
  ),

  s({trig="ov", snippetType="autosnippet"},
    fmta(
      [[
        \overline{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="{}", snippetType="autosnippet"},
    fmta(
      [[
        \{ <> \}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="lrp", snippetType="autosnippet"},
    fmta(
      [[
        \left( <> \right)
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="lrb", snippetType="autosnippet"},
    fmta(
      [[
        \left[ <> \right]
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="sq", snippetType="autosnippet"},
    fmta(
      [[
        \sqrt{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="li2"},
    fmta(
      [[
        <> \overset{<>}{\underset{<>}{\longrightarrow}} <>
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="lim"},
    fmta(
      [[
        <> \underset{<>}{\longrightarrow} <>
      ]],
      {
        i(1),
        i(2),
        i(3),
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="prod"},
    fmta(
      [[
        \prod_{<>}^{<>}
      ]],
      {
        i(1),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="norm", snippetType="autosnippet"},
    fmta(
      [[
        \| <> \|
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="mrm", snippetType="autosnippet"},
    fmta(
      [[
        \mathrm{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),


  s({trig="msc", snippetType="autosnippet"},
    fmta(
      [[
        \mathscr{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="mca", snippetType="autosnippet"},
    fmta(
      [[
        \mathcal{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig="mbb", snippetType="autosnippet"},
    fmta(
      [[
        \mathbb{<>}
      ]],
      {
        i(1)
      }
    ),
    {condition = tex.in_mathzone}
  ),
  s({trig="vec", snippetType="autosnippet"},
    fmta(
      [[
        \overrightarrow{<>}
      ]],
      {
        i(1)
      }
    ),
      {condition = tex.in_mathzone}
  ),
  s({trig="hat", snippetType="autosnippet"},
    fmta(
      [[
        \hat{<>}
      ]],
      {
        i(1)
      }
    ),
      {condition = tex.in_mathzone}
  ),

  s({trig="wave", snippetType="autosnippet"},
    fmta(
      [[
        \widetlide{<>}
      ]],
      {
        i(1)
      }
    ),
      {condition = tex.in_mathzone}
  ),
  s({trig="binom", snippetType="autosnippet"},
    fmta(
      [[
        \binom{<>}{<>}
      ]],
      {
        i(1),
        i(2)
      }
    ),
      {condition = tex.in_mathzone}
  ),

  s({trig="fr", snippetType="autosnippet"},
    fmta(
      [[
        \frac{<>}{<>} <>
      ]],
      {
        i(1),
        i(2),
        i(0)
      }
    ),
      {condition = tex.in_mathzone}
  ),
  s({trig="part", snippetType="autosnippet"},
    fmta(
      [[
        \frac{\partial <>}{\partial <>} <>
      ]],
      {
        i(1),
        i(2, "t"),
        i(0)
      }
    ),
      {condition = tex.in_mathzone}
  ),


  s({trig="sum", snippetType="autosnippet"},
    fmta(
      [[
        \sum_{<>}^{<>}
      ]],
      {
        i(1),
        i(2)
      }
    ),
    {condition = tex.in_mathzone}
  ),

  s({trig = "ps"},
    fmta(
      "\\langle <> \\rangle",
      {
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
    ----------------------------------
    -- Physique
    ----------------------------------
  s({trig="rot", snippetType="autosnippet"},
    fmta(
      [[
        \overrightarrow{\mathrm{rot}}<>
      ]],
      {
        i(0)
      }
    ),
      {condition = tex.in_mathzone}
  ),
  s({trig="grad", snippetType="autosnippet"},
    fmta(
      [[
        \overrightarrow{\mathrm{grad}}<>
      ]],
      {
        i(0)
      }
    ),
      {condition = tex.in_mathzone}
  ),

  s({trig="div", snippetType="autosnippet"},
    fmta(
      [[
        \mathrm{div}<>
      ]],
      {
        i(0),
      }
    ),
      {condition = tex.in_mathzone}
  ),

  s({trig="nab", snippetType="autosnippet"},
    {
      t("\\nabla"),
    },
      {condition = tex.in_mathzone}
  ),
  ----------------------------------
  -- Linear Algebra
  ----------------------------------
  s({trig="Vect", snippetType="autosnippet"},
    {
      t("\\text{Vect}"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="Ker", snippetType="autosnippet"},
    {
      t("\\text{Ker }"),
    },
      {condition = tex.in_mathzone}
  ),

  s({trig="Im", snippetType="autosnippet"},
    {
      t("\\text{Im }"),
    },
      {condition = tex.in_mathzone}
  ),

}

