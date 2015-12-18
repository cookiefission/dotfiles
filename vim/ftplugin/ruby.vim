let g:switch_custom_definitions =
  \ [
  \   ['extend', 'include'],
  \   {
  \     '\(\s*\%(RSpec\.\)*\)\(describe\|context\|it\) \(.\+\) do': '\1\2 \3, focus: true do',
  \     '\(\s*\%(RSpec\.\)*\)\(describe\|context\|it\) \(.\+\), focus: true do': '\1\2 \3 do'
  \   }
  \]