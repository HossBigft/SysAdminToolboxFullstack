#! /usr/bin/env sh

# Exit in case of error
set -e
cp ./env ./.env
printf ".env is created\n"
mkdir -p ./ssh_agent/ssh_key

KEY_USER=$(grep STACK_NAME env | cut -d'=' -f2)

ssh-keygen -t ed25519 -C "$KEY_USER" -f ./ssh_agent/ssh_key/priv_ed25519.key  -N ''
printf "Generated new ssh key ./ssh_agent/ssh_key/priv_ed25519.key\n"