" Vim color scheme
" Name:         danger.vim
" Author:       Igor Guerrero <igfgt1@gmail.com>
" Version:      0.1

" Distributable under the same terms as Vim itself (see :help license)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "danger"

hi Cursor  guifg=#000000 guibg=#ffb376 gui=NONE
hi Visual  guifg=#000000 guibg=#ffb376 gui=NONE
hi CursorLine  guifg=NONE guibg=#282828 gui=NONE
hi CursorColumn  guifg=NONE guibg=#282828 gui=NONE
hi LineNr  guifg=#515150 guibg=#2b2b2b gui=NONE
hi VertSplit  guifg=#454543 guibg=#454543 gui=NONE
hi MatchParen  guifg=#000000 guibg=#ffb376 gui=NONE
hi StatusLine  guifg=#d8d9d1 guibg=#454543 gui=bold
hi StatusLineNC  guifg=#d8d9d1 guibg=#454543 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#555577 gui=NONE
hi IncSearch  guifg=NONE guibg=#4d4f5e gui=NONE
hi Search  guifg=NONE guibg=#4d4f5e gui=NONE
hi Directory  guifg=#dfca53 guibg=NONE gui=NONE
hi Folded  guifg=#b4df61 guibg=#222222 gui=NONE

hi Normal  guifg=#dcdcd9 guibg=#1e1e1e gui=NONE
hi Boolean  guifg=#edb272 guibg=NONE gui=NONE
hi Character  guifg=#dfca53 guibg=NONE gui=NONE
hi Comment  guifg=#83a347 guibg=NONE gui=italic
hi Conditional  guifg=#a3aad8 guibg=NONE gui=bold
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#a3aad8 guibg=NONE gui=NONE
hi ErrorMsg  guifg=#dfdfd5 guibg=#cc1b27 gui=NONE
hi WarningMsg  guifg=#dfdfd5 guibg=#cc1b27 gui=NONE
hi Float  guifg=#e4d962 guibg=NONE gui=NONE
hi Function  guifg=#dfcc94 guibg=NONE gui=NONE
hi Identifier  guifg=#dbbfed guibg=NONE gui=NONE
hi Keyword  guifg=#a3aad8 guibg=NONE gui=bold
hi Label  guifg=#acc6d7 guibg=NONE gui=NONE
hi NonText  guifg=#e5e5b2 guibg=#1e1e1e gui=NONE
hi Number  guifg=#e4d962 guibg=NONE gui=NONE
hi Operator  guifg=#a3aad8 guibg=NONE gui=NONE
hi PreProc  guifg=#a3aad8 guibg=NONE gui=NONE
hi Special  guifg=#d8d9d1 guibg=NONE gui=NONE
hi SpecialKey  guifg=#e5e5b2 guibg=#282828 gui=NONE
hi Statement  guifg=#dfc346 guibg=NONE gui=bold
hi StorageClass  guifg=#dbbfed guibg=NONE gui=NONE
hi String  guifg=#acc6d7 guibg=#303034 gui=NONE
hi Tag  guifg=NONE guibg=NONE gui=NONE
hi Title  guifg=#d8d9d1 guibg=NONE gui=bold
hi Todo  guifg=#b4df61 guibg=NONE gui=inverse,bold
hi Type  guifg=#b998df guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline

hi pythonStatement  guifg=#a3aad8 guibg=NONE gui=bold
hi pythonStrFormat  guifg=#a3aad8 guibg=NONE gui=italic

hi rubyClass  guifg=#a3aad8 guibg=NONE gui=bold
hi rubyFunction  guifg=#dfcc94 guibg=NONE gui=bold
hi rubyInterpolationDelimiter  guifg=#a1c6d7 guibg=NONE gui=bold
hi rubySymbol  guifg=#dfca53 guibg=NONE gui=bold
hi rubyConstant  guifg=#a9a5d9 guibg=NONE gui=bold
hi rubyStringDelimiter  guifg=#acc6d7 guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#85c6d9 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#7ac0ed guibg=NONE gui=bold
hi rubyInclude  guifg=#a3aad8 guibg=NONE gui=bold
hi rubyGlobalVariable  guifg=#7ac0ed guibg=NONE gui=bold
hi rubyRegexp  guifg=#acc6d7 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#acc6d7 guibg=NONE gui=NONE
hi rubyEscape  guifg=#dfca53 guibg=NONE gui=NONE
hi rubyControl  guifg=#a3aad8 guibg=NONE gui=bold
hi rubyClassVariable  guifg=NONE guibg=NONE gui=bold
hi rubyOperator  guifg=#a3aad8 guibg=NONE gui=bold
hi rubyException  guifg=#a3aad8 guibg=NONE gui=bold
hi rubyPseudoVariable  guifg=#7ac0ed guibg=NONE gui=none
hi rubyRailsUserClass  guifg=#a9a5d9 guibg=NONE gui=italic
hi rubyRailsARAssociationMethod  guifg=#d9c589 guibg=NONE gui=italic
hi rubyRailsARMethod  guifg=#d9c589 guibg=NONE gui=italic
hi rubyRailsRenderMethod  guifg=#d9c589 guibg=NONE gui=italic
hi rubyRailsMethod  guifg=#d9c589 guibg=NONE gui=italic
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#b4df61 guibg=NONE gui=NONE
hi erubyRailsMethod  guifg=#d9c589 guibg=NONE gui=NONE
hi erubyExpression  guifg=#d9c589 guibg=NONE gui=NONE

hi htmlTag  guifg=#a3aad8 guibg=NONE gui=NONE
hi htmlLink  guifg=NONE guibg=NONE gui=bold
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=#dfcc94 guibg=NONE gui=NONE
hi htmlSpecialTagName  guifg=#dfcc94 guibg=NONE gui=NONE
hi htmlArg  guifg=#83a347 guibg=NONE gui=italic
hi htmlSpecialChar  guifg=#dfca53 guibg=NONE gui=NONE

hi javaScriptFunction  guifg=#dbbfed guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#d9c589 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE

hi yamlKey  guifg=NONE guibg=NONE gui=NONE
hi yamlAnchor  guifg=#7ac0ed guibg=NONE gui=NONE
hi yamlAlias  guifg=#7ac0ed guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#acc6d7 guibg=NONE gui=NONE

hi cssURL  guifg=#85c6d9 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#d9c589 guibg=NONE gui=NONE
hi cssColor  guifg=#dfca53 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#e4d962 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=NONE guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
