return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tao-yang",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          prefix = "●",
        },
        underline = true,
      },
    },
  },
}
