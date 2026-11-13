# Neovim config

Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

## Differences from stock Kickstart

- **Emacs Keybindings:** - Insert mode has emacs keybindings, C-f, C-b, M-f, M-b, C-d, M-d, etc
- **File tree:** <leader>tt to toggle nvim-tree
- **debugging:** <leader>c to launch debugger. Prompts to select a cmake target if in a cmake project. Also <leader>n (next), i (in), o (out).
- **Leap:** Leap is used to jump anywhere in the visible buffer. Type the character at the intended destination, then the character after. If necessary, type the displayed target char, or enter to cycle.
 - s to leap forward
 - S to leap backwards
 - gs to leap to a different visible buffer
 - leap-treesitter allows selecting areas based on the syntax tree. 'van' to select, 'yan' to yank, etc.

