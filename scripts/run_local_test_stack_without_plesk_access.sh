#!/bin/bash
docker compose up -d && docker stop $(docker ps -a -q --filter ancestor=backend:latest --format="{{.ID}}") && source backend/.venv/bin/activate && (cd backend && fastapi run 'app/run_local_stack_without_plesk_access.py')
