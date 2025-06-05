#!/bin/bash
# Get a list of unhealthy containers
unhealthy_containers=$(docker ps -q -f health=unhealthy)
# Loop through the unhealthy containers and restart them
for container_id in $unhealthy_containers; do
  container_name=$(docker inspect --format='{{.Name}}' "$container_id" | cut -c2-) 
  echo "[$(date)] Restarting unhealthy container: $container_name ($container_id)"
  docker restart "$container_id"
done