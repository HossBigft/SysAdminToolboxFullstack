# ssh-agent/Dockerfile
FROM alpine:latest

RUN apk add --no-cache openssh

# Define the agent socket path
ENV SSH_AUTH_SOCK=/ssh/agent.sock

# Define a volume to store the socket
VOLUME ["/ssh"]

# Default command is to start ssh-agent and then sleep (to keep the container running)
CMD ["sh", "-c", "ssh-agent -a /ssh/agent.sock && tail -f /dev/null"]