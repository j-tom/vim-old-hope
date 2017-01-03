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


" Variables {{{
let g:colors_name="old-hope"
" * Determine t_Co support
let s:tCol = functions#GetTCo()
" }}}

" Colors {{{
" * GUI
let s:gWhite           = "#FFFFFF"
let s:gBlack           = "#000000"

let s:gVeryLightGrey   = "#CBCDD2"
let s:gLightGrey       = "#848794"
let s:gGrey            = "#686B78"
let s:gDarkGrey        = "#45474F"
let s:gVeryDarkGrey    = "#1C1D21"
let s:gRed             = "#EB3D54"
let s:gOrange          = "#EF7C2A"
let s:gYellow          = "#E5CD52"
let s:gGreen           = "#78BD65"
let s:gBlue            = "#4FB4D8"
" * t_Co 256 (cterm)
if s:tCol == 256
  let s:tWhite         = 15
  let s:tBlack         = 0

  let s:tVeryLightGrey = 252
  let s:tLightGrey     = 245
  let s:tGrey          = 242
  let s:tDarkGrey      = 238
  let s:tVeryDarkGrey  = 234
  let s:tRed           = 203 " 9, 197
  let s:tOrange        = 202 " 166
  let s:tYellow        = 221 " 222, 227
  let s:tGreen         = 41  " 47
  let s:tBlue          = 39  " 45
" * t_Co 16
elseif s:tCol == 16
  let s:tWhite         = 15
  let s:tBlack         = 0

  let s:tVeryLightGrey = 7
  let s:tLightGrey     = 7
  let s:tGrey          = 8
  let s:tDarkGrey      = 8
  let s:tVeryDarkGrey  = 0
  let s:tRed           = 9 " 1
  let s:tOrange        = 5 " 13
  let s:tYellow        = 11
  let s:tGreen         = 2  " 10
  let s:tBlue          = 14 " 12
" * t_Co 8
else
  let s:tWhite         = 7
  let s:tBlack         = 0

  let s:tVeryLightGrey = 7
  let s:tLightGrey     = 7
  let s:tGrey          = 7
  let s:tDarkGrey      = 0
  let s:tVeryDarkGrey  = 0
  let s:tRed           = 1
  let s:tOrange        = 5
  let s:tYellow        = 3
  let s:tGreen         = 2
  let s:tBlue          = 6
endif
" }}}

" Variables {{{
let s:gFg = s:gVeryLightGrey
let s:gBg = s:gVeryDarkGrey
let s:tFg = s:tVeryLightGrey
let s:tBg = s:tVeryDarkGrey

let s:vBold          = {'GUI': "BOLD"          , 'TERM': "BOLD"          }
let s:vItalic        = {'GUI': "ITALIC"        , 'TERM': "ITALIC"        }
let s:vUnderline     = {'GUI': "UNDERLINE"     , 'TERM': "UNDERLINE"     }
let s:vNone          = {'GUI': "NONE"          , 'TERM': "NONE"          }
let s:vBoldItalic    = {'GUI': "BOLD,ITALIC"   , 'TERM': "BOLD,ITALIC"   }
let s:vFg            = {'GUI': s:gFg           , 'TERM': s:tFg           }
let s:vBg            = {'GUI': s:gBg           , 'TERM': s:tBg           }
let s:vWhite         = {'GUI': s:gWhite        , 'TERM': s:tWhite        }
let s:vBlack         = {'GUI': s:gBlack        , 'TERM': s:tBlack        }
let s:vVeryLightGrey = {'GUI': s:gVeryLightGrey, 'TERM': s:tVeryLightGrey}
let s:vLightGrey     = {'GUI': s:gLightGrey    , 'TERM': s:tLightGrey    }
let s:vGrey          = {'GUI': s:gGrey         , 'TERM': s:tGrey         }
let s:vDarkGrey      = {'GUI': s:gDarkGrey     , 'TERM': s:tDarkGrey     }
let s:vVeryDarkGrey  = {'GUI': s:gVeryDarkGrey , 'TERM': s:tVeryDarkGrey }
let s:vRed           = {'GUI': s:gRed          , 'TERM': s:tRed          }
let s:vOrange        = {'GUI': s:gOrange       , 'TERM': s:tOrange       }
let s:vYellow        = {'GUI': s:gYellow       , 'TERM': s:tYellow       }
let s:vGreen         = {'GUI': s:gGreen        , 'TERM': s:tGreen        }
let s:vBlue          = {'GUI': s:gBlue         , 'TERM': s:tBlue         }
" }}}

" Highlight groups {{{
" Basics
call functions#SetHi ("Normal"        , s:vFg           , s:vBg           , s:vNone      )
call functions#SetHi ("Underlined"    , s:vFg           , s:vBg           , s:vUnderline )
call functions#SetHi ("Comment"       , s:vGrey         , s:vBg           , s:vNone      )
call functions#SetHi ("Todo"          , s:vOrange       , s:vBg           , s:vBoldItalic)
call functions#SetHi ("Ignore"        , s:vGrey         , s:vBg           , s:vNone      )
" * Variable types
call functions#SetHi ("Constant"      , s:vOrange       , s:vBg           , s:vNone      )
call functions#LinkHi("Number"        , "Constant")
call functions#LinkHi("Float"         , "Number")
call functions#LinkHi("Boolean"       , "Constant")

call functions#SetHi ("String"        , s:vBlue         , s:vBg           , s:vItalic    )
call functions#LinkHi("Character"     , "String")
" * Keywords
call functions#SetHi ("Statement"     , s:vGreen        , s:vBg           , s:vNone      )
call functions#LinkHi("Conditional"   , "Statement")
call functions#LinkHi("Keyword"       , "Statement")
call functions#LinkHi("Repeat"        , "Statement")
call functions#LinkHi("Label"         , "Statement")
call functions#LinkHi("Operator"      , "Statement")
" * PreProcessor macros
call functions#SetHi ("Define"        , s:vGreen        , s:vBg           , s:vItalic    )
call functions#LinkHi("Include"       , "Define")
call functions#LinkHi("Macro"         , "Define")
call functions#LinkHi("PreCondit"     , "Define")
call functions#LinkHi("PreProc"       , "Define")
" * Functions
call functions#SetHi ("Identifier"    , s:vYellow       , s:vBg           , s:vNone      )
call functions#LinkHi("Function"      , "Identifier")
" * Types
call functions#SetHi ("Type"          , s:vRed          , s:vBg           , s:vItalic    )
call functions#LinkHi("Typedef"       , "Type")
call functions#LinkHi("Structure"     , "Type")
call functions#LinkHi("StorageClass"  , "Type")
" * Specials
call functions#SetHi ("Special"       , s:vBlue         , s:vBg           , s:vNone      )
call functions#LinkHi("SpecialChar"   , "Special")
call functions#LinkHi("Tag"           , "Special")
call functions#LinkHi("Delimiter"     , "Special")
call functions#LinkHi("SpecialComment", "Special")
call functions#LinkHi("SpecialKey"    , "Special")
call functions#LinkHi("Debug"         , "Special")
" * Cursor
call functions#SetHi ("Cursor"        , s:vBg           , s:vFg           , s:vNone      )
call functions#LinkHi("iCursor"       , "Cursor")
call functions#LinkHi("vCursor"       , "Cursor")
call functions#LinkHi("lCursor"       , "Cursor")
" * Diff
call functions#SetHi ("DiffAdd"       , s:vVeryDarkGrey , s:vGreen        , s:vNone      )
call functions#SetHi ("DiffChange"    , s:vVeryDarkGrey , s:vYellow       , s:vNone      )
call functions#SetHi ("DiffDelete"    , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call functions#SetHi ("DiffText"      , s:vNone         , s:vGrey         , s:vNone      )
" * Errors
call functions#SetHi ("Error"         , s:vVeryDarkGrey , s:vRed          , s:vBold      )
call functions#SetHi ("ErrorMsg"      , s:vVeryDarkGrey , s:vRed          , s:vNone      )
call functions#SetHi ("Exception"     , s:vYellow       , s:vBg           , s:vBold      )
" * Folding
call functions#SetHi ("Folded"        , s:vLightGrey    , s:vDarkGrey     , s:vNone      )
call functions#LinkHi("FoldColumn"    , "Folded")
" * Searching
call functions#SetHi ("IncSearch"     , s:vVeryDarkGrey , s:vVeryLightGrey, s:vNone      )
call functions#SetHi ("Search"        , s:vVeryDarkGrey , s:vOrange       , s:vNone      )
" * Other
call functions#SetHi ("MatchParen"    , s:vVeryDarkGrey , s:vYellow       , s:vBold      )
call functions#SetHi ("ModeMsg"       , s:vOrange       , s:vBg           , s:vNone      )
call functions#SetHi ("Question"      , s:vOrange       , s:vBg           , s:vNone      )
" * Complete menu
call functions#SetHi ("Pmenu"         , s:vWhite        , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("PmenuSel"      , s:vVeryDarkGrey , s:vGreen        , s:vBold      )
call functions#SetHi ("PmenuSbar"     , s:vVeryDarkGrey , s:vVeryDarkGrey , s:vNone      )
call functions#SetHi ("PmenuSbar"     , s:vGreen        , s:vVeryDarkGrey , s:vNone      )
" * Marks
call functions#SetHi ("SignColumn"    , s:vFg           , s:vBg           , s:vNone      )
" GUI
call functions#SetHi ("StatusLine"    , s:vBlue         , s:vBg           , s:vNone      )
call functions#SetHi ("StatusLineNC"  , s:vGrey         , s:vBg           , s:vNone      )
call functions#SetHi ("Title"         , s:vOrange       , s:vNone         , s:vNone      )
call functions#SetHi ("VertSplit"     , s:vRed          , s:vBg           , s:vBold      )
call functions#SetHi ("VisualNOS"     , s:vNone         , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("Visual"        , s:vNone         , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("WarningMsg"    , s:vOrange       , s:vBg           , s:vNone      )
call functions#SetHi ("WildMenu"      , s:vBlue         , s:vBg           , s:vNone      )
call functions#SetHi ("Directory"     , s:vGreen        , s:vBg           , s:vBold      )
call functions#SetHi ("TabLineFill"   , s:vVeryDarkGrey , s:vBg           , s:vNone      )
call functions#SetHi ("TabLineSel"    , s:vLightGrey    , s:vBg           , s:vNone      )
call functions#SetHi ("TabLine"       , s:vGrey         , s:vBg           , s:vNone      )
call functions#SetHi ("CursorLineNr"  , s:vBlue         , s:vBg           , s:vBold      )
call functions#SetHi ("CursorLine"    , s:vNone         , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("CursorColumn"  , s:vNone         , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("ColorColumn"   , s:vNone         , s:vDarkGrey     , s:vNone      )
call functions#SetHi ("LineNr"        , s:vGrey         , s:vBg           , s:vNone      )
call functions#SetHi ("NonText"       , s:vRed          , s:vBg           , s:vNone      )

" Force dark background
set background=dark
