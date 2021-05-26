FROM nginx:1.20-alpine

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz /tmp/
RUN tar -xzf /tmp/s6-overlay-amd64.tar.gz -C /
ENV S6_KEEP_ENV=1

RUN set -ex \
	# nginx package creates the www-data group
	&& adduser -u 82 -SDHG www-data www-data \
	&& apk --no-cache add \
		git \
		php8 \
		php8-curl \
		php8-dom \
		php8-exif \
		php8-fileinfo \
		php8-fpm \
		php8-gd \
		php8-iconv \
		php8-intl \
		php8-json \
		php8-mbstring \
		php8-pcntl \
		php8-pdo_pgsql \
		php8-pgsql \
		php8-posix \
		php8-session \
		php8-xml \
		php8-zip \
	&& git config --global pull.rebase false \
	&& git clone --depth 1 https://git.tt-rss.org/fox/tt-rss.git /srv/www/tt-rss \
	&& chown -R www-data:www-data /srv/www/tt-rss \
	# Set 'daily' definition to UTC 2:00
	&& sed -ri '/daily$/ s/(^0\t)[0-9]+/\12/' /etc/crontabs/root

ENV TTRSS_PHP_EXECUTABLE=/usr/bin/php8

COPY rootfs /

VOLUME ["/srv/www/tt-rss"]

EXPOSE 80

ENTRYPOINT ["/init"]
