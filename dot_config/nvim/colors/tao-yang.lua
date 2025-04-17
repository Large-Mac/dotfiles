-- tao-yang.lua
-- A colorscheme inspired by Emacs tao-yang theme
-- Minimalist, low-contrast design with subtle colors

-- Clear existing highlights
vim.cmd("highlight clear")
if vim.g.syntax_on then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "tao-yang"

-- Define colors
local colors = {
  -- Base colors
  white = "#F8F8F8",
  light_gray = "#D0D0D0",
  mid_gray = "#707070",
  dark_gray = "#505050",
  darker_gray = "#303030",

  -- Accent colors
  red = "#8C5353",
  bright_red = "#C26161",
  green = "#4F6C4A",
  bright_green = "#629A59",
  yellow = "#856B39",
  bright_yellow = "#B38D52",
  blue = "#4A708B",
  bright_blue = "#5F8FB3",
  magenta = "#8B7189",
  bright_magenta = "#AB85A3",
  cyan = "#508A88",
  bright_cyan = "#69B2B0",

  -- Additional shades
  bg_highlight = "#EFEFEF",
  bg_visual = "#E5E5E5",
  bg_selection = "#DFDFDF",
  bg_popup = "#F0F0F0",
  comment = "#909090",
}

-- Function to create highlight groups
local function highlight(group, opts)
  local style = opts.style and "gui=" .. opts.style or "gui=NONE"
  local fg = opts.fg and "guifg=" .. opts.fg or "guifg=NONE"
  local bg = opts.bg and "guibg=" .. opts.bg or "guibg=NONE"
  local sp = opts.sp and "guisp=" .. opts.sp or ""

  vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

-- Core highlights
local base_highlights = {
  -- UI elements
  Normal = { fg = colors.dark_gray, bg = colors.white },
  NormalFloat = { fg = colors.dark_gray, bg = colors.bg_popup },
  LineNr = { fg = colors.mid_gray, bg = colors.white },
  SignColumn = { fg = colors.mid_gray, bg = colors.white },
  EndOfBuffer = { fg = colors.light_gray },
  ColorColumn = { bg = colors.bg_highlight },
  Folded = { fg = colors.comment, bg = colors.bg_highlight },
  FoldColumn = { fg = colors.mid_gray, bg = colors.white },

  -- Status line
  StatusLine = { fg = colors.dark_gray, bg = colors.light_gray },
  StatusLineNC = { fg = colors.mid_gray, bg = colors.light_gray },

  -- Cursor
  Cursor = { fg = colors.white, bg = colors.dark_gray },
  CursorLine = { bg = colors.bg_highlight },
  CursorLineNr = { fg = colors.dark_gray, bg = colors.bg_highlight, style = "bold" },
  CursorColumn = { bg = colors.bg_highlight },
  TermCursor = { fg = colors.white, bg = colors.dark_gray },
  TermCursorNC = { fg = colors.light_gray, bg = colors.mid_gray },

  -- Split
  VertSplit = { fg = colors.light_gray, bg = colors.white },
  WinSeparator = { fg = colors.light_gray, bg = colors.white },

  -- Tabs
  TabLine = { fg = colors.mid_gray, bg = colors.light_gray },
  TabLineFill = { fg = colors.mid_gray, bg = colors.light_gray },
  TabLineSel = { fg = colors.dark_gray, bg = colors.white, style = "bold" },

  -- Search
  Search = { fg = colors.darker_gray, bg = colors.bright_yellow },
  IncSearch = { fg = colors.darker_gray, bg = colors.bright_yellow },

  -- Selection
  Visual = { bg = colors.bg_visual },
  VisualNOS = { bg = colors.bg_visual },

  -- Popup menu
  Pmenu = { fg = colors.dark_gray, bg = colors.bg_popup },
  PmenuSel = { fg = colors.darker_gray, bg = colors.bg_selection },
  PmenuSbar = { bg = colors.light_gray },
  PmenuThumb = { bg = colors.mid_gray },

  -- Messages
  WarningMsg = { fg = colors.yellow },
  ErrorMsg = { fg = colors.bright_red },
  ModeMsg = { fg = colors.dark_gray, style = "bold" },
  MoreMsg = { fg = colors.green },
  Question = { fg = colors.blue },

  -- Special
  SpecialKey = { fg = colors.cyan },
  NonText = { fg = colors.light_gray },
  Directory = { fg = colors.bright_blue },
  Title = { fg = colors.bright_magenta, style = "bold" },

  -- Diff
  DiffAdd = { bg = "#DFF0D8" },
  DiffChange = { bg = "#FCF8E3" },
  DiffDelete = { bg = "#F2DEDE" },
  DiffText = { bg = "#FCE3B5" },

  -- Spell
  SpellBad = { sp = colors.bright_red, style = "undercurl" },
  SpellCap = { sp = colors.bright_yellow, style = "undercurl" },
  SpellLocal = { sp = colors.bright_blue, style = "undercurl" },
  SpellRare = { sp = colors.bright_magenta, style = "undercurl" },

  -- Syntax
  Comment = { fg = colors.comment, style = "italic" },
  Constant = { fg = colors.blue },
  String = { fg = colors.green },
  Character = { fg = colors.green },
  Number = { fg = colors.blue },
  Boolean = { fg = colors.blue },
  Float = { fg = colors.blue },

  Identifier = { fg = colors.dark_gray },
  Function = { fg = colors.darker_gray },

  Statement = { fg = colors.darker_gray, style = "bold" },
  Conditional = { fg = colors.darker_gray, style = "bold" },
  Repeat = { fg = colors.darker_gray, style = "bold" },
  Label = { fg = colors.bright_blue },
  Operator = { fg = colors.darker_gray },
  Keyword = { fg = colors.darker_gray, style = "bold" },
  Exception = { fg = colors.magenta, style = "bold" },

  PreProc = { fg = colors.magenta },
  Include = { fg = colors.magenta },
  Define = { fg = colors.magenta },
  Macro = { fg = colors.magenta },
  PreCondit = { fg = colors.magenta },

  Type = { fg = colors.cyan },
  StorageClass = { fg = colors.cyan },
  Structure = { fg = colors.cyan },
  Typedef = { fg = colors.cyan },

  Special = { fg = colors.yellow },
  SpecialChar = { fg = colors.yellow },
  Tag = { fg = colors.yellow },
  Delimiter = { fg = colors.dark_gray },
  SpecialComment = { fg = colors.comment, style = "italic" },
  Debug = { fg = colors.bright_red },

  Underlined = { fg = colors.bright_blue, style = "underline" },
  Ignore = { fg = colors.mid_gray },
  Error = { fg = colors.bright_red },
  Todo = { fg = colors.bright_yellow, style = "bold" },

  -- Diagnostics
  DiagnosticError = { fg = colors.bright_red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.bright_blue },
  DiagnosticHint = { fg = colors.bright_cyan },
  DiagnosticSignError = { fg = colors.bright_red, bg = colors.white },
  DiagnosticSignWarn = { fg = colors.yellow, bg = colors.white },
  DiagnosticSignInfo = { fg = colors.bright_blue, bg = colors.white },
  DiagnosticSignHint = { fg = colors.bright_cyan, bg = colors.white },
  DiagnosticUnderlineError = { sp = colors.bright_red, style = "undercurl" },
  DiagnosticUnderlineWarn = { sp = colors.yellow, style = "undercurl" },
  DiagnosticUnderlineInfo = { sp = colors.bright_blue, style = "undercurl" },
  DiagnosticUnderlineHint = { sp = colors.bright_cyan, style = "undercurl" },
  DiagnosticFloatingError = { fg = colors.bright_red, bg = colors.bg_popup },
  DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.bg_popup },
  DiagnosticFloatingInfo = { fg = colors.bright_blue, bg = colors.bg_popup },
  DiagnosticFloatingHint = { fg = colors.bright_cyan, bg = colors.bg_popup },
  DiagnosticVirtualTextError = { fg = colors.bright_red },
  DiagnosticVirtualTextWarn = { fg = colors.yellow },
  DiagnosticVirtualTextInfo = { fg = colors.bright_blue },
  DiagnosticVirtualTextHint = { fg = colors.bright_cyan },

  -- WhichKey
  WhichKey = { fg = colors.blue },
  WhichKeyGroup = { fg = colors.cyan },
  WhichKeyDesc = { fg = colors.magenta },
  WhichKeySeperator = { fg = colors.comment },
  WhichKeySeparator = { fg = colors.comment },
  WhichKeyFloat = { bg = colors.bg_popup },
  WhichKeyValue = { fg = colors.mid_gray },
}

-- Treesitter highlights
local treesitter_highlights = {
  ["@attribute"] = { link = "PreProc" },
  ["@boolean"] = { link = "Boolean" },
  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },
  ["@comment"] = { link = "Comment" },
  ["@conditional"] = { link = "Conditional" },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = colors.blue, style = "italic" },
  ["@constant.macro"] = { link = "Define" },
  ["@constructor"] = { fg = colors.darker_gray },
  ["@error"] = { link = "Error" },
  ["@exception"] = { link = "Exception" },
  ["@field"] = { fg = colors.dark_gray },
  ["@float"] = { link = "Float" },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { fg = colors.darker_gray, style = "italic" },
  ["@function.call"] = { link = "Function" },
  ["@function.macro"] = { link = "Macro" },
  ["@include"] = { link = "Include" },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.function"] = { fg = colors.darker_gray, style = "bold" },
  ["@keyword.operator"] = { fg = colors.darker_gray },
  ["@keyword.return"] = { fg = colors.darker_gray, style = "bold" },
  ["@label"] = { link = "Label" },
  ["@method"] = { link = "Function" },
  ["@method.call"] = { link = "Function" },
  ["@namespace"] = { fg = colors.cyan },
  ["@number"] = { link = "Number" },
  ["@operator"] = { link = "Operator" },
  ["@parameter"] = { fg = colors.dark_gray },
  ["@parameter.reference"] = { fg = colors.dark_gray },
  ["@property"] = { fg = colors.dark_gray },
  ["@punctuation.bracket"] = { fg = colors.dark_gray },
  ["@punctuation.delimiter"] = { fg = colors.dark_gray },
  ["@punctuation.special"] = { fg = colors.dark_gray },
  ["@repeat"] = { link = "Repeat" },
  ["@string"] = { link = "String" },
  ["@string.escape"] = { fg = colors.yellow },
  ["@string.regex"] = { fg = colors.bright_yellow },
  ["@string.special"] = { link = "SpecialChar" },
  ["@structure"] = { link = "Structure" },
  ["@tag"] = { link = "Tag" },
  ["@tag.attribute"] = { fg = colors.cyan },
  ["@tag.delimiter"] = { fg = colors.dark_gray },
  ["@text"] = { fg = colors.dark_gray },
  ["@text.danger"] = { fg = colors.bright_red, style = "bold" },
  ["@text.emphasis"] = { style = "italic" },
  ["@text.environment"] = { link = "Macro" },
  ["@text.environment.name"] = { link = "Type" },
  ["@text.literal"] = { link = "String" },
  ["@text.math"] = { link = "Special" },
  ["@text.note"] = { fg = colors.bright_cyan, style = "bold" },
  ["@text.reference"] = { link = "Constant" },
  ["@text.strike"] = { style = "strikethrough" },
  ["@text.strong"] = { style = "bold" },
  ["@text.title"] = { link = "Title" },
  ["@text.underline"] = { style = "underline" },
  ["@text.uri"] = { fg = colors.bright_blue, style = "underline" },
  ["@text.warning"] = { fg = colors.yellow, style = "bold" },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = colors.cyan, style = "italic" },
  ["@type.definition"] = { link = "Typedef" },
  ["@type.qualifier"] = { link = "Type" },
  ["@variable"] = { fg = colors.dark_gray },
  ["@variable.builtin"] = { fg = colors.dark_gray, style = "italic" },
}

-- LSP semantic token highlights
local semantic_tokens = {
  ["@lsp.type.class"] = { link = "Structure" },
  ["@lsp.type.decorator"] = { link = "Function" },
  ["@lsp.type.enum"] = { link = "Type" },
  ["@lsp.type.enumMember"] = { link = "Constant" },
  ["@lsp.type.function"] = { link = "@function" },
  ["@lsp.type.interface"] = { link = "Structure" },
  ["@lsp.type.macro"] = { link = "Macro" },
  ["@lsp.type.method"] = { link = "@method" },
  ["@lsp.type.namespace"] = { link = "@namespace" },
  ["@lsp.type.parameter"] = { link = "@parameter" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.struct"] = { link = "Structure" },
  ["@lsp.type.type"] = { link = "@type" },
  ["@lsp.type.typeParameter"] = { link = "TypeDef" },
  ["@lsp.type.variable"] = { link = "@variable" },
}

-- Git highlights
local git_highlights = {
  GitSignsAdd = { fg = colors.green, bg = colors.white },
  GitSignsChange = { fg = colors.yellow, bg = colors.white },
  GitSignsDelete = { fg = colors.red, bg = colors.white },

  -- Gitsigns
  GitSignsAddNr = { fg = colors.green },
  GitSignsChangeNr = { fg = colors.yellow },
  GitSignsDeleteNr = { fg = colors.red },
  GitSignsAddLn = { bg = "#DFF0D8" },
  GitSignsChangeLn = { bg = "#FCF8E3" },
  GitSignsDeleteLn = { bg = "#F2DEDE" },

  -- Git diff
  diffAdded = { fg = colors.green },
  diffRemoved = { fg = colors.red },
  diffChanged = { fg = colors.yellow },
  diffOldFile = { fg = colors.red },
  diffNewFile = { fg = colors.green },
  diffFile = { fg = colors.blue },
  diffLine = { fg = colors.comment },
  diffIndexLine = { fg = colors.magenta },
}

-- Telescope highlights
local telescope_highlights = {
  TelescopeBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  TelescopePromptBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  TelescopeResultsBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  TelescopePreviewBorder = { fg = colors.light_gray, bg = colors.bg_popup },

  TelescopePromptPrefix = { fg = colors.bright_blue, bg = colors.bg_popup },
  TelescopePromptNormal = { fg = colors.dark_gray, bg = colors.bg_popup },
  TelescopeResultsNormal = { fg = colors.dark_gray, bg = colors.bg_popup },
  TelescopePreviewNormal = { fg = colors.dark_gray, bg = colors.bg_popup },
  TelescopePromptTitle = { fg = colors.white, bg = colors.bright_blue },
  TelescopeResultsTitle = { fg = colors.white, bg = colors.bright_blue },
  TelescopePreviewTitle = { fg = colors.white, bg = colors.bright_blue },

  TelescopeSelection = { fg = colors.darker_gray, bg = colors.bg_selection },
  TelescopeSelectionCaret = { fg = colors.bright_blue, bg = colors.bg_selection },
  TelescopeMultiSelection = { fg = colors.darker_gray, bg = colors.bg_selection },

  TelescopeMatching = { fg = colors.bright_blue, style = "bold" },
}

-- NvimTree highlights
local nvim_tree_highlights = {
  NvimTreeNormal = { fg = colors.dark_gray, bg = colors.white },
  NvimTreeEndOfBuffer = { fg = colors.white, bg = colors.white },
  NvimTreeRootFolder = { fg = colors.darker_gray, style = "bold" },
  NvimTreeGitDirty = { fg = colors.yellow },
  NvimTreeGitNew = { fg = colors.green },
  NvimTreeGitDeleted = { fg = colors.red },
  NvimTreeSpecialFile = { fg = colors.magenta, style = "underline" },
  NvimTreeIndentMarker = { fg = colors.light_gray },
  NvimTreeImageFile = { fg = colors.bright_magenta },
  NvimTreeSymlink = { fg = colors.bright_cyan },
  NvimTreeFolderName = { fg = colors.blue },
  NvimTreeOpenedFolderName = { fg = colors.bright_blue, style = "italic" },
  NvimTreeEmptyFolderName = { fg = colors.mid_gray },
  NvimTreeFolderIcon = { fg = colors.blue },
  NvimTreeFileIcon = { fg = colors.mid_gray },
}

-- Lazy.nvim highlights
local lazy_highlights = {
  LazyH1 = { fg = colors.white, bg = colors.bright_blue, style = "bold" },
  LazyButton = { fg = colors.dark_gray, bg = colors.light_gray },
  LazyButtonActive = { fg = colors.white, bg = colors.blue, style = "bold" },
  LazyCommit = { fg = colors.green },
  LazyCommitType = { fg = colors.blue },
  LazyCommitIssue = { fg = colors.bright_magenta },
  LazyNoCond = { fg = colors.mid_gray },
  LazyProgressDone = { fg = colors.green },
  LazyProgressTodo = { fg = colors.light_gray },
  LazyProp = { fg = colors.blue },
  LazyReasonCmd = { fg = colors.bright_cyan },
  LazyReasonEvent = { fg = colors.bright_yellow },
  LazyReasonFt = { fg = colors.bright_green },
  LazyReasonImport = { fg = colors.bright_blue },
  LazyReasonKeys = { fg = colors.bright_magenta },
  LazyReasonPlugin = { fg = colors.bright_cyan },
  LazyReasonRuntime = { fg = colors.bright_red },
  LazyReasonSource = { fg = colors.bright_green },
  LazyReasonStart = { fg = colors.bright_blue },
  LazySpecial = { fg = colors.bright_blue },
  LazyTaskOutput = { fg = colors.dark_gray },
  LazyUrl = { fg = colors.bright_blue, style = "underline" },
  LazyValue = { fg = colors.cyan },
}

-- Lualine highlights
local lualine_highlights = {
  lualine_a_normal = { fg = colors.white, bg = colors.blue, style = "bold" },
  lualine_b_normal = { fg = colors.dark_gray, bg = colors.light_gray },
  lualine_c_normal = { fg = colors.dark_gray, bg = colors.white },

  lualine_a_insert = { fg = colors.white, bg = colors.green, style = "bold" },
  lualine_b_insert = { fg = colors.dark_gray, bg = colors.light_gray },
  lualine_c_insert = { fg = colors.dark_gray, bg = colors.white },

  lualine_a_visual = { fg = colors.white, bg = colors.purple, style = "bold" },
  lualine_b_visual = { fg = colors.dark_gray, bg = colors.light_gray },
  lualine_c_visual = { fg = colors.dark_gray, bg = colors.white },

  lualine_a_replace = { fg = colors.white, bg = colors.red, style = "bold" },
  lualine_b_replace = { fg = colors.dark_gray, bg = colors.light_gray },
  lualine_c_replace = { fg = colors.dark_gray, bg = colors.white },

  lualine_a_command = { fg = colors.white, bg = colors.yellow, style = "bold" },
  lualine_b_command = { fg = colors.dark_gray, bg = colors.light_gray },
  lualine_c_command = { fg = colors.dark_gray, bg = colors.white },

  lualine_a_inactive = { fg = colors.mid_gray, bg = colors.white, style = "bold" },
  lualine_b_inactive = { fg = colors.mid_gray, bg = colors.white },
  lualine_c_inactive = { fg = colors.mid_gray, bg = colors.white },
}

-- CMP highlights
local cmp_highlights = {
  CmpItemAbbr = { fg = colors.dark_gray },
  CmpItemAbbrDeprecated = { fg = colors.mid_gray, style = "strikethrough" },
  CmpItemAbbrMatch = { fg = colors.bright_blue, style = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = colors.bright_blue, style = "bold" },
  CmpItemKind = { fg = colors.blue },
  CmpItemMenu = { fg = colors.comment },

  -- Item kinds
  CmpItemKindClass = { fg = colors.bright_yellow },
  CmpItemKindColor = { fg = colors.bright_magenta },
  CmpItemKindConstant = { fg = colors.bright_blue },
  CmpItemKindConstructor = { fg = colors.bright_blue },
  CmpItemKindEnum = { fg = colors.bright_yellow },
  CmpItemKindEnumMember = { fg = colors.bright_cyan },
  CmpItemKindEvent = { fg = colors.bright_yellow },
  CmpItemKindField = { fg = colors.bright_cyan },
  CmpItemKindFile = { fg = colors.mid_gray },
  CmpItemKindFolder = { fg = colors.mid_gray },
  CmpItemKindFunction = { fg = colors.bright_blue },
  CmpItemKindInterface = { fg = colors.bright_yellow },
  CmpItemKindKeyword = { fg = colors.bright_red },
  CmpItemKindMethod = { fg = colors.bright_blue },
  CmpItemKindModule = { fg = colors.bright_yellow },
  CmpItemKindOperator = { fg = colors.bright_cyan },
  CmpItemKindProperty = { fg = colors.bright_cyan },
  CmpItemKindReference = { fg = colors.bright_magenta },
  CmpItemKindSnippet = { fg = colors.mid_gray },
  CmpItemKindStruct = { fg = colors.bright_yellow },
  CmpItemKindText = { fg = colors.green },
  CmpItemKindTypeParameter = { fg = colors.bright_cyan },
  CmpItemKindUnit = { fg = colors.bright_yellow },
  CmpItemKindValue = { fg = colors.bright_magenta },
  CmpItemKindVariable = { fg = colors.bright_magenta },
}

-- Bufferline highlights
local bufferline_highlights = {
  BufferLineFill = { bg = colors.white },
  BufferLineBackground = { fg = colors.mid_gray, bg = colors.bg_popup },
  BufferLineBuffer = { fg = colors.dark_gray, bg = colors.bg_popup },
  BufferLineBufferSelected = { fg = colors.darker_gray, bg = colors.white, style = "bold" },
  BufferLineBufferVisible = { fg = colors.dark_gray, bg = colors.bg_popup },

  BufferLineTab = { fg = colors.mid_gray, bg = colors.bg_popup },
  BufferLineTabSelected = { fg = colors.darker_gray, bg = colors.white, style = "bold" },
  BufferLineTabClose = { fg = colors.red, bg = colors.bg_popup },

  BufferLineIndicator = { fg = colors.mid_gray, bg = colors.bg_popup },
  BufferLineIndicatorSelected = { fg = colors.blue, bg = colors.white },
  BufferLineIndicatorVisible = { fg = colors.mid_gray, bg = colors.bg_popup },

  BufferLineSeparator = { fg = colors.light_gray, bg = colors.bg_popup },
  BufferLineSeparatorSelected = { fg = colors.light_gray, bg = colors.white },
  BufferLineSeparatorVisible = { fg = colors.light_gray, bg = colors.bg_popup },

  BufferLineModified = { fg = colors.yellow, bg = colors.bg_popup },
  BufferLineModifiedSelected = { fg = colors.yellow, bg = colors.white },
  BufferLineModifiedVisible = { fg = colors.yellow, bg = colors.bg_popup },

  BufferLineError = { fg = colors.red, bg = colors.bg_popup },
  BufferLineErrorSelected = { fg = colors.red, bg = colors.white },
  BufferLineErrorVisible = { fg = colors.red, bg = colors.bg_popup },

  BufferLineWarning = { fg = colors.yellow, bg = colors.bg_popup },
  BufferLineWarningSelected = { fg = colors.yellow, bg = colors.white },
  BufferLineWarningVisible = { fg = colors.yellow, bg = colors.bg_popup },

  BufferLineInfo = { fg = colors.blue, bg = colors.bg_popup },
  BufferLineInfoSelected = { fg = colors.blue, bg = colors.white },
  BufferLineInfoVisible = { fg = colors.blue, bg = colors.bg_popup },

  BufferLineHint = { fg = colors.cyan, bg = colors.bg_popup },
  BufferLineHintSelected = { fg = colors.cyan, bg = colors.white },
  BufferLineHintVisible = { fg = colors.cyan, bg = colors.bg_popup },
}

-- Indent-blankline highlights
local indent_blankline_highlights = {
  IblIndent = { fg = colors.light_gray },
  IblScope = { fg = colors.mid_gray },
  IblWhitespace = { fg = colors.light_gray },
}

-- LSP Saga highlights
local lspsaga_highlights = {
  SagaNormal = { link = "NormalFloat" },
  SagaBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  SagaTitle = { fg = colors.blue, style = "bold" },
  SagaHeader = { fg = colors.darker_gray, style = "bold" },
  SagaFooter = { fg = colors.mid_gray },

  LspSagaCodeActionTitle = { fg = colors.blue, style = "bold" },
  LspSagaCodeActionContent = { fg = colors.dark_gray },
  LspSagaCodeActionBorder = { fg = colors.light_gray, bg = colors.bg_popup },

  LspSagaDefPreviewTitle = { fg = colors.blue, style = "bold" },
  LspSagaDefPreviewBorder = { fg = colors.light_gray, bg = colors.bg_popup },

  LspSagaRenameBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  LspSagaRenameMatch = { fg = colors.bright_blue },

  LspSagaDiagnosticHeader = { fg = colors.darker_gray, style = "bold" },
  LspSagaDiagnosticBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  LspSagaDiagnosticTruncateLine = { fg = colors.light_gray },

  LspSagaLspFinderBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  LspSagaAutoPreview = { fg = colors.mid_gray },
  LspSagaFinderSelection = { fg = colors.bright_blue },

  LspSagaHoverBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  LspSagaHoverTruncateLine = { fg = colors.light_gray },

  LspSagaSignatureHelpBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  LspSagaShTruncateLine = { fg = colors.light_gray },
}

-- Mason highlights
local mason_highlights = {
  MasonNormal = { fg = colors.dark_gray, bg = colors.white },
  MasonHeader = { fg = colors.white, bg = colors.blue, style = "bold" },
  MasonHeaderSecondary = { fg = colors.white, bg = colors.cyan, style = "bold" },

  MasonHighlight = { fg = colors.bright_blue },
  MasonHighlightBlock = { fg = colors.white, bg = colors.bright_blue },
  MasonHighlightBlockBold = { fg = colors.white, bg = colors.bright_blue, style = "bold" },

  MasonMuted = { fg = colors.mid_gray },
  MasonMutedBlock = { fg = colors.white, bg = colors.mid_gray },
  MasonMutedBlockBold = { fg = colors.white, bg = colors.mid_gray, style = "bold" },

  MasonError = { fg = colors.bright_red },
  MasonHeading = { fg = colors.darker_gray, style = "bold" },
  MasonLink = { fg = colors.bright_blue, style = "underline" },
}

-- Dashboard highlights
local dashboard_highlights = {
  DashboardHeader = { fg = colors.blue },
  DashboardCenter = { fg = colors.dark_gray },
  DashboardShortcut = { fg = colors.cyan },
  DashboardFooter = { fg = colors.mid_gray, style = "italic" },
}

-- Notify highlights
local notify_highlights = {
  NotifyERRORBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  NotifyWARNBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  NotifyINFOBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  NotifyDEBUGBorder = { fg = colors.light_gray, bg = colors.bg_popup },
  NotifyTRACEBorder = { fg = colors.light_gray, bg = colors.bg_popup },

  NotifyERRORIcon = { fg = colors.bright_red },
  NotifyWARNIcon = { fg = colors.bright_yellow },
  NotifyINFOIcon = { fg = colors.bright_blue },
  NotifyDEBUGIcon = { fg = colors.mid_gray },
  NotifyTRACEIcon = { fg = colors.bright_magenta },

  NotifyERRORTitle = { fg = colors.bright_red, style = "bold" },
  NotifyWARNTitle = { fg = colors.bright_yellow, style = "bold" },
  NotifyINFOTitle = { fg = colors.bright_blue, style = "bold" },
  NotifyDEBUGTitle = { fg = colors.mid_gray, style = "bold" },
  NotifyTRACETitle = { fg = colors.bright_magenta, style = "bold" },

  NotifyERRORBody = { fg = colors.dark_gray, bg = colors.bg_popup },
  NotifyWARNBody = { fg = colors.dark_gray, bg = colors.bg_popup },
  NotifyINFOBody = { fg = colors.dark_gray, bg = colors.bg_popup },
  NotifyDEBUGBody = { fg = colors.dark_gray, bg = colors.bg_popup },
  NotifyTRACEBody = { fg = colors.dark_gray, bg = colors.bg_popup },
}

-- Alpha dashboard highlights
local alpha_highlights = {
  AlphaHeader = { fg = colors.blue },
  AlphaButtons = { fg = colors.dark_gray },
  AlphaFooter = { fg = colors.mid_gray, style = "italic" },
  AlphaShortcut = { fg = colors.cyan },
}

-- Neogit highlights
local neogit_highlights = {
  NeogitBranch = { fg = colors.bright_blue },
  NeogitRemote = { fg = colors.bright_magenta },

  NeogitHunkHeader = { fg = colors.dark_gray, bg = colors.light_gray },
  NeogitHunkHeaderHighlight = { fg = colors.darker_gray, bg = colors.mid_gray },

  NeogitDiffAdd = { fg = colors.green },
  NeogitDiffDelete = { fg = colors.red },
  NeogitDiffContext = { fg = colors.dark_gray },

  NeogitDiffAddHighlight = { fg = colors.bright_green, bg = "#DFF0D8" },
  NeogitDiffDeleteHighlight = { fg = colors.bright_red, bg = "#F2DEDE" },
  NeogitDiffContextHighlight = { fg = colors.dark_gray, bg = colors.light_gray },

  NeogitNotificationInfo = { fg = colors.bright_blue },
  NeogitNotificationWarning = { fg = colors.bright_yellow },
  NeogitNotificationError = { fg = colors.bright_red },
}

-- Merge all highlight groups
local all_highlights = vim.tbl_extend(
  "force",
  base_highlights,
  treesitter_highlights,
  semantic_tokens,
  git_highlights,
  telescope_highlights,
  nvim_tree_highlights,
  lazy_highlights,
  lualine_highlights,
  cmp_highlights,
  bufferline_highlights,
  indent_blankline_highlights,
  lspsaga_highlights,
  mason_highlights,
  dashboard_highlights,
  notify_highlights,
  alpha_highlights,
  neogit_highlights
)

-- Apply all highlights
for group, style in pairs(all_highlights) do
  highlight(group, style)
end

-- Terminal colors
vim.g.terminal_color_0 = colors.darker_gray
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.light_gray
vim.g.terminal_color_8 = colors.mid_gray
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.white

-- Return the color palette for external use
return {
  colors = colors,
  highlights = all_highlights,
}
