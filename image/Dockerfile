FROM debian:9

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --assume-yes install \
        sudo \
        procps \
        supervisor \
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
        php-apcu && \
    git clone --depth 1 https://tt-rss.org/git/tt-rss.git /srv/www/tt-rss && \
    chown -R www-data:www-data /srv/www/tt-rss

COPY supervisor.conf /etc/supervisor/conf.d/tt-rss.conf
COPY cron/update.sh /root/
COPY cron/crontab /etc/cron.d/tt-rss
COPY apache.conf /etc/apache2/sites-available/000-default.conf

VOLUME ["/srv/www/tt-rss"]

EXPOSE 80

ENTRYPOINT ["supervisord"]
