#!/bin/bash -ex

# cron doesn't have acces to env, this is simpler than fixing that.
useradd -D ${CRON_USER}

# Sleep the interval.
sleep ${CRON_TIME}

# Run the CRON COMMAND
${CRON_CMD}

# Should happily exit, then the container will restart and sleep again.
