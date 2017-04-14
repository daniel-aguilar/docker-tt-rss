FROM debian:jessie-slim

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get -y install \
    apache2 \
    php5 \
    php5-curl \
    php5-gd \
    php5-pgsql \
    php5-apcu \
    php5-intl \
    supervisor

RUN mkdir -p /var/lock/apache2 /var/run/apache2

ADD supervisor.conf /etc/supervisor/conf.d/tt-rss.conf
ADD apache.conf /etc/apache2/sites-available/000-default.conf

CMD ["supervisord"]
