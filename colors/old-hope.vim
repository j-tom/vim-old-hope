" ------------------------------------------------------------------------------
" Author: j-tom
" Source: https://github.com/j-tom/vim-old-hope
" Note:   Based on the 'An Old Hope' theme for Atom editor
"         (https://atom.io/themes/an-old-hope-syntax)
" ------------------------------------------------------------------------------

" Reset colors to default colorscheme {{{
hi clear

if exists("syntax_on")
  syntax reset
endif
" }}}

" Functions {{{
" * Detect used t_Co
function! s:GetTCo()
  if exists("&t_Co")
    if (&t_Co > 255)
      let s:tCol=256
    elseif (&t_Co > 15 && &t_Co < 256)
      let s:tCol=16
    else
      let s:tCol=8
    endif
  else " no t_Co specified probably using GUI
    let s:tCol=256
    set t_Co=s:tCol
  endif
endfunction

" * Set highlighting for the given group
function! s:SetHi(grp, gfg, gbg, g, cfg, cbg, c)
  let l:hiStr= "hi! " .a:grp
  if a:gfg != ""
    let l:hiStr= l:hiStr ." guifg=" .a:gfg
  endif
  if a:gbg != ""
    let l:hiStr= l:hiStr ." guibg=" .a:gbg
  endif
  if a:g != ""
    let l:hiStr= l:hiStr ." gui=" .a:g
  endif
  if a:cfg != ""
    let l:hiStr= l:hiStr ." ctermfg=" .a:cfg
  endif
  if a:cbg != ""
    let l:hiStr= l:hiStr ." ctermbg=" .a:cbg
  endif
  if a:c != ""
    let l:hiStr= l:hiStr ." cterm=" .a:c
  endif
  execute l:hiStr
endfunction
" }}}

" Variables {{{
let g:colors_name="old-hope"
" * Determine t_Co support
call s:GetTCo()
" }}}

" Colors {{{
" * GUI
let s:gWhite           = "#FFFFFF"
let s:gVeryLightGrey   = "#CBCDD2"
let s:gLightGrey       = "#848794"
let s:gGrey            = "#686B78"
let s:gDarkGrey        = "#45474F"
let s:gVeryDarkGrey    = "#1C1D21"
let s:gBlack           = "#000000"
let s:gRed             = "#EB3D54"
let s:gOrange          = "#EF7C2A"
let s:gYellow          = "#E5CD52"
let s:gGreen           = "#78BD65"
let s:gBlue            = "#4FB4D8"
" * t_Co 256 (cterm)
if s:tCol == 256
  let s:tWhite         = 15
  let s:tVeryLightGrey = 252
  let s:tLightGrey     = 245
  let s:tGrey          = 242
  let s:tDarkGrey      = 238
  let s:tVeryDarkGrey  = 234
  let s:tBlack         = 0
  let s:tRed           = 9   " 203, 167, 196, 160
  let s:tOrange        = 202 " 166
  let s:tYellow        = 221 " 222, 227
  let s:tGreen         = 41  " 47
  let s:tBlue          = 39  " 45
" * t_Co 16
elseif s:tCol == 16
  let s:tWhite         = 15
  let s:tVeryLightGrey = 7
  let s:tLightGrey     = 7
  let s:tGrey          = 8
  let s:tDarkGrey      = 8
  let s:tVeryDarkGrey  = 0
  let s:tBlack         = 0
  let s:tRed           = 9 " 1
  let s:tOrange        = 5 " 1, 3
  let s:tYellow        = 11
  let s:tGreen         = 2  " 10
  let s:tBlue          = 4  " 12
" * t_Co 8
else
  let s:tWhite         = 7
  let s:tVeryLightGrey = 7
  let s:tLightGrey     = 7
  let s:tGrey          = 7
  let s:tDarkGrey      = 0
  let s:tVeryDarkGrey  = 0
  let s:tBlack         = 0
  let s:tRed           = 1
  let s:tOrange        = 5 " 6
  let s:tYellow        = 3
  let s:tGreen         = 2
  let s:tBlue          = 4 " 6
endif
" }}}

" Highlight groups {{{
" Base coloring
call s:SetHi("Normal"        , s:gVeryLightGrey, s:gBlack       , "none"       , s:tVeryLightGrey, s:tBlack       , "none"       )
call s:SetHi("Underlined"    , s:gVeryLightGrey, s:gBlack       , "underline"  , s:tVeryLightGrey, s:tBlack       , "underline"  )
" * Variable types
call s:SetHi("Number"        , s:gOrange       , s:gBlack       , "none"       , s:tOrange       , s:tBlack       , "none"       )
call s:SetHi("Float"         , s:gOrange       , s:gBlack       , "none"       , s:tOrange       , s:tBlack       , "none"       )
call s:SetHi("Constant"      , s:gOrange       , s:gBlack       , "bold"       , s:tOrange       , s:tBlack       , "bold"       )
call s:SetHi("Boolean"       , s:gYellow       , s:gBlack       , "italic"     , s:tYellow       , s:tBlack       , "italic"     )
call s:SetHi("String"        , s:gGreen        , s:gBlack       , "italic"     , s:tGreen        , s:tBlack       , "italic"     )
call s:SetHi("Character"     , s:gGreen        , s:gBlack       , "italic"     , s:tGreen        , s:tBlack       , "italic"     )
" * Keyword types
call s:SetHi("Conditional"   , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("Keyword"       , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("Operator"      , s:gRed          , s:gBlack       , "none"       , s:tRed          , s:tBlack       , "none"       )
call s:SetHi("Statement"     , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("Directory"     , s:gGreen        , s:gBlack       , "bold"       , s:tGreen        , s:tBlack       , "bold"       )
call s:SetHi("Label"         , s:gYellow       , s:gBlack       , "none"       , s:tYellow       , s:tBlack       , "none"       )
call s:SetHi("Define"        , s:gBlue         , s:gBlack       , "italic"     , s:tBlue         , s:tBlack       , "italic"     )
call s:SetHi("Macro"         , s:gBlue         , s:gBlack       , "italic"     , s:tBlue         , s:tBlack       , "italic"     )
call s:SetHi("SpecialKey"    , s:gBlue         , s:gBlack       , "italic"     , s:tBlue         , s:tBlack       , "italic"     )
call s:SetHi("Function"      , s:gYellow       , s:gBlack       , "none"       , s:tYellow       , s:tBlack       , "none"       )
call s:SetHi("Identifier"    , s:gYellow       , s:gBlack       , "none"       , s:tYellow       , s:tBlack       , "none"       )
call s:SetHi("PreCondit"     , s:gOrange       , s:gBlack       , "none"       , s:tOrange       , s:tBlack       , "none"       )
call s:SetHi("PreProc"       , s:gOrange       , s:gBlack       , "none"       , s:tOrange       , s:tBlack       , "none"       )
call s:SetHi("Delimiter"     , s:gVeryLightGrey, s:gBlack       , "none"       , s:tVeryLightGrey, s:tBlack       , "none"       )
call s:SetHi("Todo"          , s:gOrange       , s:gBlack       , "bold"       , s:tOrange       , s:tBlack       , "bold"       )
call s:SetHi("Structure"     , s:gGreen        , s:gBlack       , "none"       , s:tGreen        , s:tBlack       , "none"       )
call s:SetHi("Typedef"       , s:gGreen        , s:gBlack       , "none"       , s:tGreen        , s:tBlack       , "none"       )
call s:SetHi("Type"          , s:gGreen        , s:gBlack       , "none"       , s:tGreen        , s:tBlack       , "none"       )
call s:SetHi("Comment"       , s:gGrey         , s:gBlack       , "none"       , s:tGrey         , s:tBlack       , "none"       )
" * Cursor
call s:SetHi("Cursor"        , s:gBlack        , s:gWhite       , "none"       , s:tBlack        , s:tWhite       , "none"       )
call s:SetHi("iCursor"       , s:gBlack        , s:gWhite       , "none"       , s:tBlack        , s:tWhite       , "none"       )
" * Diff
call s:SetHi("DiffAdd"       , s:gBlack        , s:gGreen       , "none"       , s:tBlack        , s:tGreen       , "none"       )
call s:SetHi("DiffChange"    , s:gBlack        , s:gYellow      , "none"       , s:tBlack        , s:tYellow      , "none"       )
call s:SetHi("DiffDelete"    , s:gBlack        , s:gRed         , "none"       , s:tBlack        , s:tRed         , "none"       )
call s:SetHi("DiffText"      , ""              , s:gGrey        , "italic,bold", ""              , s:tGrey        , "italic,bold")
" * Errors
call s:SetHi("Debug"         , s:gOrange       , s:gBlack       , "bold"       , s:tOrange       , s:tBlack       , "bold"       )
call s:SetHi("Error"         , s:gBlack        , s:gRed         , "bold"       , s:tBlack        , s:tRed         , "bold"       )
call s:SetHi("ErrorMsg"      , s:gBlack        , s:gRed         , "none"       , s:tBlack        , s:tRed         , "none"       )
call s:SetHi("Exception"     , s:gYellow       , s:gBlack       , "bold"       , s:tYellow       , s:tBlack       , "bold"       )
" * Folding
call s:SetHi("FoldColumn"    , s:gLightGrey    , s:gDarkGrey    , "none"       , s:tLightGrey    , s:tDarkGrey    , "none"       )
call s:SetHi("Folded"        , s:gLightGrey    , s:gDarkGrey    , "none"       , s:tLightGrey    , s:tDarkGrey    , "none"       )
" * Searching
call s:SetHi("IncSearch"     , s:gBlack        , s:gLightGrey   , "none"       , s:tBlack        , s:tLightGrey   , "none"       )
call s:SetHi("Search"        , s:gBlack        , s:gBlue        , "none"       , s:tBlack        , s:tBlue        , "none"       )
" * Other
call s:SetHi("Ignore"        , s:gGrey         , s:gBlack       , "none"       , s:tGrey         , s:tBlack       , "none"       )
call s:SetHi("MatchParen"    , s:gYellow       , s:gBlack       , "bold"       , s:tYellow       , s:tBlack       , "bold"       )
call s:SetHi("ModeMsg"       , s:gGreen        , s:gBlack       , "bold"       , s:tGreen        , s:tBlack       , "bold"       )
call s:SetHi("ModeMsg"       , s:gYellow       , s:gBlack       , "bold"       , s:tYellow       , s:tBlack       , "bold"       )
call s:SetHi("Question"      , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("Repeat"        , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
" * Complete menu
call s:SetHi("Pmenu"         , s:gWhite        , s:gDarkGrey    , "none"       , s:tWhite        , s:tDarkGrey    , "none"       )
call s:SetHi("PmenuSel"      , s:gBlack        , s:gYellow      , "bold"       , s:tBlack        , s:tYellow      , "bold"       )
call s:SetHi("PmenuSbar"     , s:gVeryDarkGrey , s:gVeryDarkGrey, "none"       , s:tVeryDarkGrey , s:tVeryDarkGrey, "none"       )
call s:SetHi("PmenuSbar"     , s:gBlue         , s:gDarkGrey    , "none"       , s:tBlue         , s:tDarkGrey    , "none"       )
" * Marks
call s:SetHi("SignColumn"    , s:gGreen        , s:gBlack       , "none"       , s:tGreen        , s:tBlack       , "none"       )
call s:SetHi("SpecialChar"   , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("SpecialChar"   , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("SpecialComment", s:gGrey         , s:gBlack       , "bold"       , s:tGrey         , s:tBlack       , "bold"       )
call s:SetHi("Special"       , s:gBlue         , s:gBlack       , "italic"     , s:tBlue         , s:tBlack       , "italic"     )
" GUI
call s:SetHi("StatusLine"    , s:gBlue         , s:gBlack       , "none"       , s:tGreen        , s:tBlack       , "none"       )
call s:SetHi("StatusLineNC"  , s:gDarkGrey     , s:gBlack       , "none"       , s:tDarkGrey     , s:tBlack       , "none"       )
call s:SetHi("StorageClass"  , s:gYellow       , ""             , "italic"     , s:tYellow       , ""             , "italic"     )
call s:SetHi("Tag"           , ""              , ""             , "underline"  , ""              , ""             , "underline"  )
call s:SetHi("Title"         , s:gOrange       , ""             , "none"       , s:tOrange       , ""             , "none"       )
call s:SetHi("VertSplit"     , s:gRed          , s:gBlack       , "bold"       , s:tRed          , s:tBlack       , "bold"       )
call s:SetHi("VisualNOS"     , ""              , s:gVeryDarkGrey, ""           , ""              , s:tVeryDarkGrey, ""           )
call s:SetHi("Visual"        , ""              , s:gVeryDarkGrey, ""           , ""              , s:tVeryDarkGrey, ""           )
call s:SetHi("WarningMsg"    , s:gOrange       , s:gBlack       , ""           , s:tOrange       , s:tBlack       , ""           )
call s:SetHi("WildMenu"      , s:gBlue         , s:gBlack       , ""           , s:tBlue         , s:tBlack       , ""           )
call s:SetHi("TabLineFill"   , s:gBlack        , s:gBlack       , "none"       , s:tBlack        , s:tBlack       , "none"       )
call s:SetHi("TabLineSel"    , s:gLightGrey    , s:gBlack       , "none"       , s:tLightGrey    , s:tBlack       , "none"       )
call s:SetHi("TabLine"       , s:gGrey         , s:gBlack       , "none"       , s:tGrey         , s:tBlack       , "none"       )
call s:SetHi("CursorLineNr"  , s:gBlue         , s:gBlack       , "bold"       , s:tBlue         , s:tBlack       , "bold"       )
call s:SetHi("CursorLine"    , ""              , s:gVeryDarkGrey, ""           , ""              , s:tVeryDarkGrey, ""           )
call s:SetHi("CursorColumn"  , ""              , s:gVeryDarkGrey, ""           , ""              , s:tVeryDarkGrey, ""           )
call s:SetHi("ColorColumn"   , ""              , s:gVeryDarkGrey, ""           , ""              , s:tVeryDarkGrey, ""           )
call s:SetHi("LineNr"        , s:gGrey         , s:gBlack       , "none"       , s:tGrey         , s:tBlack       , "none"       )
call s:SetHi("NonText"       , s:gRed          , s:gBlack       , "none"       , s:tRed          , s:tBlack       , "none"       )
call s:SetHi("SpecialKey"    , s:gRed          , s:gBlack       , "none"       , s:tRed          , s:tBlack       , "none"       )

" Force dark background
set background=dark
