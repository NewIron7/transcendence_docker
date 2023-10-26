#!/bin/sh

service postgresql start

su postgres

createdb transcendence_db
