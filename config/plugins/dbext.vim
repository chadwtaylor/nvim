" http://www.jonathansacramento.com/posts/20160122-improve-postgresql-workflow-vim-dbext.html

" Configurations
let g:dbext_default_PGSQL_pgpass = '~/.config/nvim/.pgpass'
" let g:dbext_default_login_script_dir = '~/.config/nvim/dbext_login_scripts'

" Database profiles
let g:dbext_default_profile_local_master = 'type=PGSQL:user=chadwtaylor:host=localhost:dbname=linguabee_api_development:port=5432'
let g:dbext_default_profile_local_master_temp = 'type=PGSQL:user=chadwtaylor:host=localhost:dbname=linguabee_api_temp:port=5432'
let g:dbext_default_profile_local_journal = 'type=PGSQL:user=chadwtaylor:host=localhost:dbname=linguabee_journal_development:port=5432'
let g:dbext_default_profile_heroku_master = 'type=PGSQL:user=u5dthskfj9snfa:host=ec2-52-205-109-108.compute-1.amazonaws.com:dbname=ddidenudvcivj:port=5432'
let g:dbext_default_profile_heroku_journal = 'type=PGSQL:user=u9toktg1g8ht1s:host=ec2-3-82-131-45.compute-1.amazonaws.com:dbname=dflnthoissdd44:port=5432'
let g:dbext_default_profile = 'local_master' " default profile to use

" select * from email_logs limit 100
