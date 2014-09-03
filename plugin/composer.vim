if exists('loaded_composer') || &cp || version < 700
  finish
endif
let loaded_composer = 1

" command! -nargs=1 MyCommand call s:MyFunc(<f-args>)
command! ComposerJson call composer#OpenComposerJson()
command! ComposerUpdate call composer#ComposerUpdate()
command! ComposerInstall call composer#ComposerInstall()
command! ComposerShowInstalled call composer#ShowInstalledLibraries()

function! composer#OpenComposerJson()
  tabe composer.json
endfunction

function! composer#ComposerUpdate()
  !composer update
endfunction

function! composer#ComposerInstall()
  !composer install
endfunction

function! composer#ShowInstalledLibraries(...)
  " s:defaultCmd = 'composer show --installed'
  " s:filterTerm = a:0 > 0 ? ' | grep ' + a:1 : ''
  " silent! cexpr system(s:defaultCmd + s:filterTerm) | copen
  silent! cexpr system('composer show --installed') | copen
endfunction
