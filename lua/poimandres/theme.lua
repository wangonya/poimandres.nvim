local blend = require('poimandres.utils').blend

local M = {}

function M.get(config)
	local p = require('poimandres.palette')

	local theme = {}
	local groups = config.groups or {}
	local styles = {
		italic = (config.disable_italics and p.none) or 'italic',
		vert_split = (config.bold_vert_split and groups.border) or p.none,
		background = (config.disable_background and p.none)
			or groups.background,
		float_background = (config.disable_float_background and p.none)
			or groups.panel,
	}
	styles.nc_background = (config.dim_nc_background and groups.panel)
		or styles.background

	theme = {
		ColorColumn = { bg = p.gray },
		Conceal = { bg = p.none },
		CurSearch = { link = 'IncSearch' },
		-- Cursor = {},
		CursorColumn = { bg = p.background2 },
		-- CursorIM = {},
		CursorLine = { bg = p.background1 },
		CursorLineNr = { fg = p.text },
		DarkenedPanel = { bg = groups.panel },
		DarkenedStatusline = { bg = groups.panel },
		DiffAdd = { bg = blend(groups.git_add, groups.background, 0.5) },
		DiffChange = { bg = p.gray },
		DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.5) },
		DiffText = { bg = blend(groups.git_text, groups.background, 0.5) },
		diffAdded = { link = 'DiffAdd' },
		diffChanged = { link = 'DiffChange' },
		diffRemoved = { link = 'DiffDelete' },
		Directory = { fg = p.teal1, bg = p.none },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = p.pink3, style = 'bold' },
		FloatBorder = { fg = groups.border },
		FloatTitle = { fg = p.blueGray1 },
		FoldColumn = { fg = p.blueGray1 },
		Folded = { fg = p.text, bg = groups.panel },
		IncSearch = { fg = p.background3, bg = p.pink2 },
		LineNr = { fg = p.blueGray2 },
		MatchParen = { fg = p.text, bg = p.blueGray2 },
		ModeMsg = { fg = p.blueGray1 },
		MoreMsg = { fg = p.pink2 },
		NonText = { fg = p.blueGray2 },
		Normal = { fg = p.text, bg = styles.background },
		NormalFloat = { fg = p.text, bg = styles.float_background },
		NormalNC = { fg = p.text, bg = styles.nc_background },
		NvimInternalError = { fg = '#ffffff', bg = p.pink3 },
		Pmenu = { fg = p.blueGray1, bg = styles.float_background },
		PmenuSbar = { bg = p.blueGray2 },
		PmenuSel = { fg = p.text, bg = p.background1 },
		PmenuThumb = { bg = p.blueGray2 },
		Question = { fg = p.yellow },
		-- QuickFixLine = {},
		-- RedrawDebugNormal = {}
		RedrawDebugClear = { fg = '#ffffff', bg = p.yellow },
		RedrawDebugComposed = { fg = '#ffffff', bg = p.teal2 },
		RedrawDebugRecompose = { fg = '#ffffff', bg = p.pink3 },
		Search = { bg = p.blueGray2 },
		SpecialKey = { fg = p.teal1 },
		SpellBad = { sp = p.pink3, style = 'undercurl' },
		SpellCap = { sp = p.blueGray1, style = 'undercurl' },
		SpellLocal = { sp = p.blueGray1, style = 'undercurl' },
		SpellRare = { sp = p.blueGray1, style = 'undercurl' },
		SignColumn = { fg = p.text, bg = styles.background },
		StatusLine = { fg = p.blueGray1, bg = styles.float_background },
		StatusLineNC = { fg = p.blueGray2, bg = styles.background },
		StatusLineTerm = { link = 'StatusLine' },
		StatusLineTermNC = { link = 'StatusLineNC' },
		TabLine = { fg = p.blueGray1, bg = styles.float_background },
		TabLineFill = { bg = styles.float_background },
		TabLineSel = { fg = p.text, bg = p.background1 },
		Title = { fg = p.text },
		VertSplit = { fg = groups.border, bg = styles.vert_split },
		Visual = { bg = p.blueGray2 },
		-- VisualNOS = {},
		WarningMsg = { fg = p.yellow },
		-- Whitespace = {},
		WildMenu = { link = 'IncSearch' },

		Boolean = { fg = p.pink2 },
		Character = { fg = p.yellow },
		Comment = { fg = groups.comment, style = styles.italic },
		Conditional = { fg = p.teal2 },
		Constant = { fg = p.yellow },
		Debug = { fg = p.pink2 },
		Define = { fg = p.pink2 },
		Delimiter = { fg = p.blueGray1 },
		Error = { fg = p.pink3 },
		Exception = { fg = p.teal2 },
		Float = { fg = p.yellow },
		Function = { fg = p.pink2 },
		Identifier = { fg = p.pink2 },
		-- Ignore = {},
		Include = { fg = p.pink2 },
		Keyword = { fg = p.teal2 },
		Label = { fg = p.teal1 },
		Macro = { fg = p.pink2 },
		Number = { fg = p.yellow },
		Operator = { fg = p.blueGray1 },
		PreCondit = { fg = p.pink2 },
		PreProc = { fg = p.pink2 },
		Repeat = { fg = p.teal2 },
		Special = { fg = p.pink2 },
		SpecialChar = { fg = p.pink2 },
		SpecialComment = { fg = p.pink2 },
		Statement = { fg = p.teal2 },
		StorageClass = { fg = p.teal1 },
		String = { fg = p.yellow },
		Structure = { fg = p.teal1 },
		Tag = { fg = p.pink2 },
		Todo = { fg = p.pink2 },
		Type = { fg = p.teal1 },
		Typedef = { fg = p.teal1 },
		Underlined = { style = 'underline' },

		htmlArg = { fg = p.pink2 },
		htmlBold = { style = 'bold' },
		htmlEndTag = { fg = p.blueGray1 },
		htmlH1 = { fg = groups.headings.h1, style = 'bold' },
		htmlH2 = { fg = groups.headings.h2, style = 'bold' },
		htmlH3 = { fg = groups.headings.h3, style = 'bold' },
		htmlH4 = { fg = groups.headings.h4, style = 'bold' },
		htmlH5 = { fg = groups.headings.h5, style = 'bold' },
		htmlItalic = { style = styles.italic },
		htmlLink = { fg = groups.link },
		htmlTag = { fg = p.blueGray1 },
		htmlTagN = { fg = p.text },
		htmlTagName = { fg = p.teal1 },

		markdownDelimiter = { fg = p.blueGray1 },
		markdownH1 = { fg = groups.headings.h1, style = 'bold' },
		markdownH1Delimiter = { link = 'markdownH1' },
		markdownH2 = { fg = groups.headings.h2, style = 'bold' },
		markdownH2Delimiter = { link = 'markdownH2' },
		markdownH3 = { fg = groups.headings.h3, style = 'bold' },
		markdownH3Delimiter = { link = 'markdownH3' },
		markdownH4 = { fg = groups.headings.h4, style = 'bold' },
		markdownH4Delimiter = { link = 'markdownH4' },
		markdownH5 = { fg = groups.headings.h5, style = 'bold' },
		markdownH5Delimiter = { link = 'markdownH5' },
		markdownH6 = { fg = groups.headings.h6, style = 'bold' },
		markdownH6Delimiter = { link = 'markdownH6' },
		markdownLinkText = { fg = groups.link, style = 'underline' },
		markdownUrl = { link = 'markdownLinkText' },

		mkdCode = { fg = p.teal1, style = styles.italic },
		mkdCodeDelimiter = { fg = p.pink2 },
		mkdCodeEnd = { fg = p.teal1 },
		mkdCodeStart = { fg = p.teal1 },
		mkdFootnotes = { fg = p.teal1 },
		mkdID = { fg = p.teal1, style = 'underline' },
		mkdInlineURL = { fg = groups.link, style = 'underline' },
		mkdLink = { link = 'mkdInlineURL' },
		mkdLinkDef = { link = 'mkdInlineURL' },
		mkdListItemLine = { fg = p.text },
		mkdRule = { fg = p.blueGray1 },
		mkdURL = { link = 'mkdInlineURL' },

		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { fg = groups.error },
		DiagnosticDefaultHint = { fg = groups.hint },
		DiagnosticDefaultInfo = { fg = groups.info },
		DiagnosticDefaultWarn = { fg = groups.warn },
		DiagnosticFloatingError = { fg = groups.error },
		DiagnosticFloatingHint = { fg = groups.hint },
		DiagnosticFloatingInfo = { fg = groups.info },
		DiagnosticFloatingWarn = { fg = groups.warn },
		DiagnosticSignError = { fg = groups.error },
		DiagnosticSignHint = { fg = groups.hint },
		DiagnosticSignInfo = { fg = groups.info },
		DiagnosticSignWarn = { fg = groups.warn },
		DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
		DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
		DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
		DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
		DiagnosticUnderlineError = { sp = groups.error, style = 'undercurl' },
		DiagnosticUnderlineHint = { sp = groups.hint, style = 'undercurl' },
		DiagnosticUnderlineInfo = { sp = groups.info, style = 'undercurl' },
		DiagnosticUnderlineWarn = { sp = groups.warn, style = 'undercurl' },
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		-- TSAttribute = {},
		TSBoolean = { link = 'Boolean' },
		TSCharacter = { link = 'Character' },
		TSComment = { link = 'Comment' },
		TSConditional = { link = 'Conditional' },
		TSConstBuiltin = { fg = p.pink3 },
		-- TSConstMacro = {},
		TSConstant = { fg = p.teal1 },
		TSConstructor = { fg = p.teal1 },
		-- TSEmphasis = {},
		-- TSError = {},
		-- TSException = {},
		TSField = { fg = p.teal1 },
		-- TSFloat = {},
		TSFuncBuiltin = { fg = p.pink3 },
		-- TSFuncMacro = {},
		TSFunction = { fg = p.pink2 },
		TSInclude = { fg = p.teal2 },
		TSKeyword = { fg = p.teal2 },
		-- TSKeywordFunction = {},
		TSKeywordOperator = { fg = p.blueGray1 },
		TSLabel = { fg = p.teal1 },
		-- TSLiteral = {},
		-- TSMethod = {},
		-- TSNamespace = {},
		-- TSNone = {},
		TSNumber = { link = 'Number' },
		TSOperator = { fg = p.blueGray1 },
		TSParameter = { fg = p.pink2, style = styles.italic },
		-- TSParameterReference = {},
		TSProperty = { fg = p.pink2, style = styles.italic },
		TSPunctBracket = { fg = groups.punctuation },
		TSPunctDelimiter = { fg = groups.punctuation },
		TSPunctSpecial = { fg = groups.punctuation },
		-- TSRepeat = {},
		-- TSStrike = {},
		TSString = { link = 'String' },
		TSStringEscape = { fg = p.teal2 },
		-- TSStringRegex = {},
		TSStringSpecial = { link = 'TSString' },
		-- TSSymbol = {},
		TSTag = { fg = p.teal1 },
		TSTagDelimiter = { fg = p.blueGray1 },
		TSText = { fg = p.text },
		TSTitle = { fg = groups.headings.h1, style = 'bold' },
		TSType = { link = 'Type' },
		-- TSTypeBuiltin = {},
		TSURI = { fg = groups.link },
		-- TSUnderline = {},
		TSVariable = { fg = p.text, style = styles.italic },
		TSVariableBuiltin = { fg = p.pink3 },

		-- vim.lsp.buf.document_highlight()
		LspReferenceText = { bg = p.blueGray2 },
		LspReferenceRead = { bg = p.blueGray2 },
		LspReferenceWrite = { bg = p.blueGray2 },

		-- lsp-highlight-codelens
		LspCodeLens = { fg = p.blueGray1 }, -- virtual text of code lens
		LspCodeLensSeparator = { fg = p.highlight_high }, -- separator between two or more code lens

		-- romgrk/barbar.nvim
		BufferCurrent = { fg = p.text, bg = p.background1 },
		BufferCurrentIndex = { fg = p.text, bg = p.background1 },
		BufferCurrentMod = { fg = p.teal1, bg = p.background1 },
		BufferCurrentSign = { fg = p.blueGray1, bg = p.background1 },
		BufferCurrentTarget = { fg = p.yellow, bg = p.background1 },
		BufferInactive = { fg = p.blueGray1 },
		BufferInactiveIndex = { fg = p.blueGray1 },
		BufferInactiveMod = { fg = p.teal1 },
		BufferInactiveSign = { fg = p.blueGray2 },
		BufferInactiveTarget = { fg = p.yellow },
		BufferTabpageFill = { fg = groups.background, bg = groups.background },
		BufferVisible = { fg = p.blueGray1 },
		BufferVisibleIndex = { fg = p.blueGray1 },
		BufferVisibleMod = { fg = p.teal1 },
		BufferVisibleSign = { fg = p.blueGray2 },
		BufferVisibleTarget = { fg = p.yellow },

		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { fg = groups.git_add },
		GitSignsChange = { fg = groups.git_change },
		GitSignsDelete = { fg = groups.git_delete },
		SignAdd = { link = 'GitSignsAdd' },
		SignChange = { link = 'GitSignsChange' },
		SignDelete = { link = 'GitSignsDelete' },

		-- mvllow/modes.nvim
		ModesCopy = { bg = p.yellow },
		ModesDelete = { bg = p.pink3 },
		ModesInsert = { bg = p.teal1 },
		ModesVisual = { bg = p.pink2 },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = p.blueGray2 },
		NvimTreeFileDeleted = { fg = p.pink3 },
		NvimTreeFileDirty = { fg = p.pink2 },
		NvimTreeFileMerge = { fg = p.pink2 },
		NvimTreeFileNew = { fg = p.teal1 },
		NvimTreeFileRenamed = { fg = p.teal2 },
		NvimTreeFileStaged = { fg = p.pink2 },
		NvimTreeFolderIcon = { fg = p.blueGray1 },
		NvimTreeFolderName = { fg = p.teal1 },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = p.text },
		NvimTreeNormal = { fg = p.text },
		NvimTreeOpenedFile = { fg = p.text, bg = p.blueGray2 },
		NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
		NvimTreeRootFolder = { fg = p.pink2 },
		NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
		NvimTreeWindowPicker = { fg = groups.background, bg = p.pink2 },

		-- folke/which-key.nvim
		WhichKey = { fg = p.pink2 },
		WhichKeyGroup = { fg = p.teal1 },
		WhichKeySeparator = { fg = p.blueGray1 },
		WhichKeyDesc = { fg = p.yellow },
		WhichKeyFloat = { bg = groups.panel },
		WhichKeyValue = { fg = p.pink2 },

		-- luka-reineke/indent-blankline.nvim
		IndentBlanklineChar = { fg = p.blueGray2 },

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = p.blueGray1 },
		CmpItemAbbrDeprecated = { fg = p.blueGray1, style = 'strikethrough' },
		CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
		CmpItemAbbrMatchFuzzy = { fg = p.text, style = 'bold' },
		CmpItemKind = { fg = p.pink2 },
		CmpItemKindClass = { fg = p.yellow },
		CmpItemKindFunction = { fg = p.pink2 },
		CmpItemKindInterface = { fg = p.yellow },
		CmpItemKindMethod = { fg = p.pink2 },
		CmpItemKindSnippet = { fg = p.pink2 },
		CmpItemKindVariable = { fg = p.teal1 },

		-- TimUntersberger/neogit
		-- NeogitDiffAddHighlight = { fg = p.teal1, bg = p.blueGray2 },
		-- NeogitDiffContextHighlight = { bg = p.blueGray2 },
		-- NeogitDiffDeleteHighlight = { fg = p.pink3, bg = p.blueGray2 },
		-- NeogitHunkHeader = { bg = p.blueGray2 },
		-- NeogitHunkHeaderHighlight = { bg = p.blueGray2 },

		-- vimwiki/vimwiki
		-- VimwikiHR = { fg = p.blueGray1 },
		-- VimwikiHeader1 = { fg = groups.headings.h1, style = 'bold' },
		-- VimwikiHeader2 = { fg = groups.headings.h2, style = 'bold' },
		-- VimwikiHeader3 = { fg = groups.headings.h3, style = 'bold' },
		-- VimwikiHeader4 = { fg = groups.headings.h4, style = 'bold' },
		-- VimwikiHeader5 = { fg = groups.headings.h5, style = 'bold' },
		-- VimwikiHeader6 = { fg = groups.headings.h6, style = 'bold' },
		-- VimwikiHeaderChar = { fg = p.teal2 },
		-- VimwikiLink = { fg = groups.link, style = 'underline' },
		-- VimwikiList = { fg = p.pink2 },
		-- VimwikiNoExistsLink = { fg = p.pink3 },

		-- nvim-neorg/neorg
		-- NeorgHeading1Prefix = { fg = groups.headings.h1, style = 'bold' },
		-- NeorgHeading1Title = { link = 'NeorgHeading1Prefix' },
		-- NeorgHeading2Prefix = { fg = groups.headings.h2, style = 'bold' },
		-- NeorgHeading2Title = { link = 'NeorgHeading2Prefix' },
		-- NeorgHeading3Prefix = { fg = groups.headings.h3, style = 'bold' },
		-- NeorgHeading3Title = { link = 'NeorgHeading3Prefix' },
		-- NeorgHeading4Prefix = { fg = groups.headings.h4, style = 'bold' },
		-- NeorgHeading4Title = { link = 'NeorgHeading4Prefix' },
		-- NeorgHeading5Prefix = { fg = groups.headings.h5, style = 'bold' },
		-- NeorgHeading5Title = { link = 'NeorgHeading5Prefix' },
		-- NeorgHeading6Prefix = { fg = groups.headings.h6, style = 'bold' },
		-- NeorgHeading6Title = { link = 'NeorgHeading6Prefix' },
		-- NeorgMarkerTitle = { fg = p.text, style = 'bold' },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		-- DefinitionCount = { fg = p.pink2 },
		-- DefinitionIcon = { fg = p.pink2 },
		-- DefintionPreviewTitle = { fg = p.pink2, style = 'bold' },
		-- LspFloatWinBorder = { fg = groups.border },
		-- LspFloatWinNormal = { bg = groups.background },
		-- LspSagaAutoPreview = { fg = p.blueGray1 },
		-- LspSagaCodeActionBorder = { fg = groups.border },
		-- LspSagaCodeActionContent = { fg = p.teal1 },
		-- LspSagaCodeActionTitle = { fg = p.yellow, style = 'bold' },
		-- LspSagaCodeActionTruncateLine = { link = 'LspSagaCodeActionBorder' },
		-- LspSagaDefPreviewBorder = { fg = groups.border },
		-- LspSagaDiagnosticBorder = { fg = groups.border },
		-- LspSagaDiagnosticHeader = { fg = p.yellow, style = 'bold' },
		-- LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
		-- LspSagaDocTruncateLine = { link = 'LspSagaHoverBorder' },
		-- LspSagaFinderSelection = { fg = p.yellow },
		-- LspSagaHoverBorder = { fg = groups.border },
		-- LspSagaLspFinderBorder = { fg = groups.border },
		-- LspSagaRenameBorder = { fg = p.teal2 },
		-- LspSagaRenamePromptPrefix = { fg = p.pink3 },
		-- LspSagaShTruncateLine = { link = 'LspSagaSignatureHelpBorder' },
		-- LspSagaSignatureHelpBorder = { fg = p.teal2 },
		-- ReferencesCount = { fg = p.pink2 },
		-- ReferencesIcon = { fg = p.pink2 },
		-- SagaShadow = { bg = p.background1 },
		-- TargetWord = { fg = p.pink2 },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { bg = p.gray },

		-- rlane/pounce.nvim
		PounceAccept = { fg = p.pink3, bg = p.background2 },
		PounceAcceptBest = { fg = p.background3, bg = p.yellow },
		PounceGap = { link = 'Search' },
		PounceMatch = { link = 'Search' },

		-- nvim-telescope/telescope.nvim
		TelescopeBorder = { fg = groups.border },
		TelescopeMatching = { fg = p.teal1 },
		TelescopeNormal = { fg = p.text },
		TelescopePromptNormal = { fg = p.text },
		TelescopePromptPrefix = { fg = p.blueGray1 },
		TelescopeSelection = { fg = p.text, bg = p.gray },
		TelescopeSelectionCaret = { fg = p.pink2, bg = p.gray },
		TelescopeTitle = { fg = p.blueGray1 },

		-- rcarriga/nvim-notify
		NotifyINFOBorder = { fg = p.teal1 },
		NotifyINFOTitle = { link = 'NotifyINFOBorder' },
		NotifyINFOIcon = { link = 'NotifyINFOBorder' },
		NotifyWARNBorder = { fg = p.yellow },
		NotifyWARNTitle = { link = 'NotifyWARNBorder' },
		NotifyWARNIcon = { link = 'NotifyWARNBorder' },
		NotifyDEBUGBorder = { fg = p.blueGray1 },
		NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
		NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
		NotifyTRACEBorder = { fg = p.blue1 },
		NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
		NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
		NotifyERRORBorder = { fg = p.pink3 },
		NotifyERRORTitle = { link = 'NotifyERRORBorder' },
		NotifyERRORIcon = { link = 'NotifyERRORBorder' },
	}

	vim.g.terminal_color_0 = p.background3 -- black
	vim.g.terminal_color_8 = p.gray -- bright black
	vim.g.terminal_color_1 = p.pink2 -- red
	vim.g.terminal_color_9 = p.pink2 -- bright red
	vim.g.terminal_color_2 = p.teal2 -- green
	vim.g.terminal_color_10 = p.teal1 -- bright green
	vim.g.terminal_color_3 = p.yellow -- yellow
	vim.g.terminal_color_11 = p.yellow -- bright yellow
	vim.g.terminal_color_4 = p.blue1 -- blue
	vim.g.terminal_color_12 = p.blue1 -- bright blue
	vim.g.terminal_color_5 = p.pink3 -- magenta
	vim.g.terminal_color_13 = p.pink3 -- bright magenta
	vim.g.terminal_color_6 = p.blue2 -- cyan
	vim.g.terminal_color_14 = p.blue2 -- bright cyan
	vim.g.terminal_color_7 = p.text -- white
	vim.g.terminal_color_15 = p.text -- bright white

	return theme
end

return M
