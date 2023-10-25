#!/bin/sh

cd /home/ft_transcendence/server

npm install

cd /

service postgresql start

su postgres

createdb transcendence_db
