#!/usr/bin/env sh

# Exit in case of error
set -e
. "$(dirname "$0")/load_dotenv.sh"

# Enable debug with DEBUG=1 ./deploy.sh
load_dotenv

# Check required variables
DOMAIN=${DOMAIN?Variable not set} \
STACK_NAME=${STACK_NAME?Variable not set} \
TAG=${TAG=-latest} \
docker compose \
    -f docker-compose.yml \
    config > docker-stack.yml

docker-auto-labels docker-stack.yml

docker stack deploy -c docker-stack.yml --with-registry-auth "${STACK_NAME?Variable not set}"
