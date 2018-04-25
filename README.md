Reading SQL Antipatterns
=======================================

Code sample, note, script and configuration I've developed during reading the
book [SQL Antipatterns by Bill Karwin](https://pragprog.com/book/bksqla/sql-antipatterns)


Tool
----

- Docker: spaw throwaway Postgres container
- Pgcli
- Dbeaver: for viewing diagrams and write complex queries


Vim config for writing SQL
--------------------------

```viml
" Auto format SQL, with https://github.com/Chiel92/vim-autoformat
" and https://github.com/darold/pgFormatter
let g:formatdef_pg_format = '"pg_format --spaces 2"'
let g:formatters_sql = ['pg_format']

au BufWrite *.sql :Autoformat
```
