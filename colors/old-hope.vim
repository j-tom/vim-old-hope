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
call s:SetHi("Normal"    , s:gVeryLightGrey, s:gBlack, "none"     , s:tVeryLightGrey, s:tBlack, "none")
call s:SetHi("Underlined", s:gVeryLightGrey, s:gBlack, "underline", s:tVeryLightGrey, s:tBlack, "underline")
" * Variable types
call s:SetHi("Number", s:gOrange, s:gBlack, "none", s:tOrange, s:tBlack, "none")
call s:SetHi("Float", s:gOrange, s:gBlack, "none", s:tOrange, s:tBlack, "none")
call s:SetHi("Constant", s:gOrange, s:gBlack, "bold", s:tOrange, s:tBlack, "bold")
call s:SetHi("Boolean", s:gYellow, s:gBlack, "italic", s:tYellow, s:tBlack, "italic")
call s:SetHi("String", s:gGreen, s:gBlack, "italic", s:tGreen, s:tBlack, "italic")
call s:SetHi("Character", s:gGreen, s:gBlack, "italic", s:tGreen, s:tBlack, "italic")
" * Keyword types
hi Conditional     guifg=#eb3d54               gui=bold
hi Keyword         guifg=#eb3d54               gui=bold
hi Operator        guifg=#eb3d54
hi Statement       guifg=#eb3d54               gui=bold
hi Directory       guifg=#78bd65               gui=bold
hi Label           guifg=#e5cc52               gui=none
hi Define          guifg=#4fb3d8
hi Macro           guifg=#4fb3d8               gui=italic
hi SpecialKey      guifg=#4fb3d8               gui=italic
hi Function        guifg=#e5cc52
hi Identifier      guifg=#e5cc52
hi PreCondit       guifg=#78bd65               gui=bold
hi PreProc         guifg=#e5cc52
hi Delimiter       guifg=#cbcdd2
hi Structure       guifg=#4fb3d8
hi Todo            guifg=#eb3d54 guibg=bg      gui=bold
hi Typedef         guifg=#78bd65
hi Type            guifg=#78bd65               gui=none
hi Comment         guifg=#686b78
" * Cursor
call s:SetHi("Cursor" , s:gBlack, s:gWhite, "none", s:tBlack, s:tWhite, "none")
call s:SetHi("iCursor", s:gBlack, s:gWhite, "none", s:tBlack, s:tWhite, "none")
" * Diff
call s:SetHi("DiffAdd", s:gBlack, s:gGreen, "none", s:tBlack, s:tGreen, "none")
call s:SetHi("DiffChange", s:gBlack, s:gYellow, "none", s:tBlack, s:tYellow, "none")
call s:SetHi("DiffDelete", s:gBlack, s:gRed, "none", s:tBlack, s:tRed, "none")
call s:SetHi("DiffText", "", s:gGrey, "italic,bold", "", s:tGrey, "italic,bold")
" * Errors
hi Debug           guifg=#BCA3A3               gui=bold
hi Error           guifg=#e5cc52 guibg=#1E0010
hi ErrorMsg        guifg=#eb3d54 guibg=#232526 gui=bold
hi Exception       guifg=#78bd65               gui=bold
" * Folding
hi FoldColumn      guifg=#686b78 guibg=#000000
hi Folded          guifg=#686b78 guibg=#000000
" * Searching
hi IncSearch       guifg=#78bd65 guibg=#000000
hi Search          guifg=#000000 guibg=#4fb3d8
" * Other
hi Ignore          guifg=#686b78 guibg=bg
call s:SetHi("MatchParen", s:gYellow, s:gBlack, "bold", s:tYellow, s:tBlack, "bold")
hi ModeMsg         guifg=#e5cc52
hi MoreMsg         guifg=#e5cc52
hi Question        guifg=#4fb3d8
hi Repeat          guifg=#eb3d54               gui=bold
" * Complete menu
hi Pmenu           guifg=#4fb3d8 guibg=#000000
hi PmenuSel        guifg=#000000 guibg=#e5cc52
hi PmenuSbar                     guibg=#1c1d21
hi PmenuThumb      guifg=#4fb3d8
" * Marks
hi SignColumn      guifg=#78bd65 guibg=#232526
hi SpecialChar     guifg=#eb3d54               gui=bold
hi SpecialComment  guifg=#7E8E91               gui=bold
hi Special         guifg=#4fb3d8 guibg=bg      gui=italic
" GUI
call s:SetHi("StatusLine", s:gBlue, s:gBlack, "none", s:tGreen, s:tBlack, "none")
call s:SetHi("StatusLineNC", s:gDarkGrey, s:gBlack, "none", s:tDarkGrey, s:tBlack, "none")
call s:SetHi("StorageClass", s:gYellow, "", "italic", s:tYellow, "", "italic")
call s:SetHi("Tag", "", "", "underline", "", "", "underline")
call s:SetHi("Title", s:gOrange, "", "none", s:tOrange, "", "none")
call s:SetHi("VertSplit", s:gRed, s:gBlack, "bold", s:tRed, s:tBlack, "bold")
call s:SetHi("VisualNOS", "", s:gVeryDarkGrey, "", "", s:tVeryDarkGrey, "")
call s:SetHi("Visual", "", s:gVeryDarkGrey, "", "", s:tVeryDarkGrey, "")
call s:SetHi("WarningMsg", s:gOrange, s:gBlack, "", s:tOrange, s:tBlack, "")
call s:SetHi("WildMenu", s:gBlue, s:gBlack, "", s:tBlue, s:tBlack, "")
call s:SetHi("TabLineFill", s:gBlack, s:gBlack       , "none", s:tBlack, s:tBlack  , "none")
call s:SetHi("TabLineSel", s:gLightGrey, s:gBlack       , "none", s:tLightGrey, s:tBlack  , "none")
call s:SetHi("TabLine", s:gGrey, s:gBlack       , "none", s:tGrey, s:tBlack  , "none")
call s:SetHi("CursorLineNr", s:gBlue, s:gBlack       , "bold", s:tBlue, s:tBlack       , "bold")
call s:SetHi("CursorLine"  , ""     , s:gVeryDarkGrey, ""    , ""     , s:tVeryDarkGrey, "")
call s:SetHi("CursorColumn", ""     , s:gVeryDarkGrey, ""    , ""     , s:tVeryDarkGrey, "")
call s:SetHi("ColorColumn" , ""     , s:gVeryDarkGrey, ""    , ""     , s:tVeryDarkGrey, "")
call s:SetHi("LineNr"      , s:gGrey, s:gBlack       , "none", s:tGrey, s:tBlack       , "none")
call s:SetHi("NonText"     , s:gRed, s:gBlack       , "none", s:tRed, s:tBlack       , "none")
call s:SetHi("SpecialKey"     , s:gRed, s:gBlack       , "none", s:tRed, s:tBlack       , "none")

" Force dark background
set background=dark
