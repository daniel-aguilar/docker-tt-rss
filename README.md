# tt-rss_docker

Here's a [Docker](https://www.docker.com/) multi-container application to setup
an instance of [Tiny Tiny RSS](https://tt-rss.org/) locally, as quickly and
simple as possible.

## Requirements

* [Docker Compose](https://docs.docker.com/compose/)

## First Time Set Up

1. Build, create, and start the containers (in the background):

    `docker-compose up -d`

2. Visit http://localhost to run the TT-RSS installer.

    Database settings are the following:

    - Database type: PostgreSQL
    - Username: postgres
    - Password: postgres
    - Database name: postgres
    - Host name: db
    - Port: 5432

3. Restart the services:

    `docker-compose restart`

You're done, you can start reading your favorite feeds now. Enjoy!

## Everyday Use

The services are configured to continually run (even on a system restart)
unless manually stopped:

1. Run `docker-compose start` to start the services
2. Run `docker-compose stop` to stop the services

## Backups

1. Run `backup.sh` to generate a dump file (stored in a `backups` directory)
2. Run `restore.sh <backup.sql>` to restore `backup.sql`

## Feedback & Contribution

This is a very experimental way of running TT-RSS tailored for my preferences,
but any feedback/contribution is greatly appreciated.
