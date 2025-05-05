#!/usr/bin/env sh

# Exit on error
set -e

SCRIPT_PATH="$0"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TRAEFIK_DIR="../$PROJECT_ROOT/traefik"
log() {
    level="$1"
    shift
    echo "[$level] $*"
}

generate_password() {
    length=$1
    char_set="A-Za-z0-9!@#$%^&*()-_=+[]{}|;:,.<>?"
    tr -dc "$char_set" </dev/urandom | head -c "$length"
    echo
}

setup_traefik() {
    log INFO "Setting up Traefik reverse proxy in $TRAEFIK_DIR"
    mkdir -p "$TRAEFIK_DIR"
    ln -sf "$SCRIPT_DIR/docker-compose.traefik.yml" "$TRAEFIK_DIR"
    touch "$PROJECT_ROOT/traefik/.env"

    PASSWORD=$(generate_password 15)
    log INFO "Generated Traefik dashboard password: $PASSWORD"

    HASHED_PASSWORD=$(openssl passwd -apr1 "$PASSWORD")

    cat > "$PROJECT_ROOT/traefik/.env" <<EOF
USERNAME=admin
HASHED_PASSWORD=$HASHED_PASSWORD
DOMAIN=$DOMAIN
EMAIL=admin@$DOMAIN
EOF

    log INFO "Traefik .env file created"
}

create_env() {
    log INFO "Creating .env file..."
    cp ./env ./.env
    log INFO ".env file created"
}

generate_backend_ssh_key() {
    log INFO "Generating backend SSH key..."
    mkdir -p ./ssh_agent/ssh_key

    KEY_USER=$(grep STACK_NAME env | cut -d'=' -f2)

    ssh-keygen -t ed25519 -C "$KEY_USER" -f ./ssh_agent/ssh_key/priv_ed25519.key -N ''
    log INFO "SSH key generated at ./ssh_agent/ssh_key/priv_ed25519.key"
}

main() {
    log INFO "Initializing environment..."
    create_env
    setup_traefik
    generate_backend_ssh_key
    log INFO "Initialization complete."
}

main
