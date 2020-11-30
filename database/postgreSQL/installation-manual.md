Install Postgress and PGAdmin 4 on MacOS:

$ brew install postgres
$ rm -rf /usr/local/var/postgres
$ postgres -V
$ pg_ctl -D /usr/local/var/postgres start
$ initdb /usr/local/var/postgres
$ rm -r /usr/local/var/postgres