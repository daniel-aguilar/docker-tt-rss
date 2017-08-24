#!/bin/bash

backups_dir=/var/lib/postgresql
backup_filename=$(basename $1)

docker cp $1 rss_db:$backups_dir/

docker-compose exec db psql\
    --username=postgres\
    --file=$backups_dir/$backup_filename
