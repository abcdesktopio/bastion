#!/bin/sh
# $1 est le nom de l'utilisateur transmis par sshd (%u)

USER="$1"
echo "Received request for user: $USER" >&2

curl -s "http://pyos:8000/API/auth/authorizedkeys"


