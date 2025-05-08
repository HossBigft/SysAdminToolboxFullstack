#!/usr/bin/env sh

# Exit in case of error
set -e

sudo docker compose  -f docker-compose.yml up -d
