#!/bin/bash

backups_dir=/var/lib/postgresql
backup_filename=$(date +%Y-%m-%d_%H-%M).sql

docker-compose exec db pg_dump\
    --username=postgres\
    --file=$backups_dir/$backup_filename\
    postgres

mkdir -p backups
docker cp rss_db:$backups_dir/$backup_filename backups/
