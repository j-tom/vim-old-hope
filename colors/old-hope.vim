" Reset colors to default colorscheme {{{
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="old-hope"
" }}}

" Colors {{{
" * GUI
let s:guiWhite            = #FFFFFF
let s:guiVeryLightGrey    = #CBCDD2
let s:guiLightGrey        = #848794
let s:guiGrey             = #686B78
let s:guiDarkGrey         = #45474F
let s:guiVeryDarkGrey     = #1C1D21
let s:guiBlack            = #000000
let s:guiRed              = #EB3D54
let s:guiOrange           = #EF7C2A
let s:guiYellow           = #E5CD52
let s:guiGreen            = #78BD65
let s:guiBlue             = #4FB4D8
" * t_Co 256 (cterm)
let s:tco256White         = 15
let s:tco256VeryLightGrey = 251
let s:tco256LightGrey     = 245 " 244
let s:tco256Grey          = 242
let s:tco256DarkGrey      = 238
let s:tco256VeryDarkGrey  = 234
let s:tco256Black         = 0
let s:tco256Red           = 9   " 196, 160
let s:tco256Orange        = 202
let s:tco256Yellow        = 190 " 184
let s:tco256Green         = 34  " 35
let s:tco256Blue          = 39  " 33, 45
" * t_Co 16
let s:tco16White          = 15
let s:tco16LightGrey      = 7
let s:tco16Grey           = 8
let s:tco16Black          = 0
let s:tco16Red            = 9 " 1
let s:tco16Orange         = 5 " DarkViolet
let s:tco16Yellow         = 11
let s:tco16Green          = 10 " 2
let s:tco16Blue           = 12 " 14
" * t_Co 8
let s:tco8Grey            = 7
let s:tco8Black           = 0
let s:tco8Red             = 1
let s:tco8Orange          = 5 " DarkViolet
let s:tco8Yellow          = 3
let s:tco8Green           = 2
let s:tco8Blue            = 4 " 6
" }}}

" Highlight groups {{{
" * Variable types
hi Boolean         guifg=#e5cc52
hi Number          guifg=#e5cc52
hi Float           guifg=#e5cc52
hi Constant        guifg=#4fb3d8               gui=bold
hi Character       guifg=#4fb3d8
hi String          guifg=#4fb3d8
" * Keyword types
hi Conditional     guifg=#eb3d54               gui=bold
hi Directory       guifg=#78bd65               gui=bold
hi Keyword         guifg=#eb3d54               gui=bold
hi Label           guifg=#e5cc52               gui=none
hi Define          guifg=#4fb3d8
hi Macro           guifg=#4fb3d8               gui=italic
hi SpecialKey      guifg=#4fb3d8               gui=italic
hi Operator        guifg=#eb3d54
hi Function        guifg=#e5cc52
hi Identifier      guifg=#e5cc52
hi PreCondit       guifg=#78bd65               gui=bold
hi PreProc         guifg=#e5cc52
hi Delimiter       guifg=#cbcdd2
hi Statement       guifg=#eb3d54               gui=bold
hi Structure       guifg=#4fb3d8
hi Todo            guifg=#eb3d54 guibg=bg      gui=bold
hi Typedef         guifg=#78bd65
hi Type            guifg=#78bd65               gui=none
" * Cursor
hi Cursor          guifg=#000000 guibg=#e5cc52
hi iCursor         guifg=#000000 guibg=#e5cc52
" * Diff
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#eb3d54 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold
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
hi MatchParen      guifg=#000000 guibg=#e5cc52 gui=bold
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
" * Spellcheck
hi SpellBad    guisp=#eb3d54 gui=undercurl
hi SpellCap    guisp=#78bd65 gui=undercurl
hi SpellLocal  guisp=#4fb3d8 gui=undercurl
hi SpellRare   guisp=#cbcdd2 gui=undercurl

hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#686b78 guibg=#1c1d21
hi StorageClass    guifg=#e5cc52               gui=italic
hi Tag             guifg=#eb3d54               gui=italic
hi Title           guifg=#ef5939


hi VertSplit       guifg=#eb3d54 guibg=#1c1d21 gui=bold
hi VisualNOS                     guibg=#34353D
hi Visual                        guibg=#34353D
hi WarningMsg      guifg=#cbcdd2 guibg=#333333 gui=bold
hi WildMenu        guifg=#4fb3d8 guibg=#000000

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#232526 gui=none


hi Underlined      guifg=#686b78               gui=underline
hi Normal          guifg=#cbcdd2 guibg=#1c1d21
hi Comment         guifg=#686b78
hi CursorLine                    guibg=#28292F
hi CursorLineNr    guifg=#4fb3d8               gui=none
hi CursorColumn                  guibg=#28292F
hi ColorColumn                   guibg=#28292F
hi LineNr          guifg=#686b78 guibg=#1c1d21
hi NonText         guifg=#686b78
hi SpecialKey      guifg=#686b78

set background=dark
