#!/bin/sh

if [ $# -eq 0 ]; then
  sed -i "s|threads=500|threads=${JOBS}|g" getproxy.py
  sed -i "s|pages=1|pages=${PAGES}|g" getproxy.py
  python getproxy.py | sed -nr 's/(.*):(.*)/\1:\2/p' >> ${DIR}/proxylist.txt
else
  exec "$@"
fi
