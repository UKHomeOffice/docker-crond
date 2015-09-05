#!/bin/bash -ex

# Add our cron - commented out as got "better" idea
#env > /env.txt
#echo "${CRON_TIME} ${CRON_USER} source /env.txt && ${CRON_CMD} > /dev/stdout 2>&1" >> /etc/crontab


# Run crond as pid 1.  
exec /usr/bin/crond -n -s
