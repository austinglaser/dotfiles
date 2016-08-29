" Provides extra :Tabularize commands

if !exists(':Tabularize')
    finish " No Tabularize plugin
endif

" Use linewrapping
let s:save_cpo = &cpo
set cpo&vim

"Custom patterns
AddTabularPattern!   space_after_comma /,\zs /l0l0l0
AddTabularPattern!   space_after_first_comma /^[^,]*,\zs /l0l0l0
AddTabularPattern!   space_after_scolon /\;\zs /l0l0l0
AddTabularPattern!   space_after_first_scolon /^[^;]*\;\zs /l0l0l0
AddTabularPattern!   latex_table /&\|\\\\\(\s*\(\\hline\|\\cline{[0-9]\+-[0-9]\+}\)\)\?/

" Restore old settings
let &cpo = s:save_cpo
unlet s:save_cpo
