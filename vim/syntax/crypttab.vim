" Vim syntax file
" Language: crypttab(5) configuration
" Maintainer: Zeppe-Lin Team
" License: GPL-2.0-or-later
" ---------------------------------------------------------------------

if exists("b:current_syntax")
  finish
endif

" Comments: lines starting with #
syntax match crypttabComment /^#.*/ contains=@Spell
highlight link crypttabComment Comment

" Field separators (whitespace)
syntax match crypttabWhitespace /\s\+/ containedin=ALL
highlight link crypttabWhitespace Normal

" Special field values
syntax keyword crypttabSpecial - ASK none SWAP
highlight link crypttabSpecial Constant

" Options keywords (from man page)
syntax keyword crypttabOption cipher c swap tmp noauto size device-size
highlight link crypttabOption Keyword

" Option tags (%tag, %random)
syntax match crypttabTag /%[A-Za-z0-9_-]\+/
highlight link crypttabTag Identifier

" Device specifiers (UUID=..., PARTUUID=..., LABEL=...)
syntax match crypttabDevice /\c\<UUID=[A-F0-9-]\+\>/
syntax match crypttabDevice /\c\<PARTUUID=[A-F0-9-]\+\>/
syntax match crypttabDevice /\<LABEL=[^ \t]\+\>/
highlight link crypttabDevice Type

" Paths (absolute paths)
syntax match crypttabPath /\v\/[A-Za-z0-9._\/-]+/
highlight link crypttabPath String

" Keyfile specifiers
syntax match crypttabKeyfile /\v:[^ \t]+/
highlight link crypttabKeyfile String

" ---------------------------------------------------------------------
let b:current_syntax = "crypttab"
