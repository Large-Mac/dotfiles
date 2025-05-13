return {
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000, -- Ensures this loads before other colorschemes
    lazy = false, -- Make sure the colorscheme is loaded during startup
    config = function()
      require("modus-themes").setup({
        -- Theme style options: "auto", "modus_operandi" (light), or "modus_vivendi" (dark)
        style = "modus_operandi", -- Will follow your vim.o.background setting

        -- Variant options: "default", "tinted", "deuteranopia", or "tritanopia"
        variant = "default",

        -- Other customization options
        transparent = true,
        dim_inactive = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
        },
      })

      -- Set the colorscheme after setup
      vim.cmd("colorscheme modus")
    end,
  },
}
