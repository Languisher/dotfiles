require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-------------------------
-- LuaSnip Configuration
-------------------------
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

local ls = require("luasnip")
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-z>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-z>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-x>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-x>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


-- Load all snippets from the nvim/LuaSnip directory at startup
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})


-------------------------
-- Vimtex Configuration
-------------------------
vim.cmd[[
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_mode=0

    function! s:write_server_name() abort
        let nvim_server_file = (has('win32') ? $TEMP : '/tmp') . '/vimtexserver.txt'
        call writefile([v:servername], nvim_server_file)
      endfunction

    augroup vimtex_common
      autocmd!
      autocmd FileType tex call s:write_server_name()
      autocmd FileType tex nmap <buffer> <F9> <plug>(vimtex-compile)
    augroup END

    let g:vimtex_compiler_latexmk = {
          \ 'build_dir' : 'build',
          \ }

    " TOC settings
    let g:vimtex_toc_config = {
          \ 'name' : 'TOC',
          \ 'layers' : ['content', 'todo', 'include'],
          \ 'resize' : 1,
          \ 'split_width' : 30,
          \ 'todo_sorted' : 0,
          \ 'show_help' : 1,
          \ 'show_numbers' : 1,
          \ 'mode' : 2,
          \ }

    let g:vimtex_view_method = "skim"
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
    let g:vimtex_view_skim_sync = 1     
    let g:vimtex_view_skim_activate = 1 
        

    nnoremap <F6> :VimtexTocToggle<CR>
]]

