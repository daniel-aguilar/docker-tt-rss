FROM nginx:1.19-alpine

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar -xzf /tmp/s6-overlay-amd64.tar.gz -C /

RUN set -ex \
	# nginx package creates the www-data group
	&& adduser -u 82 -SDHG www-data www-data \
	&& apk --no-cache add \
		git \
		php7 \
		php7-curl \
		php7-dom \
		php7-fileinfo \
		php7-fpm \
		php7-gd \
		php7-iconv \
		php7-intl \
		php7-json \
		php7-mbstring \
		php7-pcntl \
		php7-pdo_pgsql \
		php7-pgsql \
		php7-posix \
		php7-session \
	&& git clone --depth 1 https://git.tt-rss.org/fox/tt-rss.git /srv/www/tt-rss \
	&& chown -R www-data:www-data /srv/www/tt-rss \
	# Set 'daily' definition to UTC 2:00
	&& sed -ri '/daily$/ s/(^0\t)[0-9]+/\12/' /etc/crontabs/root

ADD rootfs /

VOLUME ["/srv/www/tt-rss"]

EXPOSE 80

ENTRYPOINT ["/init"]
