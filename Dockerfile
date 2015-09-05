FROM quay.io/ukhomeofficedigital/docker-centos-base

ENV CRON_USER cron
ENV APP_DATA /var/data
ENV BACKUP_DIR /var/backups
ENV SHARE_DIR ${BACKUP_DIR}/share

# Setup defaults for backups
ENV CRON_TIME "0 */2 * * *"
ENV CRON_USER ${APP_USER}
ENV CRON_CMD  'mysqldump -u ${DB_USER} -p${DB_PASS} -h ${DB_HOST} ${DB_NAME} > ${APP_DATA}/${DB_NAME}.sql \
              tar zcvf ${BACKUP_DIR}/${DB_NAME}-$(date +%s).tar.gz ${APP_DATA} \
              rm ${APP_DATA}/${DB_NAME}.sql \
              mv *.tar.gz ${SHARE_DIR}'
RUN mkdir -p ${SHARE_DIR}

# Install supervsior, crond & mysql client.
RUN yum update -y && \
    yum install -y \
      cronie-noanacron \
    yum -y clean all§

# Configure config before being replaced by exec'd cmd.
COPY start.sh /
CMD ["/start.sh"]
