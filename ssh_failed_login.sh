#!/bin/bash

source ./.env

ATTEMPTS=$(grep -a -E 'invalid|REFUSED' /var/log/auth.log|grep -a -E "$(date +'%e')"|grep -a -E "preauth")

ATTEMPTS_COUNT=$(echo "$ATTEMPTS"|wc -l)

MESSAGE=$(echo -e "on $(date +'%B %e %Y') there were $ATTEMPTS_COUNT failed login attempts on $(hostname)")

curl -X POST -H "Content-Type: application/json" -d "{\"value1\":\"$MESSAGE\"}" $IFTTT_FAILED_SSH
#echo "{\"value1\":\"$MESSAGE\"}" $IFTTT_FAILED_SSH
