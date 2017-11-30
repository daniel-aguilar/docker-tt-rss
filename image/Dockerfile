FROM debian:9

ENV TTRSS_SRC=/usr/src/tt-rss \
    TTRSS_DIR=/srv/www/tt-rss

WORKDIR $TTRSS_SRC
COPY files .

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get --assume-yes install \
        sudo \
        vim \
        git \
        supervisor \
        cron \
        apache2 \
        php \
        php-xml \
        php-mbstring \
        php-curl \
        php-gd \
        php-pgsql \
        php-intl \
        php-apcu && \
    git clone --depth 1 https://tt-rss.org/git/tt-rss.git $TTRSS_DIR && \
    chown -R www-data:www-data $TTRSS_DIR && \
    ln -s $TTRSS_DIR/update_daemon2.php /usr/local/bin/

RUN chmod 644 supervisor.conf apache.conf cron/crontab && \
    cp supervisor.conf /etc/supervisor/conf.d/tt-rss.conf && \
    cp apache.conf /etc/apache2/sites-available/000-default.conf && \
    cp cron/crontab /etc/cron.d/tt-rss && \
    ln -s $TTRSS_SRC/cron/update /usr/local/bin/

VOLUME $TTRSS_DIR

EXPOSE 80

ENTRYPOINT ["supervisord"]
