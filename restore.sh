bk_file=$1
docker-compose run \
    --rm db \
    tar xpf /backups/$(basename $bk_file) -C /var/lib/postgresql/data
