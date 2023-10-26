#!/bin/sh

service postgresql start

service postgresql status

su postgres

createdb transcendence_db

psql << EOF
ALTER USER postgres PASSWORD 'qwerty123';
\q
EOF

