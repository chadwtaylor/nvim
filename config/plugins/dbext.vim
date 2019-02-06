"
" http://www.jonathansacramento.com/posts/20160122-improve-postgresql-workflow-vim-dbext.html
"

let g:dbext_default_PGSQL_pgpass = '~/.config/nvim/.pgpass'
let g:dbext_default_login_script_dir = '~/.config/nvim/dbext_login_scripts'
let g:dbext_default_profile_local_psql = 'type=PGSQL:user=chadwtaylor:host=localhost:dbname=linguabee_api_development:port=5432'
let g:dbext_default_profile = 'local_psql'

let g:dbext_default_profile_prod_psql = 'type=PGSQL:user=chadwtaylor:host=https://abc.com:dbname=linguabee_api_development:port=5432'
let g:dbext_default_profile_journal = 'type=PGSQL:user=chadwtaylor:host=https://abc.com:dbname=linguabee_api_development:port=5432'

" select * from customers; 

