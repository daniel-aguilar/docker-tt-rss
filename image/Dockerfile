FROM nginx:1.14-alpine

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz /tmp/
RUN set -x \
	&& tar -xzf /tmp/s6-overlay-amd64.tar.gz -C / \
	&& addgroup -g 82 -S www-data \
	&& adduser -u 82 -D -S -G www-data www-data

RUN set -ex \
	&& apk --no-cache add \
		git \
		php7 \
		php7-fpm \
		php7-curl \
		php7-mbstring \
		php7-fileinfo \
		php7-curl \
		php7-posix \
		php7-json \
		php7-gd \
		php7-pgsql \
		php7-pdo_pgsql \
		php7-dom \
		php7-iconv \
		php7-intl \
		php7-pcntl \
		php7-session \
	&& git clone --depth 1 https://tt-rss.org/git/tt-rss.git /srv/www/tt-rss \
	&& chown -R www-data:www-data /srv/www/tt-rss \
	# Set 'daily' definition to UTC 2:00
	&& sed -ri '/daily$/ { s/(^0\t)[0-9]+/\12/ }' /etc/crontabs/root \
	&& sed -ri 's/^(user = ).*/\1www-data/' /etc/php7/php-fpm.d/www.conf \
	&& sed -ri 's/^(group = ).*/\1www-data/' /etc/php7/php-fpm.d/www.conf

ADD rootfs /

VOLUME ["/srv/www/tt-rss"]

EXPOSE 80

ENTRYPOINT ["/init"]
