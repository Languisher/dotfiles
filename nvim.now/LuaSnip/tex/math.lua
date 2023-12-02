-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return
{

  ----------------------------------
  -- Creating Math Environments
  ----------------------------------


  -- LOGARITHM WITH BASE SUBSCRIPT
  s({trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\log_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),
























  -- SUM with lower limit
  s({trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\sum_{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
      }
    ),
    {condition = tex.in_mathzone}
  ),

  -- BEGIN STATIC SNIPPETS

  -- DIFFERENTIAL, i.e. \diff
  s({trig = "df", snippetType="autosnippet", priority=2000, snippetType="autosnippet"},
    {
      t("\\diff"),
    },
    {condition = tex.in_mathzone}
  ),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({trig = "laa", snippetType="autosnippet"},
    {
      t("\\laplacian "),
    },
    {condition = tex.in_mathzone}
  ),
  -- CDOTS, i.e. \cdots
  s({trig = "cdd", snippetType="autosnippet"},
    {
      t("\\cdots"),
    }
  ),
  -- LDOTS, i.e. \ldots
  s({trig = "ldd", snippetType="autosnippet"},
    {
      t("\\ldots"),
    }
  ),
  -- EQUIV, i.e. \equiv
  -- SETMINUS, i.e. \setminus
  s({trig = "stm", snippetType="autosnippet"},
    {
      t("\\setminus "),
    }
  ),
  -- APPROX, i.e. \approx
  s({trig = "px", snippetType="autosnippet"},
    {
      t("\\approx "),
    },
    {condition = tex.in_mathzone}
  ),
  -- PROPTO, i.e. \propto
  s({trig = "pt", snippetType="autosnippet"},
    {
      t("\\propto "),
    },
    {condition = tex.in_mathzone}
  ),
  -- COLON, i.e. \colon
  s({trig = "::", snippetType="autosnippet"},
    {
      t("\\colon "),
    }
  ),
}
