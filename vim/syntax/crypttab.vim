" Vim syntax file for crypttab
" Language:     crypttab
" Maintainer:   Alexandr Savca <alexandr.savca89@gmail.com>
" Last Change:  March 07, 2025

if exists("b:current_syntax")
  finish
endif

" General Structure:
" <encrypted_name>  <source_device>  <key_file>  <options>

" Define highlighting groups
highlight def link crypttabComment       Comment
highlight def link crypttabVolumeName    Identifier
highlight def link crypttabDevice        Type
highlight def link crypttabKeyfile       String
highlight def link crypttabOption        Keyword
highlight def link crypttabOptionValue   Constant
highlight def link crypttabDeprecated    WarningMsg

" Comments: Lines starting with #
syntax match   crypttabComment     "^#.*$"

" Volume Name: First word on a line, not starting with #, not empty
syntax match   crypttabVolumeName  "^\S\+"                     contained nextgroup=crypttabDevice skipwhite

" Source Device: Second word, after Volume Name
syntax match   crypttabDevice      "\%(\s\+\)\@<=\S\+"       contained nextgroup=crypttabKeyfile skipwhite

" Key File: Third word, after Source Device
syntax match   crypttabKeyfile     "\%(\s\+\)\@<=\S\+"       contained nextgroup=crypttabOptions skipwhite

" Options: Everything after Key File, comma separated or space separated (legacy)
syntax region  crypttabOptions     start="\%(\s\+\)\@<=\S\+"  end="$" contains=crypttabOption,crypttabDeprecated,crypttabOptionValue skipwhite

" Options Keywords (common crypttab options - add more as needed)
syntax keyword crypttabOption      luks plain swap noauto keyfile cipher keyfile-offset keyfile-size allow-discards same-cpu-crypt perf-no_read_workqueue perf-no_write_workqueue
syntax keyword crypttabOption      header segments offset size iv-offset hash pbkdf iterations pbkdf-memory pbkdf-parallel mkswap tmp

" Option Values (after '=') - Basic highlighting, can be improved for specific option value formats
syntax match   crypttabOptionValue   "=\S\+"                    contained

" Deprecated keywords (ASK, SWAP, -options in options field)
syntax keyword crypttabDeprecated  ASK SWAP "-[a-zA-Z0-9-]\+"     contained

" Device paths (basic /dev/* highlighting)
syntax match   crypttabDevice      "/dev/\S\+"                 contained
syntax match   crypttabKeyfile     "/dev/\S\+"                 contained

" UUID, PARTUUID, LABEL (highlight as special identifiers)
syntax match   crypttabDevice      "\(UUID\|PARTUUID\|LABEL\)=\S\+" contained
syntax match   crypttabKeyfile     "\(UUID\|PARTUUID\|LABEL\)=\S\+" contained

let b:current_syntax = "crypttab"

hi link def Constant      String  " Link Constant to String for option values, adjust if needed "

" vim: ts=8 sw=2 sts=2 et ai tw=80
" End of file.
