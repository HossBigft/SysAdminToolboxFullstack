#!/bin/bash
docker compose up -d && docker stop $(docker ps -a -q --filter ancestor=backend:latest --format="{{.ID}}") && source backend/.venv/bin/activate && (cd backend && fastapi run 'app/test_local_main.py')
