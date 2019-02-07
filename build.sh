#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

SCRIPT_DIR=$(dirname $(readlink -f "$0"))
IMAGE_VERSION=0.2.0

docker build ${SCRIPT_DIR} --no-cache -t kedwards/transmission:${IMAGE_VERSION}

cat > ${SCRIPT_DIR}/transmission.sh <<EOF
#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
# enable interruption signal handling
trap - INT TERM
docker container run --rm \
  --name transmission \
  -t \$(tty &>/dev/null && echo "-i") \
  -p 8080:8080 \
  -p 64388:64388 \
  -v "$(pwd)/Torrents:/Torrents" \
  kedwards/transmission:${IMAGE_VERSION} \
  "\$@"
EOF

chmod +x ${SCRIPT_DIR}/transmission.sh
