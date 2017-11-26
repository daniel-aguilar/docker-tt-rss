FROM debian:stretch-slim

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install \
        cron \
        apache2 \
        git \
        vim \
        php \
        php-xml \
        php-mbstring \
        php-curl \
        php-gd \
        php-pgsql \
        php-intl \
        php-apcu \
        supervisor && \
    git clone --depth 1 https://tt-rss.org/git/tt-rss.git /srv/www/tt-rss && \
    chown -R www-data:www-data /srv/www/tt-rss

COPY supervisor.conf /etc/supervisor/conf.d/tt-rss.conf
COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY crontab /etc/cron.d/tt-rss

VOLUME ["/srv/www/tt-rss"]

EXPOSE 80

ENTRYPOINT ["supervisord"]
