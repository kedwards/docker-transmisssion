#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
IMAGE_VERSION=0.2.0

docker build --no-cache -t kevinedwards/transmission:${IMAGE_VERSION} ${SCRIPT_DIR}

cat > ${SCRIPT_DIR}/transmission.sh <<EOF
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

docker container run --rm -itd \
--name transmission \
-p 8080:8080 \
-p 64388:64388 \
-v "/home/${USER}/Torrents:/Torrents" \
kevinedwards/transmission:latest \
"\$@"
EOF

docker image tag kevinedwards/transmission:${IMAGE_VERSION} kevinedwards/atom:latest

chmod +x ${SCRIPT_DIR}/transmission.sh
