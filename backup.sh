docker-compose -p rss run \
    --rm db \
    tar cf /backups/$(date +%Y-%m-%d_%H-%M).tar -C /var/lib/postgresql/data .
