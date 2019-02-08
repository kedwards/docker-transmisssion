#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
# enable interruption signal handling
trap - INT TERM
docker container run --rm -itd --name transmission -p 8080:8080 -p 64388:64388 -v "/home/kedwards/Torrents:/Torrents" kevinedwards/transmission:0.2.0 "$@"
