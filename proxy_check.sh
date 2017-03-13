#!/bin/sh

PROXY=${1}

IP=$(echo ${PROXY} | sed 's/:.*//')
STATUS=$(curl --max-time 2 -s -x ${PROXY} -o /dev/null -w '%{http_code}' ${SITE})
CHECK_IN_LIST=$(cat ${DIR}/good_list.txt | grep ${IP} 2>/dev/null)
if [ -z "$CHECK_IN_LIST" ]; then
  if [ ${STATUS} -eq 200 ]; then
    echo GOOD: ${PROXY}
    echo "${PROXY}" >> ${DIR}/good_list.txt
  else
    echo BAD: ${PROXY}
  fi
fi
