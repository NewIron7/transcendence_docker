#!/bin/sh

su postgres

service postgresql start

service postgresql status

createdb transcendence_db

psql << EOF
ALTER USER postgres PASSWORD 'qwerty123';
\q
EOF

exit

cd /home/ft_transcendence/server

npm install

npx prisma db push

npx prisma db seed -- --environment development
