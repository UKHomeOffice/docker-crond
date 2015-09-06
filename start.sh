#!/bin/bash -ex

# cron doesn't have acces to env, this is simpler than fixing that

# Make sure share dir exists
if [ ! -d "$SHARE_DIR" ]; then
  mkdir -p ${SHARE_DIR}
fi

# Add user.  We don't always need it but might be important for gitlab for example.
useradd  ${CRON_USER}

while true; do
  # Sleep the interval.
  sleep ${CRON_TIME}

  # Run the CRON COMMAND
  /bin/bash -c "${CRON_CMD}"
done;
