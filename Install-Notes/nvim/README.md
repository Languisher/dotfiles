# Nvim

## Files

Documentions and configuration notes

- [01 Nvim+Nvchad.md](nvim/01 Nvim+Nvchad.md) 
- [02 Nvim+Snippets (Lua).md](nvim/02 Nvim+Snippets.md) 
- [03 Nvim+Latex.md](nvim/03 Nvim+Latex.md) 

## Nvim Cheatsheet

### 复制多项内容/复制历史

复制内容是没有历史的，但删除历史保存在编号寄存器 1-9 中（以行为单位的删除或者超过一行的删除才会进入编号寄存器）：

- `"1` 保存上一次删除的内容。
- `"2` 保存上上次删除的内容。
- `"3` 保存上上上次删除的内容。
- 以此类推……

Vim 有 26 个命名寄存器（`"a`-`"z`），可以在删除或复制之前加寄存器名字，来保存在某个寄存器中，这样可以同时保存很多拷贝的内容。比如：

- 按下 `v` 选则需要复制的区域。
- `"ay` 把选区复制到 `"a` 寄存器中。
- `"ap` 把寄存器 `"a` 的内容粘贴出来。

## Reference

- [在 Vim 中复制、剪切和粘贴](https://harttle.land/2022/03/19/vim-copy-paste.html)

