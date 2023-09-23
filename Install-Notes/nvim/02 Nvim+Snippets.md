# Nvim + Snippets (Lua)

> Date : 09.19.2023

## Preliminary

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) installed (assured by Nvchad)
- Enter `./config/nvim/` folder

## Getting started

### Configs

Two configuration settings in `./init.lua` : one enables autotriggered snippets and the other enables visual selection.

```lua
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})
```

### Snippet trigger and tabstop navigation keys

- Use two different keys (e.g. Tab and **Control-f**) to expand snippets and jump forward through snippet tabstops. 
- Set a backward-jump keymap : **Shift-Tab**

Type in `./init.lua` :

```lua
vim.cmd[[
" Expand snippets in insert mode with Tab
imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

" Jump forward in through tabstops in insert and visual mode with Control-f
imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'

" Jump backward through snippet tabstops with Shift-Tab (for example)
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]
```

## Snippet format

### Directory structure

```shell
# Example LuaSnip directory structure
${HOME}/.config/nvim/LuaSnip/
├── all.lua
├── markdown.lua
├── python.lua
└── tex
    ├── delimiters.lua
    ├── environments.lua
    ├── fonts.lua
    └── math.lua
```

Explications :

- Name each snippet file appropriately: The file’s base name determines which Vim `filetype` the snippets apply to. For example, snippets inside the file `tex.lua`would apply to files with `filetype=tex`, snippets inside `html.lua` to files with `filetype=html`, and so on.

    If you want certain snippets to apply globally to *all* file types, place these global snippets in the file `all.lua`. (This is the same naming scheme used by UltiSnips, in case you are migrating from UltiSnips).

- LuaSnip will then load *all* `*.lua` files inside this filetype subdirectory,
- I have a lot of `tex` snippets, so I prefer to further organize them in a dedicated subdirectory with individual files for LaTeX delimiters, environments, and so on.

### Basic lua file stucture

```lua
-- Example : all.lua
return {
    -- insert snnipets here
}
```

### Actually writing snippets

For more information on the bases of LuaSnipets, click the link in the Reference.

#### Snippet parameters (\*)

- `trig = "..."` (Necessary), Regex expression

- `snippetType = "autosnippet"`

#### Text node

Text nodes insert static text into a snippet. Here are **typical text node use cases**:

```lua
s({trig = "hi"}, -- Table of snippet parameters
  { -- Table of snippet nodes
    t("Hello, world!")
  }
),
```

#### Insert node

Insert nodes are positions within a snippet at which you can dynamically type text.

LuaSnip insert nodes are analogous to other snippet engines' tabstops (`$1`, `$2`, etc.).

##### Format

**Format** (**fmt** and **fmta**): a human-friendly syntax for writing snippets.

```lua
-- Equation
s({trig="eq", dscr="Expands 'eq' into an equation environment"},
  fmta(
     [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
     { i(1) }
  )
)
```

##### Repeated nodes

```lua
s({trig="env", snippetType="autosnippet"},
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1),  -- this node repeats insert node i(1)
    }
  )
),
```

##### Node placeholder text

Description or default text.

```lua
-- Example use of insert node placeholder text
s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
  fmta(
    [[\href{<>}{<>}]],
    {
      i(1, "url"),
      i(2, "display name"),
    }
  )
),
```

#### Visual placeholder

#### Context-specific expansion for LaTeX

```lua
-- Example: expanding a snippet on a new line only.
-- In a snippet file, first require the line_begin condition...
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- ...then add `condition=line_begin` to any snippet's `opts` table:
return {
s({trig = "h1", dscr="Top-level section"},
  fmta(
    [[\section{<>}]],
    { i(1) }
  ), 
  {condition = line_begin}  -- set condition in the `opts` table
),
}
```

### Load snippets

Load snippets by calling the LuaSnip Lua loader’s `load` function from somewhere in your Neovim startup config (e.g. `init.lua`)

```lua
-- In init.lua
-- Load all snippets from the nvim/LuaSnip directory at startup
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
```

## TODO

- [ ] 3.3.4 Visual placeholder

## References

- [A LuaSnip guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#getting-started)

- [ ] [Snippet reference](https://github.com/ejmastnak/dotfiles/tree/main/config/nvim/LuaSnip/tex)
