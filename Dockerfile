FROM debian:jessie-slim

RUN apt-get update && apt-get install -y \
    apache2 \
    php5 \
    php5-curl \
    php5-gd \
    php5-pgsql \
    php5-apcu \
    php5-intl \
    supervisor

RUN mkdir -p /var/lock/apache2 /var/run/apache2
RUN mkdir -p /srv/www/tt-rss && chown -R www-data:www-data /srv/www/tt-rss/

ADD supervisor.conf /etc/supervisor/conf.d/tt-rss.conf
ADD apache.conf /etc/apache2/sites-available/000-default.conf

CMD ["supervisord"]
