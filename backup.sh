docker run \
    -v rss_data:/var/lib/postgresql/data \
    -v $(pwd):/backups \
    --rm postgres:9.5 \
    tar cf /backups/$(date +%Y-%m-%d_%H-%M)-backup.tar -C /var/lib/postgresql/data .
