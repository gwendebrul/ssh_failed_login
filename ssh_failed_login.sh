#!/usr/bin/env bash

##### Add the absolute path to the ssh_failed_login folder
PATH_SCRIPT=/home/gwen/ssh_failed_login
#### End edit

source $PATH_SCRIPT/.env


ATTEMPTS=$(grep -a -E 'invalid|REFUSED' /var/log/auth.log|grep -a -E "$(date +'%b %e')"|grep "preauth")

if [ "$ATTEMPTS" != "" ]; then
  ATTEMPTS_COUNT=$(echo "$ATTEMPTS"|wc -l)
else
  ATTEMPTS_COUNT=0
fi

MESSAGE=$(echo -e "on $(date +'%B %e %Y') there were $ATTEMPTS_COUNT failed login attempts on $(hostname)")

curl -S -s -X POST -H "Content-Type: application/json" -d "{\"value1\":\"$MESSAGE\"}" $IFTTT_FAILED_SSH >/dev/null 2>&1

