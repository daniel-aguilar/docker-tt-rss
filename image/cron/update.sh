#!/bin/bash

sudo -u www-data git -C /srv/www/tt-rss pull
supervisorctl restart web_server feed_updater
