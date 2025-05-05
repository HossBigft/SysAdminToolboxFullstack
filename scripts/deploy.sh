#!/usr/bin/env sh

# Exit in case of error
set -e
. "$(dirname "$0")/load_dotenv.sh"

# Enable debug with DEBUG=1 ./deploy.sh
load_dotenv

# Check required variables
STACK_NAME=${STACK_NAME?Variable not set} \
docker compose  -f docker-compose.yml  -p "$STACK_NAME" up -d
