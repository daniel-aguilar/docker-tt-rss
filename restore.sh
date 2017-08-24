#!/bin/bash

docker-compose exec db psql --username=postgres --file=/backups/$(basename $1)
