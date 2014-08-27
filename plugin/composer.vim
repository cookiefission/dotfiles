if exists("loaded_composer")
  finish
endif
let loaded_composer = 1

command ComposerJson call composer#OpenComposerJson()
command ComposerInstalled call composer#ShowInstalledLibraries()

function! composer#OpenComposerJson()
  tabe composer.json
endfunction

function! composer#ShowInstalledLibraries()
  !composer show --installed
endfunction
