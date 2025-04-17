return {
  {
    "nvim-orgmode/orgmode",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup treesitter
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" },
      })

      -- Setup orgmode with custom heading markup
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
