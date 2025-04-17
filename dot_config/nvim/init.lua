-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Optional: Add this to your init.lua if you want to ensure pywal colors are loaded
-- even when nvim is started without an existing cache
--vim.api.nvim_create_autocmd("VimEnter", {
--  callback = function()
--    if vim.g.colors_name ~= "pywal" then
--      vim.cmd.colorscheme("pywal")
--    end
--  end,
--})

-- Optional: Force transparent background
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Customize these settings as needed
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end,
})
