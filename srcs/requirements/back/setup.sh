#!/bin/sh

su -c 'service postgresql start' postgres

su -c 'createdb transcendence_db' postgres

su -c "psql << EOF
ALTER USER postgres PASSWORD 'qwerty123';
\q
EOF" postgres

cd /home/ft_transcendence/server

npm install

npx prisma db push

npx prisma db seed -- --environment development

exec "$@"
