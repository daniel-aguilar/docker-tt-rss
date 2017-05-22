git clone https://tt-rss.org/git/tt-rss.git tt-rss

if grep -q '^www-data' /etc/group; then
    echo 'Changing tt-rss group to www-data...'
    sudo chgrp -R www-data tt-rss
else
    chmod o+w tt-rss
    chmod -R 777 tt-rss/cache/images
    chmod -R 777 tt-rss/cache/upload
    chmod -R 777 tt-rss/cache/export
    chmod -R 777 tt-rss/cache/js
    chmod -R 777 tt-rss/feed-icons
    chmod -R 777 tt-rss/lock
fi

mkdir backups

docker-compose up -d
