# tt-rss_docker

Here's a [Docker](https://www.docker.com/) multi-container application
I wrote to aid in getting a local installation of [Tiny Tiny
RSS](https://tt-rss.org/) quickly, after formatting my computer or
switching environments.

## Features

* Automatically updated feeds
* Full access to the TT-RSS directory:

    * Install themes and plugins
    * Edit `config.php`
    * Perform updates (`git pull`)

    ...like you normally would.

* Backups made simple

## Requirements

* [Docker Compose](https://docs.docker.com/compose/)

## First Time Set Up

1. Clone this repository an run the installation script:

    `./install.sh`

2. Visit http://localhost to run the TT-RSS installer.

    Database settings are the following:

    * Database type: PostgreSQL
    * Username: postgres
    * Password: postgres
    * Database name: postgres
    * Host name: db
    * Port: 5432

3. Restart the services:

    `docker-compose restart`

You're done, you can now visit http://localhost again and start reading
your favorite feeds. Enjoy!

## Everyday Use

1. Run `docker-compose start` to start the services
2. Run `docker-compose stop` to stop the services

## Backups

Make sure the services are stopped, then:

1. Run `backup.sh` to generate a backup file (stored in a `backups` directory)
2. Run `restore.sh <backup.tar>`  to restore `backup.tar`

## Feedback & Contribution

This is a very experimental way of running TT-RSS tailored for my
preferences, but any feedback/contribution is greatly appreciated.
