-- Void theme: black background, grey UI, green accent
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "void"

local colors = {
  bg = "#000000",
  bg_alt = "#1a1a1a",
  bg_highlight = "#2a2a2a",
  fg = "#e0e0e0",
  fg_dim = "#888888",
  grey = "#555555",
  grey_dark = "#333333",
  green = "#478061",
  green_bright = "#5fa87f",
  red = "#ff4444",
  yellow = "#d4a24c",
  blue = "#5f87a8",
}

local hl = vim.api.nvim_set_hl

-- Editor UI
hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
hl(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
hl(0, "FloatBorder", { fg = colors.green, bg = colors.bg_alt })
hl(0, "Cursor", { fg = colors.bg, bg = colors.green })
hl(0, "CursorLine", { bg = colors.bg_alt })
hl(0, "CursorLineNr", { fg = colors.green_bright, bold = true })
hl(0, "LineNr", { fg = colors.grey })
hl(0, "SignColumn", { bg = colors.bg })
hl(0, "ColorColumn", { bg = colors.bg_alt })
hl(0, "VertSplit", { fg = colors.grey_dark })
hl(0, "WinSeparator", { fg = colors.grey_dark })
hl(0, "StatusLine", { fg = colors.fg, bg = colors.bg_alt })
hl(0, "StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_alt })
hl(0, "Pmenu", { fg = colors.fg, bg = colors.bg_alt })
hl(0, "PmenuSel", { fg = colors.bg, bg = colors.green })
hl(0, "Visual", { bg = colors.grey_dark })
hl(0, "Search", { fg = colors.bg, bg = colors.green_bright })
hl(0, "IncSearch", { fg = colors.bg, bg = colors.green })
hl(0, "MatchParen", { fg = colors.green_bright, bold = true })

-- Syntax
hl(0, "Comment", { fg = colors.fg_dim, italic = true })
hl(0, "Constant", { fg = colors.green_bright })
hl(0, "String", { fg = colors.green })
hl(0, "Identifier", { fg = colors.fg })
hl(0, "Function", { fg = colors.green_bright, bold = true })
hl(0, "Statement", { fg = colors.fg, bold = true })
hl(0, "Keyword", { fg = colors.green_bright })
hl(0, "Type", { fg = colors.blue })
hl(0, "Special", { fg = colors.yellow })
hl(0, "Error", { fg = colors.red, bold = true })
hl(0, "Todo", { fg = colors.bg, bg = colors.yellow, bold = true })

-- Diagnostics
hl(0, "DiagnosticError", { fg = colors.red })
hl(0, "DiagnosticWarn", { fg = colors.yellow })
hl(0, "DiagnosticInfo", { fg = colors.blue })
hl(0, "DiagnosticHint", { fg = colors.green })

-- Git
hl(0, "DiffAdd", { fg = colors.green, bg = colors.bg })
hl(0, "DiffChange", { fg = colors.yellow, bg = colors.bg })
hl(0, "DiffDelete", { fg = colors.red, bg = colors.bg })

-- Telescope / general popups
hl(0, "TelescopeBorder", { fg = colors.green })
hl(0, "TelescopeSelection", { bg = colors.bg_alt })


-- Dashboard (Snacks)
hl(0, "SnacksDashboardTitle", { fg = colors.green_bright, bold = true })
hl(0, "SnacksDashboardHeader", { fg = colors.green })
hl(0, "SnacksDashboardIcon", { fg = colors.green_bright })
hl(0, "SnacksDashboardDesc", { fg = colors.fg })
hl(0, "SnacksDashboardKey", { fg = colors.fg_dim })
hl(0, "SnacksDashboardFooter", { fg = colors.fg_dim, italic = true })

-- Dashboard (Alpha, in case that's the one in use)
hl(0, "AlphaHeader", { fg = colors.green })
hl(0, "AlphaButtons", { fg = colors.fg })
hl(0, "AlphaShortcut", { fg = colors.green_bright, bold = true })
hl(0, "AlphaFooter", { fg = colors.fg_dim, italic = true })
