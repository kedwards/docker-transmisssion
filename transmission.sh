#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
# enable interruption signal handling
trap - INT TERM
docker container run --rm   --name transmission   -t $(tty &>/dev/null && echo "-i")   -p 8080:8080   -p 64388:64388   -v "/home/kedwards/Dev/docker-transmission/Torrents:/Torrents"   kedwards/transmission:0.2.0   "$@"
