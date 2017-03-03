# tt-rss_docker

Here's a [Tiny Tiny RSS][tt-rss] multi-container [Docker][docker]
application that I wrote so I could get the service up and running
locally after formatting my computer or switching environments.

I made it so I can clone `tt-rss` in the host, and mount it as a volume
inside the web server container, giving me full access to the
repository, meaning I can: install plugins/themes, change `config.php`
and, `git pull` fast and easy.

The web server image consists of [Debian][debian] with [Apache][apache],
[PHP][php] and [Supervisor][supervisor] installed.

For the database, I use an official [PostgreSQL image][postgres] with
a volume mounted at `/var/lib/postgresql/data` (PostgreSQL default data
directory) so the data persists even if the container is removed.

I also added two helpful scripts to generate database backups and also
restore them.

Finally, the ports `80`, `5432` and, `9001` are forwarded to the host to
access the web server, database server and `supervisord`'s web front-end
respectively.

## First Time Set Up

You'll only need to do this once.

1. Clone this repository and `tt-rss`'s inside it:

    ```bash
    git clone https://github.com/daniel-aguilar/tt-rss_docker.git && cd tt-rss_docker && git clone https://tt-rss.org/git/tt-rss.git tt-rss
    ```

2. Edit `docker-compose.yaml` to set up your preferred PostgreSQL credentials.
3. Build the web server image and bring up the services:

    `docker-compose -p rss up -d`

    Please use the `-p` option to set the project name as `rss`, so that
    the volume and network names can be correctly prefixed.

4. Visit `localhost:80` and run the installer.

    The database name is the same as the user name. The database
    hostname is `db`, using port `5432`.

5. Visit `localhost:9001` and start the feed_updater daemon.

That's it!

## Everyday Use

Run `docker-compose -p rss start` inside the `tt-rss_docker` directory (this
repo) to start the services. Feeds should be automatically updated.

Run `docker-compose -p rss stop` inside the `tt-rss_docker` directory (this
repo) to stop the services.

## Backups and Restoration

Run the `backup.sh` script inside the `tt-rss_docker` directory (this repo) to
generate a tarball.

Run the `restore.sh <backup.tar>` script inside the `tt-rss_docker` directory
(this repo) to extract `backup.tar` and store it in a named volume `rss_data`.

## Feedback & Contribution

This is a very experimental way of running `tt-rss` tailored for my
preferences, but any feedback/contribution is greatly appreciated.

[tt-rss]: https://tt-rss.org/
[docker]: https://www.docker.com/
[docker-compose]: https://docs.docker.com/compose/
[debian]: https://hub.docker.com/_/debian/
[apache]: https://httpd.apache.org/
[php]: http://php.net/
[supervisor]: http://supervisord.org/
[postgres]: https://hub.docker.com/_/postgres/
