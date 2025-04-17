-- Modus Operandi color scheme for Neovim
-- Compatible with LazyVim

local M = {}

-- Define the color palette
local colors = {
  -- Base colors
  bg_main = "#ffffff",
  bg_dim = "#f2f2f2",
  fg_main = "#000000",
  fg_dim = "#595959",
  fg_alt = "#193668",
  bg_active = "#c4c4c4",
  bg_inactive = "#e0e0e0",
  border = "#9f9f9f",

  -- Accent colors
  red = "#a60000",
  red_warmer = "#972500",
  red_cooler = "#a0132f",
  green = "#006800",
  green_warmer = "#316500",
  green_cooler = "#00663f",
  yellow = "#6f5500",
  yellow_warmer = "#884900",
  yellow_cooler = "#7a4f2f",
  blue = "#0031a9",
  blue_warmer = "#3548cf",
  blue_cooler = "#0000b0",
  magenta = "#721045",
  magenta_warmer = "#8f0075",
  magenta_cooler = "#531ab6",
  cyan = "#005e8b",
  cyan_warmer = "#3f578f",
  cyan_cooler = "#005f5f",

  -- Background accents
  bg_red_subtle = "#ffcfbf",
  bg_green_subtle = "#b3fabf",
  bg_yellow_subtle = "#fff576",
  bg_blue_subtle = "#ccdfff",
  bg_magenta_subtle = "#ffddff",
  bg_cyan_subtle = "#bfefff",

  -- Misc colors
  rust = "#8a290f",
  gold = "#80601f",
  olive = "#56692d",
  slate = "#2f3f83",
  indigo = "#4a3a8a",
  maroon = "#731c52",
  pink = "#7b435c",

  -- Extra elements
  diff_added = "#e0f6e0",
  diff_changed = "#f8f0d0",
  diff_removed = "#ffe8e8",
  diff_refine_added = "#b3fabf",
  diff_refine_changed = "#fff576",
  diff_refine_removed = "#ffcfbf",

  -- Shades for UI elements
  gray1 = "#f0f0f0",
  gray2 = "#e0e0e0",
  gray3 = "#c4c4c4",
  gray4 = "#9f9f9f",
  gray5 = "#7a7a7a",
  gray6 = "#595959",
}

-- Function to set the colorscheme
function M.setup()
  -- Clear existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set colorscheme name
  vim.g.colors_name = "modus-operandi"

  -- Define highlight groups
  local groups = {
    -- UI Elements
    Normal = { fg = colors.fg_main, bg = colors.bg_main },
    NormalFloat = { fg = colors.fg_main, bg = colors.bg_dim },
    LineNr = { fg = colors.fg_dim, bg = colors.bg_dim },
    CursorLine = { bg = colors.bg_dim },
    CursorLineNr = { fg = colors.fg_alt, bold = true },
    VertSplit = { fg = colors.border },
    StatusLine = { fg = colors.fg_main, bg = colors.bg_active },
    StatusLineNC = { fg = colors.fg_dim, bg = colors.bg_inactive },
    Pmenu = { fg = colors.fg_main, bg = colors.bg_dim },
    PmenuSel = { fg = colors.fg_main, bg = colors.bg_active },
    PmenuSbar = { bg = colors.bg_inactive },
    PmenuThumb = { bg = colors.border },
    Search = { fg = colors.fg_main, bg = colors.bg_yellow_subtle },
    IncSearch = { fg = colors.fg_main, bg = colors.bg_yellow_subtle, bold = true },
    Visual = { bg = colors.bg_blue_subtle },
    Folded = { fg = colors.fg_dim, bg = colors.bg_dim, italic = true },
    Directory = { fg = colors.blue },

    -- Diff
    DiffAdd = { bg = colors.diff_added },
    DiffChange = { bg = colors.diff_changed },
    DiffDelete = { bg = colors.diff_removed },
    DiffText = { bg = colors.diff_refine_changed },

    -- Syntax
    Comment = { fg = colors.fg_dim, italic = true },
    Title = { fg = colors.fg_alt, bold = true },
    Constant = { fg = colors.blue_cooler },
    String = { fg = colors.green },
    Character = { fg = colors.green_cooler },
    Number = { fg = colors.blue_warmer },
    Boolean = { fg = colors.cyan },
    Float = { fg = colors.blue_warmer },
    Identifier = { fg = colors.cyan },
    Function = { fg = colors.blue },
    Statement = { fg = colors.magenta },
    Conditional = { fg = colors.magenta_warmer },
    Repeat = { fg = colors.magenta_warmer },
    Label = { fg = colors.magenta },
    Operator = { fg = colors.fg_main },
    Keyword = { fg = colors.magenta_cooler },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.red_cooler },
    Include = { fg = colors.red_warmer },
    Define = { fg = colors.red_warmer },
    Macro = { fg = colors.red_warmer },
    PreCondit = { fg = colors.red_cooler },
    Type = { fg = colors.cyan_warmer },
    StorageClass = { fg = colors.cyan_warmer },
    Structure = { fg = colors.cyan },
    Typedef = { fg = colors.cyan_warmer },
    Special = { fg = colors.yellow },
    SpecialChar = { fg = colors.yellow_cooler },
    Tag = { fg = colors.fg_alt },
    Delimiter = { fg = colors.fg_dim },
    SpecialComment = { fg = colors.fg_alt, italic = true },
    Debug = { fg = colors.yellow_warmer },
    Underlined = { underline = true },
    Error = { fg = colors.red, bg = colors.bg_red_subtle },
    Todo = { fg = colors.magenta_warmer, bold = true },

    -- LazyVim specific highlights
    LazyNormal = { fg = colors.fg_main, bg = colors.bg_dim },
    MiniIndentscopeSymbol = { fg = colors.blue_cooler },
    IlluminatedWordText = { bg = colors.bg_dim },
    IlluminatedWordRead = { bg = colors.bg_dim },
    IlluminatedWordWrite = { bg = colors.bg_dim },

    -- Git signs
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- LSP
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.green },
    DiagnosticVirtualTextError = { fg = colors.red, bg = colors.bg_red_nuanced },
    DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.bg_yellow_nuanced },
    DiagnosticVirtualTextInfo = { fg = colors.blue, bg = colors.bg_blue_nuanced },
    DiagnosticVirtualTextHint = { fg = colors.green, bg = colors.bg_green_nuanced },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.green },

    -- Telescope
    TelescopeNormal = { fg = colors.fg_main, bg = colors.bg_dim },
    TelescopeBorder = { fg = colors.border, bg = colors.bg_dim },
    TelescopePromptBorder = { fg = colors.border, bg = colors.bg_dim },
    TelescopeResultsBorder = { fg = colors.border, bg = colors.bg_dim },
    TelescopePreviewBorder = { fg = colors.border, bg = colors.bg_dim },
    TelescopeSelection = { fg = colors.fg_main, bg = colors.bg_active },
    TelescopeSelectionCaret = { fg = colors.blue, bg = colors.bg_active },
    TelescopeMultiSelection = { fg = colors.fg_dim, bg = colors.bg_active },
    TelescopeMatching = { fg = colors.blue, bold = true },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg_main, bg = colors.bg_dim },
    NvimTreeEndOfBuffer = { fg = colors.bg_dim, bg = colors.bg_dim },
    NvimTreeRootFolder = { fg = colors.fg_alt, bold = true },
    NvimTreeGitDirty = { fg = colors.yellow },
    NvimTreeGitNew = { fg = colors.green },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeSpecialFile = { fg = colors.blue, underline = true },
    NvimTreeIndentMarker = { fg = colors.fg_dim },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeFolderName = { fg = colors.fg_main },

    -- Treesitter
    ["@punctuation"] = { fg = colors.fg_dim },
    ["@constant"] = { fg = colors.blue_cooler },
    ["@constructor"] = { fg = colors.cyan },
    ["@tag"] = { fg = colors.magenta },
    ["@variable"] = { fg = colors.fg_main },
    ["@variable.builtin"] = { fg = colors.cyan_warmer },
    ["@tag.attribute"] = { fg = colors.cyan_warmer },
    ["@property"] = { fg = colors.cyan },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.blue_warmer },
    ["@function.macro"] = { fg = colors.red_warmer },
    ["@keyword"] = { fg = colors.magenta_cooler },
    ["@keyword.function"] = { fg = colors.magenta_warmer },
    ["@keyword.return"] = { fg = colors.magenta },
    ["@string"] = { fg = colors.green },
    ["@string.regex"] = { fg = colors.green_cooler },
    ["@string.escape"] = { fg = colors.green_warmer },
    ["@type"] = { fg = colors.cyan_warmer },
    ["@type.builtin"] = { fg = colors.cyan },
    ["@field"] = { fg = colors.cyan },
    ["@parameter"] = { fg = colors.fg_main },
    ["@label"] = { fg = colors.magenta },
    ["@comment"] = { fg = colors.fg_dim, italic = true },
    ["@operator"] = { fg = colors.fg_main },
    ["@number"] = { fg = colors.blue_warmer },
    ["@boolean"] = { fg = colors.cyan },
  }

  -- Set all highlight groups
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

-- Return the module
return M
