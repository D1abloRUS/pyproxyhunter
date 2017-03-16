#!/bin/sh

if [ $# -eq 0 ]; then
  sed -i "s|threads=500|threads=${TREADS}|g" pyproxyhunter.py
  sed -i "s|pages=1|pages=${PAGES}|g" pyproxyhunter.py
  python pyproxyhunter.py
  sed -i 's/\t//' output.txt
  go-proxycheck -treds=${JOBS} -url=${SITE} -in=output.txt -out=${DIR}/goodlist.txt
else
  exec "$@"
fi
