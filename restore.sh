#!/bin/bash

docker-compose run --rm db \
    tar xpf /backups/$(basename $1) -C /var/lib/postgresql/data
