
" run linters only after file is saved, not continously 
" let g:ale_lint_on_text_changed = 'never'

" prevent linter to run when file opens
" let g:ale_lint_on_enter = 0

let g:ale_linters = {
  \ 'ruby': ['brakeman', 'rails_best_practices', 'reek', 'rubocop', 'ruby', 'solargraph', 'standardrb'], 
  \ }
