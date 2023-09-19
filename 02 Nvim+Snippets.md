# Nvim + Snippets

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

### Snippet anatomy

#### Abbreviations used in the LuaSnips docs (\*)

 LuaSnip defines a globally-available set of abbreviations for common modules that make writing snippets much easier. 

```lua
-- Abbreviations used in this article and the LuaSnip docs
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
```



#### Format

You create snippets by specifying:

1. the snippet’s basic parameters (trigger, name, etc.),
2. the snippet’s nodes, and
3. possibly some custom expansion conditions and callback functions.

```lua
-- Anatomy of a LuaSnip snippet
require("luasnip").snippet(
  snip_params:table,  -- table of snippet parameters
  nodes:table,        -- table of snippet nodes
  opts:table|nil      -- *optional* table of additional snippet options
)
```

**Setting snippet parameters** :

```lua
return {
  -- Example: how to set snippet parameters
  require("luasnip").snippet(
    { -- Table 1: snippet parameters
      trig="hi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
      snippetType="autosnippet"
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
}
```

**Commun shortcout** : The `trig` key is the only required snippet key.

```lua
return {
  -- Shorthand
  s("hi",  -- LuaSnip expands this to {trig = "hi"}
    { t("Hello, world!"), }
  ),
  -- Here is the equivalent longhand
  s({trig = "hi"}  -- explicitly setting trigger via params table
    { t("Hello, world!"), }
  ),
}
```

### Actually writing snippets

#### Text node

Text nodes insert static text into a snippet. Here are **typical text node use cases**:

- When used on their own, text nodes can transform a short, easy-to-type trigger into a longer, inconvenient-to-type piece of text.
- When used with other nodes, text nodes provide a template of static boilerplate text into which you dynamically insert variable text with, for example, insert or dynamic nodes.

```lua
return {
-- A simple "Hello, world!" text node
s(
  {trig = "hi"}, -- Table of snippet parameters
  { -- Table of snippet nodes
    t("Hello, world!")
  }
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

## References

- [A LuaSnip guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/luasnip/#getting-started)
