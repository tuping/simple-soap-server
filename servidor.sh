#/usr/bin/env bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo "${SCRIPTPATH}"
while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; ${SCRIPTPATH}/soap.sh;  } | sudo nc -l 80; done
