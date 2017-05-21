# tt-rss_docker

Here's a [Docker](https://www.docker.com/) multi-container application
I wrote to aid in getting a local installation of [Tiny Tiny
RSS](https://tt-rss.org/) quickly, after formatting my computer or
switching environments.

## Features

* Automatically updated feeds
* Full access to the `tt-rss` directory:

    * Install themes and plugins
    * Edit `config.php`
    * Perform updates (`git pull`)

    ...like you normally would.

* Backups and restorations made simple

## Requirements

* [Docker Compose](https://docs.docker.com/compose/)

## First Time Set Up

You only need to do this once.

1. Clone this repository and `tt-rss`'s inside it:

    ```bash
    git clone https://github.com/daniel-aguilar/tt-rss_docker.git
    cd tt-rss_docker
    git clone https://tt-rss.org/git/tt-rss.git tt-rss
    ```

2. *Optional:* Create a user `www-data` and set it as `tt-rss`'s group:

    `chgrp -R www-data tt-rss`

    Otherwise just give others `rwx` permission on `tt-rss`:

    `chmod -R 777 tt-rss`

    This is so the web server can have the correct permissions on that
    directory.

3. Build the web server image and bring up the services:

    `docker-compose up -d`

4. Visit http://localhost and run the installer.

    Database settings are the following:

    * Database type: PostgreSQL
    * Username: postgres
    * Password: postgres
    * Database name: postgres
    * Host name: db
    * Port: 5432

5. Restart the services:

    `docker-compose restart`

You're done, you can now visit http://localhost again and start reading
your favorite feeds. Enjoy!

## Everyday Use

1. Run `docker-compose start` to start the services
2. Run `docker-compose stop` to stop the services

## Backups and Restoration

Make sure the services are stopped, then:

1. Run `backup.sh` to generate a backup file (stored in a `backups` directory)
2. Run `restore.sh <backup.tar>`  to restore `backup.tar`

## Feedback & Contribution

This is a very experimental way of running `tt-rss` tailored for my
preferences, but any feedback/contribution is greatly appreciated.
