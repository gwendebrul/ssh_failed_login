#!/bin/bash

source ./.env

ATTEMPTS=$(grep -a -E 'invalid|REFUSED' /var/log/auth.log|grep -a -E "$(date +'%B %e')")

ATTEMPTS_COUNT=$(echo "$ATTEMPTS"|wc -l)

MESSAGE=$(echo -e "on $(date +'%B %e %Y') there were $ATTEMPTS_COUNT failed login attempts on $(hostname)\n\n$ATTEMPTS")

curl -s --user "api:$MAILGUN_API_KEY" \
  https://api.mailgun.net/v3/"$MAILGUN_DOMAIN"/messages \
  -F from="$MAILGUN_SENDER_NAME <$MAILGUN_SENDER_EMAIL>" \
  -F to=gwen@debrul.be \
  -F subject="Daily Security Report on $(hostname)" \
  -F text="$MESSAGE"


echo


