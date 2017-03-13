#!/bin/sh
if [ $# -eq 0 ]; then
  sed -i "s|threads=500|threads=${TREADS}|g" pyproxyhunter.py
  sed -i "s|pages=1|pages=${PAGES}|g" pyproxyhunter.py
  if [ ! -f ${DIR}/good_list.txt ]; then
    touch ${DIR}/good_list.txt
  fi
  python pyproxyhunter.py
  parallel -j${JOBS} "./proxy_check.sh {}" <output.txt
else
  exec "$@"
fi
