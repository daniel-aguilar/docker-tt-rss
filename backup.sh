#!/bin/bash

docker-compose exec db pg_dump --username=postgres postgres > backups/`date +%Y-%m-%d_%H-%M`.sql
