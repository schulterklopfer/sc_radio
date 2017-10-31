#!/bin/bash
set -e

if [[ "$1" == "stream"  ]]; then
	/usr/bin/icecast2 -c /etc/icecast2/icecast.xml &
	/usr/bin/jackd -r -ddummy -r44100 &
	/usr/bin/darkice &
	sleep 5 # wait for the stuff above to finish
	/usr/bin/xvfb-run -a /usr/bin/sclang /radio.sc
fi

exec "$@"