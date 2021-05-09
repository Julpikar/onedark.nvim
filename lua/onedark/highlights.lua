local c = require('onedark.colors')

local M = {}
local hl = {langs = {}, plugins = {}}

local highlight = vim.api.nvim_set_hl
local set_hl_ns = vim.api.nvim__set_hl_ns or vim.api.nvim_set_hl_ns
local create_namespace = vim.api.nvim_create_namespace

local function load_highlights(ns, highlights)
    for group_name, group_settings in pairs(highlights) do
        highlight(ns, group_name, group_settings)
    end
end

colors = {
    Fg = {fg = c.fg},
    Grey = {fg = c.grey},
    Red = {fg = c.red},
    Cyan = {fg = c.cyan},
    Yellow = {fg = c.yellow},
    Orange = {fg = c.orange},
    Green = {fg = c.green},
    Blue = {fg = c.blue},
    Purple = {fg = c.purple}
}
hl.common = {
    Normal = {fg = c.fg, bg = c.bg0},
    Terminal = {fg = c.fg, bg = c.bg0},
    EndOfBuffer = {fg = c.bg2, bg = c.bg0},
    FoldColumn = {fg = c.fg, bg = c.bg1},
    Folded = {fg = c.fg, bg = c.bg1},
    SignColumn = {fg = c.fg, bg = c.bg0},
    ToolbarLine = {fg = c.fg},
    Cursor = {reverse = true},
    vCursor = {reverse = true},
    iCursor = {reverse = true},
    lCursor = {reverse = true},
    CursorIM = {reverse = true},
    CursorColumn = {bg = c.bg1},
    CursorLine = {bg = c.bg1},
    ColorColumn = {bg = c.bg1},
    CursorLineNr = {fg = c.fg},
    LineNr = {fg = c.grey},
    Conceal = {fg = c.grey, bg = c.bg1},
    DiffAdd = {fg = c.none, bg = c.diff_add},
    DiffChange = {fg = c.none, bg = c.diff_change},
    DiffDelete = {fg = c.none, bg = c.diff_delete},
    DiffText = {fg = c.none, reverse = true},
    Directory = {fg = c.blue},
    ErrorMsg = {fg = c.red, bold = true, underline = true},
    WarningMsg = {fg = c.yellow, bold = true},
    MoreMsg = {fg = c.blue, bold = true},
    IncSearch = {fg = c.bg0, bg = c.orange},
    Search = {fg = c.bg0, bg = c.bg_yellow},
    MatchParen = {fg = c.none, bg = c.grey},
    NonText = {fg = c.grey},
    Whitespace = {fg = c.grey},
    SpecialKey = {fg = c.grey},
    Pmenu = {fg = c.fg, bg = c.bg2},
    PmenuSbar = {fg = c.none, bg = c.bg2},
    PmenuSel = {fg = c.bg0, bg = c.bg_blue},
    WildMenu = {fg = c.bg0, bg = c.blue},
    PmenuThumb = {fg = c.none, bg = c.grey},
    Question = {fg = c.yellow},
    SpellBad = {fg = c.red, underline = true, sp = c.red},
    SpellCap = {fg = c.yellow, underline = true, sp = c.yellow},
    SpellLocal = {fg = c.blue, underline = true, sp = c.blue},
    SpellRare = {fg = c.purple, underline = true, sp = c.purple},
    StatusLine = {fg = c.fg, bg = c.bg2},
    StatusLineTerm = {fg = c.fg, bg = c.bg2},
    StatusLineNC = {fg = c.grey, bg = c.bg1},
    StatusLineTermNC = {fg = c.grey, bg = c.bg1},
    TabLine = {fg = c.fg, bg = c.grey},
    TabLineFill = {fg = c.grey, bg = c.bg1},
    TabLineSel = {fg = c.bg0, bg = c.bg_red},
    VertSplit = {fg = c.bg5},
    Visual = {bg = c.bg1},
    VisualNOS = {fg = c.none, bg = c.bg2, underline = true},
    QuickFixLine = {fg = c.blue, underline = true},
    Debug = {fg = c.yellow},
    debugPC = {fg = c.bg0, bg = c.green},
    debugBreakpoint = {fg = c.bg0, bg = c.red},
    ToolbarButton = {fg = c.bg0, bg = c.bg_blue}
}

hl.syntax = {
    String = colors.Green,
    Character = colors.Green,
    Number = colors.Orange,
    Float = colors.Orange,
    Boolean = colors.Orange,
    Type = colors.Yellow,
    Structure = colors.Yellow,
    StorageClass = colors.Yellow,
    Identifier = colors.Red,
    Constant = colors.Cyan,
    PreProc = colors.Purple,
    PreCondit = colors.Purple,
    Include = colors.Purple,
    Keyword = colors.Purple,
    Define = colors.Purple,
    Typedef = colors.Purple,
    Exception = colors.Purple,
    Conditional = colors.Purple,
    Repeat = colors.Purple,
    Statement = colors.Purple,
    Macro = colors.Red,
    Error = colors.Purple,
    Label = colors.Purple,
    Special = colors.Red,
    SpecialChar = colors.Red,
    Function = colors.Blue,
    Operator = colors.Red,
    Title = colors.Cyan,
    Tag = colors.Green,
    Delimiter = colors.Fg,
    Comment = colors.Grey, 
    SpecialComment = colors.Grey, 
    Todo = colors.Red
}

hl.treesitter = {
  TSAnnotation = colors.Fg,
  TSAttribute = colors.Fg,
  TSBoolean = colors.Orange,
  TSCharacter = colors.Fg,
  TSComment = colors.Grey,
  TSConditional = colors.Purple,
  TSConstant = colors.Orange,
  TSConstBuiltin = colors.Orange,
  TSConstMacro = colors.Orange,
  TSConstructor = colors.Yellow,
  TSError = colors.Fg,
  TSException = colors.Fg,
  TSField = colors.Fg,
  TSFloat = colors.Orange,
  TSFunction = colors.Blue,
  TSFuncBuiltin = colors.Cyan,
  TSFuncMacro = colors.Fg,
  TSInclude = colors.Purple,
  TSKeyword = colors.Purple,
  TSKeywordFunction = colors.Fg,
  TSKeywordOperator = colors.Purple,
  TSLabel = colors.Red,
  TSMethod = colors.Cyan,
  TSNamespace = colors.Fg,
  TSNone = colors.Fg,
  TSNumber = colors.Orange,
  TSOperator = colors.Fg,
  TSParameter = colors.Red,
  TSParameterReference = colors.Fg,
  TSProperty = colors.Fg,
  TSPunctDelimiter = colors.Fg,
  TSPunctBracket = colors.Fg,
  TSPunctSpecial = colors.Fg,
  TSRepeat = colors.Purple,
  TSString = colors.Green,
  TSStringRegex = colors.Orange,
  TSStringEscape = colors.Red,
  TSSymbol = colors.Cyan,
  TSTag = colors.Fg,
  TSTagDelimiter = colors.Fg,
  TSText = colors.Fg,
  TSStrong = colors.Fg,
  TSEmphasis = colors.Fg,
  TSUnderline = colors.Fg,
  TSStrike = colors.Fg,
  TSTitle = colors.Fg,
  TSLiteral = colors.Fg,
  TSURI = colors.Fg,
  TSMath = colors.Fg,
  TSTextReference = colors.Fg,
  TSEnviroment = colors.Fg,
  TSEnviromentName = colors.Fg,
  TSNote = colors.Fg,
  TSWarning = colors.Fg,
  TSDanger = colors.Fg,
  TSType = colors.Yellow,
  TSTypeBuiltin = colors.Fg,
  TSVariable = colors.Fg,
  TSVariableBuiltin = colors.Red
}
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant = colors.Orange,
    LspCxxHlGroupMemberVariable = colors.Orange,
    LspCxxHlGroupNamespace = colors.Blue,
    LspCxxHlSkippedRegion = colors.Grey,
    LspCxxHlSkippedRegionBeginEnd = colors.Red,
    LspDiagnosticsDefaultError = {fg = c.red},
    LspDiagnosticsDefaultHint = {fg = c.purple},
    LspDiagnosticsDefaultInformation = {fg = c.cyan},
    LspDiagnosticsDefaultWarning = {fg = c.yellow},
    LspDiagnosticsUnderlineError = {underline = true, sp = c.red},
    LspDiagnosticsUnderlineHint = {underline = true, sp = c.purple},
    LspDiagnosticsUnderlineInformation = {underline = true, sp = c.blue},
    LspDiagnosticsUnderlineWarning = {underline = true, sp = c.yellow}
}

hl.plugins.whichkey = {
    WhichKey = colors.Red,
    WhichKeyDesc = colors.Blue,
    WhichKeyGroup = colors.Orange,
    WhichKeySeperator = colors.Green
}

hl.plugins.gitgutter = {
    GitGutterAdd = {fg = c.diff_green},
    GitGutterChange = {fg = c.diff_blue},
    GitGutterDelete = {fg = c.diff_red}
}

hl.plugins.diffview = {
    DiffviewFilePanelTitle = {fg = c.blue, bold = true},
    DiffviewFilePanelCounter = {fg = c.purple, bold = true},
    DiffviewFilePanelFileName = colors.Fg,
    DiffviewNormal = hl.common.Normal,
    DiffviewCursorLine = hl.common.CursorLine,
    DiffviewVertSplit = hl.common.VertSplit,
    DiffviewSignColumn = hl.common.SignColumn,
    DiffviewStatusLine = hl.common.StatusLine,
    DiffviewStatusLineNC = hl.common.StatusLineNC,
    DiffviewEndOfBuffer = hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath = colors.Grey,
    DiffviewFilePanelPath = colors.Grey,
    DiffviewFilePanelInsertions = colors.Green,
    DiffviewFilePanelDeletions = colors.Red,
    DiffviewStatusAdded = colors.Green,
    DiffviewStatusUntracked = colors.Blue,
    DiffviewStatusModified = colors.Blue,
    DiffviewStatusRenamed = colors.Blue,
    DiffviewStatusCopied = colors.Blue,
    DiffviewStatusTypeChange = colors.Blue,
    DiffviewStatusUnmerged = colors.Blue,
    DiffviewStatusUnknown = colors.Red,
    DiffviewStatusDeleted = colors.Red,
    DiffviewStatusBroken = colors.Red
}

hl.plugins.gitsigns = {
    GitSignsAdd = colors.Green,
    GitSignsAddLn = colors.Green,
    GitSignsAddNr = colors.Green,
    GitSignsChange = colors.Blue,
    GitSignsChangeLn = colors.Blue,
    GitSignsChangeNr = colors.Blue,
    GitSignsDelete = colors.Red,
    GitSignsDeleteLn = colors.Red,
    GitSignsDeleteNr = colors.Red
}

hl.langs.markdown = {
    markdownBlockquote = colors.Grey,
    markdownBold = {fg = c.none, bold = true},
    markdownBoldDelimiter = colors.Grey,
    markdownCode = colors.Yellow,
    markdownCodeBlock = colors.Yellow,
    markdownCodeDelimiter = colors.Green,
    markdownH1 = {fg = c.red, bold = true},
    markdownH2 = {fg = c.red, bold = true},
    markdownH3 = {fg = c.red, bold = true},
    markdownH4 = {fg = c.red, bold = true},
    markdownH5 = {fg = c.red, bold = true},
    markdownH6 = {fg = c.red, bold = true},
    markdownHeadingDelimiter = colors.Grey,
    markdownHeadingRule = colors.Grey,
    markdownId = colors.Yellow,
    markdownIdDeclaration = colors.Red,
    markdownItalic = {fg = c.none, italic = true},
    markdownItalicDelimiter = {fg = c.grey, italic = true},
    markdownLinkDelimiter = colors.Grey,
    markdownLinkText = colors.Red,
    markdownLinkTextDelimiter = colors.Grey,
    markdownListMarker = colors.Red,
    markdownOrderedListMarker = colors.Red,
    markdownRule = colors.Purple,
    markdownUrl = {fg = c.blue, underline = true},
    markdownUrlDelimiter = colors.Grey,
    markdownUrlTitleDelimiter = colors.Green
}

hl.langs.scala = {
    scalaNameDefinition = colors.Fg,
    scalaInterpolationBoundary = colors.Purple,
    scalaInterpolation = colors.Purple,
    scalaTypeOperator = colors.Red,
    scalaOperator = colors.Red,
    scalaKeywordModifier = colors.Red
}

function M.setup()
    local ns = create_namespace("onedark")
    load_highlights(ns, hl.common)
    load_highlights(ns, hl.syntax)
    load_highlights(ns, hl.treesitter)
    for _, group in pairs(hl.langs) do load_highlights(ns, group) end
    for _, group in pairs(hl.plugins) do load_highlights(ns, group) end
    set_hl_ns(ns)
end

return M
