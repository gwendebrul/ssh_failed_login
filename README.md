# SSH FAILED LOGIN

## setup
create a webhook at IFTTT.com, test the url call and copy the url for the webhook.

This URL will be used in the SSH FAILED LOGIN script.

## create .env
create a .env file in the script's folder.
Add following to the file.

```bash
IFTTT_FAILED_SSH="<URL of Webhook>"
```

## Insert absolute path in script

Open ssh_failed_login.sh and add the absolute path to the script's folder instead of /home/gwen/ssh_failed_login

## Add script to crontab

open crontab for editing


```bash
sudo crontab -e
```

add the time and script to the crontab file

example:

30 22 * * * /home/gwen/ssh_failed_login/ssh_failed_login.sh

You can test if your script is succesfully added by changing 30 22 to */1 *

This will execute the cron job every minute. If it's working change to the time you want to execute the script.

That's it ;-)
