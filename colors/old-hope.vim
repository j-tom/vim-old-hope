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

" * Link highlighting of one group to another
function! s:LinkHi(obj, target)
  execute "hi! link " .a:obj ." " .a:target
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
" }}}

" Highlight groups {{{
" Basics
call s:SetHi ("Normal"        , s:gFg           , s:gBg           , "none"       , s:tFg           , s:tBg           , "none"       )
call s:SetHi ("Underlined"    , s:gFg           , s:gBg           , "underline"  , s:tFg           , s:tBg           , "underline"  )
call s:SetHi ("Comment"       , s:gGrey         , s:gBg           , ""           , s:tGrey         , s:tBg           , ""           )
call s:SetHi ("Todo"          , s:gOrange       , s:gBg           , "bold,italic", s:tOrange       , s:tBg           , "bold,italic")
call s:SetHi ("Ignore"        , s:gGrey         , s:gBg           , ""           , s:tGrey         , s:tBg           , ""           )
" * Variable types
call s:SetHi ("Constant"      , s:gOrange       , s:gBg           , "none"       , s:tOrange       , s:tBg           , "none"       )
call s:LinkHi("Number"        , "Constant")
call s:LinkHi("Float"         , "Number")
call s:LinkHi("Boolean"       , "Constant")

call s:SetHi ("String"        , s:gBlue         , s:gBg           , "italic"     , s:tBlue         , s:tBg           , "italic"     )
call s:LinkHi("Character"     , "String")
" * Keywords
call s:SetHi ("Statement"     , s:gGreen        , s:gBg           , "none"       , s:tGreen        , s:tBg           , "none"       )
call s:LinkHi("Conditional"   , "Statement")
call s:LinkHi("Keyword"       , "Statement")
call s:LinkHi("Repeat"        , "Statement")
call s:LinkHi("Label"         , "Statement")
call s:LinkHi("Operator"      , "Statement")
" * PreProcessor macros
call s:SetHi ("Define"        , s:gGreen        , s:gBg           , "none"       , s:tGreen        , s:tBg           , "none"       )
call s:LinkHi("Include"       , "Define")
call s:LinkHi("Macro"         , "Define")
call s:LinkHi("PreCondit"     , "Define")
call s:LinkHi("PreProc"       , "Define")
" * Functions
call s:SetHi ("Identifier"    , s:gYellow       , s:gBg           , "none"       , s:tYellow       , s:tBg           , "none"       )
call s:LinkHi("Function"      , "Identifier")
" * Types
call s:SetHi ("Type"          , s:gRed          , s:gBg           , "italic"     , s:tRed          , s:tBg           , "italic"     )
call s:LinkHi("Typedef"       , "Type")
call s:LinkHi("Structure"     , "Type")
call s:LinkHi("StorageClass"  , "Type")
" * Specials
call s:SetHi ("Special"       , s:gBlue         , s:gBg           , "none"       , s:tBlue         , s:tBg           , "none"       )
call s:LinkHi("SpecialChar"   , "Special")
call s:LinkHi("Tag"           , "Special")
call s:LinkHi("Delimiter"     , "Special")
call s:LinkHi("SpecialComment", "Special")
call s:LinkHi("SpecialKey"    , "Special")
call s:LinkHi("Debug"         , "Special")
" * Cursor
call s:SetHi ("Cursor"        , s:gVeryDarkGrey , s:gWhite        , ""           , s:tVeryDarkGrey , s:tWhite        , ""           )
call s:LinkHi("iCursor"       , "Cursor")
" * Diff
call s:SetHi ("DiffAdd"       , s:gVeryDarkGrey , s:gGreen        , ""           , s:tVeryDarkGrey , s:tGreen        , ""           )
call s:SetHi ("DiffChange"    , s:gVeryDarkGrey , s:gYellow       , ""           , s:tVeryDarkGrey , s:tYellow       , ""           )
call s:SetHi ("DiffDelete"    , s:gVeryDarkGrey , s:gRed          , ""           , s:tVeryDarkGrey , s:tRed          , ""           )
call s:SetHi ("DiffText"      , ""              , s:gGrey         , ""           , ""              , s:tGrey         , ""           )
" * Errors
call s:SetHi ("Error"         , s:gVeryDarkGrey , s:gRed          , "bold"       , s:tVeryDarkGrey , s:tRed          , "bold"       )
call s:SetHi ("ErrorMsg"      , s:gVeryDarkGrey , s:gRed          , "none"       , s:tVeryDarkGrey , s:tRed          , "none"       )
call s:SetHi ("Exception"     , s:gYellow       , s:gBg           , "bold"       , s:tYellow       , s:tBg           , "bold"       )
" * Folding
call s:SetHi ("Folded"        , s:gLightGrey    , s:gDarkGrey     , "none"       , s:tLightGrey    , s:tDarkGrey     , "none"       )
call s:LinkHi("FoldColumn"    , "Folded")
" * Searching
call s:SetHi ("IncSearch"     , s:gVeryDarkGrey , s:gVeryLightGrey, "none"       , s:tVeryDarkGrey , s:tVeryLightGrey, "none"       )
call s:SetHi ("Search"        , s:gVeryDarkGrey , s:gOrange       , ""           , s:tVeryDarkGrey , s:tOrange       , ""           )
" * Other
call s:SetHi ("MatchParen"    , s:gVeryDarkGrey , s:gYellow       , "bold"       , s:tVeryDarkGrey , s:tYellow       , "bold"       )
call s:SetHi ("ModeMsg"       , s:gOrange       , s:gBg           , ""           , s:tOrange       , s:tBg           , ""           )
call s:SetHi ("Question"      , s:gOrange       , s:gBg           , ""           , s:tOrange       , s:tBg           , ""           )
" * Complete menu
call s:SetHi ("Pmenu"         , s:gWhite        , s:gDarkGrey     , "none"       , s:tWhite        , s:tDarkGrey     , "none"       )
call s:SetHi ("PmenuSel"      , s:gVeryDarkGrey , s:gGreen        , "bold"       , s:tVeryDarkGrey , s:tGreen        , "bold"       )
call s:SetHi ("PmenuSbar"     , s:gVeryDarkGrey , s:gVeryDarkGrey , "none"       , s:tVeryDarkGrey , s:tVeryDarkGrey , "none"       )
call s:SetHi ("PmenuSbar"     , s:gGreen        , s:gVeryDarkGrey , "none"       , s:tGreen        , s:tVeryDarkGrey , "none"       )
" * Marks
call s:SetHi ("SignColumn"    , s:gFg           , s:gBg           , ""           , s:tFg           , s:tBg           , ""           )
" GUI
call s:SetHi ("StatusLine"    , s:gBlue         , s:gBg           , "none"       , s:tGreen        , s:tBg           , "none"       )
call s:SetHi ("StatusLineNC"  , s:gGrey         , s:gBg           , "none"       , s:tGrey         , s:tBg           , "none"       )
call s:SetHi ("Title"         , s:gOrange       , ""              , "none"       , s:tOrange       , ""              , "none"       )
call s:SetHi ("VertSplit"     , s:gRed          , s:gBg           , "bold"       , s:tRed          , s:tBg           , "bold"       )
call s:SetHi ("VisualNOS"     , ""              , s:gDarkGrey     , ""           , ""              , s:tDarkGrey     , ""           )
call s:SetHi ("Visual"        , ""              , s:gDarkGrey     , ""           , ""              , s:tDarkGrey     , ""           )
call s:SetHi ("WarningMsg"    , s:gOrange       , s:gBg           , ""           , s:tOrange       , s:tBg           , ""           )
call s:SetHi ("WildMenu"      , s:gBlue         , s:gBg           , ""           , s:tBlue         , s:tBg           , ""           )
call s:SetHi ("Directory"     , s:gGreen        , s:gBg           , "bold"       , s:tGreen        , s:tBg           , "bold"       )
call s:SetHi ("TabLineFill"   , s:gVeryDarkGrey , s:gBg           , "none"       , s:tVeryDarkGrey , s:tBg           , "none"       )
call s:SetHi ("TabLineSel"    , s:gLightGrey    , s:gBg           , "none"       , s:tLightGrey    , s:tBg           , "none"       )
call s:SetHi ("TabLine"       , s:gGrey         , s:gBg           , "none"       , s:tGrey         , s:tBg           , "none"       )
call s:SetHi ("CursorLineNr"  , s:gBlue         , s:gBg           , "bold"       , s:tBlue         , s:tBg           , "bold"       )
call s:SetHi ("CursorLine"    , ""              , s:gDarkGrey     , ""           , ""              , s:tDarkGrey     , ""           )
call s:SetHi ("CursorColumn"  , ""              , s:gDarkGrey     , ""           , ""              , s:tDarkGrey     , ""           )
call s:SetHi ("ColorColumn"   , ""              , s:gDarkGrey     , ""           , ""              , s:tDarkGrey     , ""           )
call s:SetHi ("LineNr"        , s:gGrey         , s:gBg           , "none"       , s:tGrey         , s:tBg           , "none"       )
call s:SetHi ("NonText"       , s:gRed          , s:gBg           , "none"       , s:tRed          , s:tBg           , "none"       )

" Force dark background
set background=dark
