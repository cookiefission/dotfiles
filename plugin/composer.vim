if exists('loaded_composer') || &cp || version < 700
  finish
endif
let loaded_composer = 1

command ComposerJson call composer#OpenComposerJson()
command ComposerUpdate call composer#ComposerUpdate()
command ComposerInstall call composer#ComposerInstall()
command ComposerShowInstalled call composer#ShowInstalledLibraries()

function! composer#OpenComposerJson()
  tabe composer.json
endfunction

function! composer#ComposerUpdate()
  !composer update
endfunction

function! composer#ComposerInstall()
  !composer install
endfunction

function! composer#ShowInstalledLibraries()
  !composer show --installed
endfunction
