#! /usr/bin/env sh

# Exit in case of error
set -e

SCRIPT_PATH="$0"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

generate_password() {
    length=$1
    # Define the character set for the password
    char_set="A-Za-z0-9!@#$%^&*()-_=+[]{}|;:,.<>?"

    # Generate a random password using the specified length
    tr -dc "$char_set" </dev/urandom | head -c "$length"
    echo
}

setup_traefik(){
    mkdir -p "../$PROJECT_ROOT/traefik"

    ln docker-compose.traefik.yml "../$PROJECT_ROOT/traefik/docker-compose.yml"
    touch "../$PROJECT_ROOT/traefik/.env"
    PASSWORD=$(generate_password 15)
    printf "Traefik dashboard password is %s\n" "$PASSWORD"
    HASHED_PASSWORD=$(openssl passwd -apr1 "$PASSWORD")

        cat > "$PROJECT_ROOT/traefik/.env" <<EOF
USERNAME=admin
HASHED_PASSWORD=$HASHED_PASSWORD
DOMAIN=$DOMAIN
EMAIL=admin@$DOMAIN
EOF
}

create_env(){
cp ./env ./.env
printf ".env is created\n"
}

generate_backend_ssh_key(){
mkdir -p ./ssh_agent/ssh_key

KEY_USER=$(grep STACK_NAME env | cut -d'=' -f2)

ssh-keygen -t ed25519 -C "$KEY_USER" -f ./ssh_agent/ssh_key/priv_ed25519.key  -N ''
printf "Generated new ssh key ./ssh_agent/ssh_key/priv_ed25519.key\n"
}

main(){
    create_env
    setup_traefik
    generate_backend_ssh_key
}