return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = false },
    },
    lazy = false,
    config = function()
      -- Setup orgmode first
      require("orgmode").setup({
        org_agenda_files = { "~/orgfiles/**/*" },
        org_default_notes_file = "~/orgfiles/refile.org",
        org_custom_markup = {
          heading1 = "◉",
          heading2 = "○",
          heading3 = "✸",
          heading4 = "✿",
          heading5 = "⚘",
          heading6 = "❀",
        },
      })
    end,
  },
}
