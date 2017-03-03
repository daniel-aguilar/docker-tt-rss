bk_file=$1
docker run \
    -v rss_data:/var/lib/postgresql/data \
    -v $(pwd):/backups \
    --rm postgres:9.5 \
    tar xpf /backups/$bk_file -C /var/lib/postgresql/data
