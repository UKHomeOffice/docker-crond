#!/bin/bash -ex

# cron doesn't have acces to env, this is simpler than fixing that.
useradd  ${CRON_USER}
mkdir -p ${SHARE_DIR}

while true; do
  # Sleep the interval.
  sleep ${CRON_TIME}

  # Run the CRON COMMAND
  /bin/bash -c "${CRON_CMD}"
done;
